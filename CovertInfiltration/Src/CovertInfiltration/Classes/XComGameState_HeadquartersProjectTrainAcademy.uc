class XComGameState_HeadquartersProjectTrainAcademy extends XComGameState_HeadquartersProject;

var name NewClassName; // the name of the class the rookie will eventually be promoted to
var int RanksToAdd; // Stored here to prevent changes to max rank during project don't cause chaos

function SetProjectFocus(StateObjectReference FocusRef, optional XComGameState NewGameState, optional StateObjectReference AuxRef)
{
	local XComGameState_Unit UnitState;

	ProjectFocus = FocusRef; // Unit
	AuxilaryReference = AuxRef; // Facility
	
	StartDateTime = class'XComGameState_GeoscapeEntity'.static.GetCurrentTime();
	ProjectPointsRemaining = CalculatePointsToTrain();
	InitialProjectPoints = ProjectPointsRemaining;

	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', ProjectFocus.ObjectID));
	UnitState.SetStatus(eStatus_Training);

	RanksToAdd = Max(class'X2Helper_Infiltration'.static.GetAcademyTrainingTargetRank() - UnitState.GetSoldierRank(), 0);
	UpdateWorkPerHour(NewGameState);

	if (MakingProgress())
	{
		SetProjectedCompletionDateTime(StartDateTime);
	}
	else
	{
		// Set completion time to unreachable future
		CompletionDateTime.m_iYear = 9999;
	}
}

function int CalculatePointsToTrain()
{
	// TODO. Also, move this calculation to X2Helper_Infiltration.
	// Also MCO UIChooseClass to (1) update ClassComm.OrderHours (2) replace OnPurchaseClicked


	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;

	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	return XComHQ.GetTrainRookieDays() * 24;
}

function int CalculateWorkPerHour(optional XComGameState StartState = none, optional bool bAssumeActive = false)
{
	return 1;
}

function X2SoldierClassTemplate GetTrainingClassTemplate()
{
	return class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().FindSoldierClassTemplate(NewClassName);
}

function OnProjectCompleted()
{
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_StaffSlot SlotState;
	local XComGameState_Unit UnitState;
	local XComGameState NewGameState;
	local bool bFromRookie;
	local int i;
	
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("CI: XComGameState_HeadquartersProjectTrainAcademy completed");
	bFromRookie = NewClassName != '';

	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', ProjectFocus.ObjectID));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', `XCOMHQ.ObjectID));

	XComHQ.Projects.RemoveItem(GetReference());
	NewGameState.RemoveStateObject(ObjectID);
	UnitState.SetStatus(eStatus_Active);

	for (i = 0; i < RanksToAdd; i++)
	{
		UnitState.SetXPForRank(UnitState.GetSoldierRank() + 1);

		if (bFromRookie)
		{
			// Set StartingRank if unit is being promoted from rookie
			UnitState.StartingRank = UnitState.GetSoldierRank() + 1;
		}
		else
		{
			// Otherwise bump up the "kills" value if unit already had natural promotions
			UnitState.SetKillsForRank(UnitState.GetSoldierRank() + 1);
		}

		if (UnitState.GetSoldierRank() == 0) // Are we promoting from rookie in this iteration?
		{
			UnitState.RankUpSoldier(NewGameState, NewClassName);
			UnitState.ApplySquaddieLoadout(NewGameState, XComHQ);
			UnitState.ApplyBestGearLoadout(NewGameState); // Make sure the squaddie has the best gear available
		}
		else
		{
			UnitState.RankUpSoldier(NewGameState);
		}
	}

	// Remove the soldier from the staff slot
	SlotState = UnitState.GetStaffSlot();
	if (SlotState != none)
	{
		SlotState.EmptySlot(NewGameState);
	}

	`SubmitGameState(NewGameState);
	`HQPRES.UITrainingComplete(ProjectFocus);
}