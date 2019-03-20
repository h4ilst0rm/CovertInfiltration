//---------------------------------------------------------------------------------------
//  AUTHOR:  statusNone
//  PURPOSE: Class to add custom SitReps Templates
//---------------------------------------------------------------------------------------
//  WOTCStrategyOverhaul Team
//---------------------------------------------------------------------------------------

class X2SitRep_InfiltrationSitRepEffects extends X2SitRepEffect;

var localized string strBannerMessage;
var localized string strBannerSubtitle;
var localized string strBannerValue;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;
    
    // granted abilities
    Templates.AddItem(CreateInformationWarDebuffEffect_CI());
    Templates.AddItem(CreateFamiliarTerrainEffectTemplate_CI());
    Templates.AddItem(CreatePhysicalConditioningEffectTemplate_CI());
    Templates.AddItem(CreateMentalReadinessEffectTemplate_CI());
    Templates.AddItem(CreateLightningStrikeEffect_CI());
    Templates.AddItem(CreateIntelligenceLeakDebuffEffect_CI());
    Templates.AddItem(CreateTacticalAnalysisAbilityTemplate_CI());

    // podsize & encounters
    Templates.AddItem(CreateGunneryEmplacementsEffectTemplate_CI());
    Templates.AddItem(CreatePhalanxEffectTemplate_CI());
    Templates.AddItem(CreateCongregationEffectTemplate_CI());

    // kismet variables
    Templates.AddItem(CreateShoddyIntelEffectTemplate_CI());
    Templates.AddItem(CreateWellRehearsedEffectTemplate_CI());
    
    // tactical startstate
    Templates.AddItem(CreateNoSquadConcealmentEffectTemplate_CI());
    Templates.AddItem(CreateVolunteerArmyEffectTemplate_CI());
    Templates.AddItem(CreateDoubleAgentEffectTemplate_CI());
    Templates.AddItem(CreateTacticalAnalysisEffectTemplate_CI());
    Templates.AddItem(CreateAdventAirPatrolsEffectTemplate_CI());
    Templates.AddItem(CreateCommsJammingEffectTemplate_CI());

    // misc
    Templates.AddItem(CreateInformationWarEffectTemplate_CI());

    return Templates;
}

/////////////////////////
/// Granted Abilities ///
/////////////////////////

static function X2SitRepEffectTemplate CreateInformationWarDebuffEffect_CI()
{
   local X2SitRepEffect_GrantAbilities Template;

   `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'InformationWarDebuffEffect_CI');
   
   Template.AbilityTemplateNames.AddItem('InformationWarDebuff_CI');

   Template.Teams.AddItem(eTeam_Alien);
   Template.RequireRobotic = true;

   return Template;
}

static function X2SitRepEffectTemplate CreateFamiliarTerrainEffectTemplate_CI()
{
    local X2SitRepEffect_GrantAbilities Template;
    
    `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'FamiliarTerrainEffect_CI')

    Template.AbilityTemplateNames.AddItem('FamiliarTerrainBuff_CI');
    Template.GrantToSoldiers = true;

    return Template;
}

static function X2SitRepEffectTemplate CreatePhysicalConditioningEffectTemplate_CI()
{
    local X2SitRepEffect_GrantAbilities Template;
    
    `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'PhysicalConditioningEffect_CI')

    Template.AbilityTemplateNames.AddItem('PhysicalConditioningBuff_CI');
    Template.GrantToSoldiers = true;

    return Template;
}

static function X2SitRepEffectTemplate CreateMentalReadinessEffectTemplate_CI()
{
    local X2SitRepEffect_GrantAbilities Template;
    
    `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'MentalReadinessEffect_CI')

    Template.AbilityTemplateNames.AddItem('MentalReadinessBuff_CI');
    Template.GrantToSoldiers = true;

    return Template;
}

static function X2SitRepEffectTemplate CreateLightningStrikeEffect_CI()
{
    local X2SitRepEffect_GrantAbilities Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'LightningStrikeEffect_CI')

    Template.AbilityTemplateNames.AddItem('LightningStrike');
    Template.GrantToSoldiers = true;

    return Template;
}

static function X2SitRepEffectTemplate CreateIntelligenceLeakDebuffEffect_CI()
{
    local X2SitRepEffect_GrantAbilities Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'IntelligenceLeakDebuffEffect_CI')

    Template.AbilityTemplateNames.AddItem('IntelligenceLeakDebuff_CI');
    Template.GrantToSoldiers = true;

    return Template;
}

static function X2SitRepEffectTemplate CreateTacticalAnalysisAbilityTemplate_CI()
{
    local X2SitRepEffect_GrantAbilities  Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_GrantAbilities', Template, 'TacticalAnalysisAbility_CI');

    Template.AbilityTemplateNames.AddItem('TacticalAnalysis');

    return Template;
}

//////////////////
/// Encounters ///
//////////////////

static function X2SitRepEffectTemplate CreateGunneryEmplacementsEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTurretCount Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTurretCount', Template, 'GunneryEmplacementsEffect_CI');

    Template.MinCount = 2;
    Template.MaxCount = 2;
    Template.CountDelta = 2;
    Template.ZoneWidthDelta = 16;
    Template.ZoneOffsetDelta = -16;

    return Template;
}

static function X2SitRepEffectTemplate CreatePhalanxEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyDefaultEncounterLists Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyDefaultEncounterLists', Template, 'PhalanxEffect_CI');

    Template.DefaultLeaderListOverride = 'PhalanxLeaders';

    return Template;
}

static function X2SitRepEffectTemplate CreateCongregationEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyDefaultEncounterLists Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyDefaultEncounterLists', Template, 'CongregationEffect_CI');

    Template.DefaultLeaderListOverride = 'CongregationLeaders';

    return Template;
}

////////////////////////
/// Kismet Variables ///
////////////////////////

static function X2SitRepEffectTemplate CreateShoddyIntelEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyKismetVariable Template;

	`CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyKismetVariable', Template, 'ShoddyIntelEffect_CI');

	Template.VariableNames.AddItem("Timer.DefaultTurns");
	Template.VariableNames.AddItem("Timer.LengthDelta");
	Template.VariableNames.AddItem("Mission.TimerLengthDelta");
	Template.ValueAdjustment = -1;

	return Template;
}

static function X2SitRepEffectTemplate CreateWellRehearsedEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyKismetVariable Template;

	`CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyKismetVariable', Template, 'WellRehearsedEffect_CI');

	Template.VariableNames.AddItem("Timer.DefaultTurns");
	Template.VariableNames.AddItem("Timer.LengthDelta");
	Template.VariableNames.AddItem("Mission.TimerLengthDelta");
	Template.ValueAdjustment = 1;

	return Template;
}

///////////////////////////
/// Tactical StartState ///
///////////////////////////

static function X2SitRepEffectTemplate CreateNoSquadConcealmentEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTacticalStartState Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTacticalStartState', Template, 'NoSquadConcealmentEffect_CI');

    Template.ModifyTacticalStartStateFn = RemoveSquadConcealment;

    return Template;
}

static function RemoveSquadConcealment(XComGameSTate StartState)
{
    local XComGameState_BattleData BattleData;
    
    foreach StartState.IterateByClassType(class'XComGameState_BattleData', BattleData)
    {
        break;
    }
    `assert(BattleData != none);

    BattleData.bForceNoSquadConcealment = true;
}

static function X2SitRepEffectTemplate CreateVolunteerArmyEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTacticalStartState Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTacticalStartState', Template, 'VolunteerArmyEffect_CI');

    Template.ModifyTacticalStartStateFn = VolunteerArmyTacticalStartModifier;
    
    return Template;
}

static function VolunteerArmyTacticalStartModifier(XComGameState StartState)
{
    local XComGameState_HeadquartersXCom XComHQ;
    local name VolunteerCharacterTemplate;

    foreach StartState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
    {
        break;
    }
    `assert(XComHQ != none);

    if (XComHQ.IsTechResearched('PlasmaRifle'))
    {
        VolunteerCharacterTemplate = class'X2StrategyElement_XpackResistanceActions'.default.VolunteerArmyCharacterTemplateM3;
    }
    else if (XComHQ.IsTechResearched('MagnetizedWeapons'))
    {
        VolunteerCharacterTemplate = class'X2StrategyElement_XpackResistanceActions'.default.VolunteerArmyCharacterTemplateM2;
    }
    else
    {
        VolunteerCharacterTemplate = class'X2StrategyElement_XpackResistanceActions'.default.VolunteerArmyCharacterTemplate;
    }

    XComTeamSoldierSpawnTacticalStartModifier(VolunteerCharacterTemplate, StartState);
}

static function X2SitRepEffectTemplate CreateDoubleAgentEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTacticalStartState Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTacticalStartState', Template, 'DoubleAgentEffect_CI');

    Template.ModifyTacticalStartStateFn = DoubleAgentTacticalStartModifier;
    
    return Template;
}

static function DoubleAgentTacticalStartModifier(XComGameState StartState)
{
    local array<DoubleAgentData> DoubleAgentPotentials;
    local XComGameState_BattleData BattleData;
	local XComGameState_HeadquartersXCom XComHQ;
	local DoubleAgentData DoubleAgent;
	local int CurrentForceLevel, Rand;

    DoubleAgentPotentials = class'X2StrategyElement_XpackResistanceActions'.default.DoubleAgentCharacterTemplates;

	foreach StartState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
    {
		break;
    }
    `assert( XComHQ != none );

	foreach StartState.IterateByClassType(class'XComGameState_BattleData', BattleData)
	{
		break;
	}
	`assert( BattleData != none );

	CurrentForceLevel = BattleData.GetForceLevel();
	foreach DoubleAgentPotentials(DoubleAgent)
	{
		if ((CurrentForceLevel < DoubleAgent.MinForceLevel) || (CurrentForceLevel > DoubleAgent.MaxForceLevel))
		{
			DoubleAgentPotentials.RemoveItem(DoubleAgent);
		}
	}

	if (DoubleAgentPotentials.Length > 0)
	{
		Rand = `SYNC_RAND_STATIC(DoubleAgentPotentials.Length);
		XComTeamSoldierSpawnTacticalStartModifier(DoubleAgentPotentials[Rand].TemplateName, StartState);
	}
	else
	{
		DoubleAgentPotentials = class'X2StrategyElement_XpackResistanceActions'.default.DoubleAgentCharacterTemplates;
        Rand = `SYNC_RAND_STATIC(DoubleAgentPotentials.Length);
		XComTeamSoldierSpawnTacticalStartModifier(DoubleAgentPotentials[Rand].TemplateName, StartState);
	}
}

static function XComTeamSoldierSpawnTacticalStartModifier(name CharTemplateName, XComGameState StartState)
{
	local X2CharacterTemplate CharacterTemplate;
    local array<X2AbilityTemplate> Abilities;
    local X2AbilityTemplate AbilityTemplate;
	local XComGameState_Unit SoldierState;
	local XGCharacterGenerator CharacterGenerator;
	local XComGameState_Player PlayerState;
	local TSoldier Soldier;
	local XComGameState_HeadquartersXCom XComHQ;

	// generate a basic resistance soldier unit
	CharacterTemplate = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager().FindCharacterTemplate(CharTemplateName);
	`assert(CharacterTemplate != none);

	SoldierState = CharacterTemplate.CreateInstanceFromTemplate(StartState);
	SoldierState.bMissionProvided = true;
    Abilities = GetTempSoldierAbilities();

	if (CharacterTemplate.bAppearanceDefinesPawn)
	{
		CharacterGenerator = `XCOMGRI.Spawn(CharacterTemplate.CharacterGeneratorClass);
		`assert(CharacterGenerator != none);

		Soldier = CharacterGenerator.CreateTSoldier();
		SoldierState.SetTAppearance(Soldier.kAppearance);
		SoldierState.SetCharacterName(Soldier.strFirstName, Soldier.strLastName, Soldier.strNickName);
		SoldierState.SetCountry(Soldier.nmCountry);
	}
    
	foreach StartState.IterateByClassType(class'XComGameState_Player', PlayerState)
	{
		if(PlayerState.GetTeam() == eTeam_XCom)
		{
			SoldierState.SetControllingPlayer(PlayerState.GetReference());
			break;
		}
	}

	SoldierState.ApplyInventoryLoadout(StartState);

	foreach StartState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
    {
		break;
    }

    if (!SoldierState.IsSoldier())
    {
        foreach Abilities(AbilityTemplate)
        {
            class'X2TacticalGameRuleset'.static.InitAbilityForUnit(AbilityTemplate, SoldierState, StartState);			
        }
    }

	XComHQ.Squad.AddItem(SoldierState.GetReference());
	XComHQ.AllSquads[0].SquadMembers.AddItem(SoldierState.GetReference());
}

static function array<X2AbilityTemplate> GetTempSoldierAbilities()
{
    local array<X2AbilityTemplate> Templates;
    local X2AbilityTemplateManager Manager;

    Manager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    Templates.AddItem(Manager.FindAbilityTemplate('Evac'));
	Templates.AddItem(Manager.FindAbilityTemplate('PlaceEvacZone'));
	Templates.AddItem(Manager.FindAbilityTemplate('LiftOffAvenger'));

	Templates.AddItem(Manager.FindAbilityTemplate('Loot'));
	Templates.AddItem(Manager.FindAbilityTemplate('CarryUnit'));
	Templates.AddItem(Manager.FindAbilityTemplate('PutDownUnit'));

	Templates.AddItem(Manager.FindAbilityTemplate('Interact_PlantBomb'));
	Templates.AddItem(Manager.FindAbilityTemplate('Interact_TakeVial'));
	Templates.AddItem(Manager.FindAbilityTemplate('Interact_StasisTube'));
	Templates.AddItem(Manager.FindAbilityTemplate('Interact_MarkSupplyCrate'));
	Templates.AddItem(Manager.FindAbilityTemplate('Interact_ActivateAscensionGate'));

	Templates.AddItem(Manager.FindAbilityTemplate('DisableConsumeAllPoints'));

	Templates.AddItem(Manager.FindAbilityTemplate('Revive'));
	Templates.AddItem(Manager.FindAbilityTemplate('Panicked'));
	Templates.AddItem(Manager.FindAbilityTemplate('Berserk'));
	Templates.AddItem(Manager.FindAbilityTemplate('Obsessed'));
	Templates.AddItem(Manager.FindAbilityTemplate('Shattered'));

    return Templates;
}

static function X2SitRepEffectTemplate CreateTacticalAnalysisEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTacticalStartState Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTacticalStartState', Template, 'TacticalAnalysisEffect_CI');

    Template.ModifyTacticalStartStateFn = TacticalAnalysisStartModifier;

    return Template;
}

static function TacticalAnalysisStartModifier(XComGameState StartState)
{
    local XComGameState_Player Player;
    local Object PlayerObject;

    foreach StartState.IterateByClassType(class'XComGameState_Player', Player)
    {
        if (Player.GetTeam() == eTeam_XCom)
        {
            break;
        }
    }

    PlayerObject = Player;

    `XEVENTMGR.RegisterForEvent(PlayerObject, 'ScamperEnd', Player.TacticalAnalysisScamperResponse, ELD_OnStateSubmitted);
}

static function X2SitRepEffectTemplate CreateAdventAirPatrolsEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTacticalStartState Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTacticalStartState', Template, 'AdventAirPatrolsEffect_CI');

    Template.ModifyTacticalStartStateFn = AdventAirPatrolStartModifier;

    return Template;
}

static function AdventAirPatrolStartModifier(XComGameState StartState)
{
    local XComGameState_Player Player;
    local Object PlayerObject;

    foreach StartState.IterateByClassType(class'XComGameState_Player', Player)
    {
        if (Player.GetTeam() == eTeam_XCom)
        {
            break;
        }
    }

    PlayerObject = Player;

    `XEVENTMGR.RegisterForEvent(PlayerObject, 'SquadConcealmentBroken', CallReinforcements, ELD_OnStateSubmitted);
}

static function EventListenerReturn CallReinforcements(Object EventData, Object EventSource, XComGameState StartState, Name EventID, Object CallbackData)
{
    local XComTacticalMissionManager MissionManager;
    local MissionSchedule ActiveMissionSchedule;
    local int RandomEncounterID;

    MissionManager = `TACTICALMISSIONMGR;
    MissionManager.GetActiveMissionSchedule(ActiveMissionSchedule);
    RandomEncounterID = `SYNC_RAND_STATIC(ActiveMissionSchedule.PrePlacedEncounters.Length);

    class'XComGameState_AIReinforcementSpawner'.static.InitiateReinforcements(ActiveMissionSchedule.PrePlacedEncounters[RandomEncounterID].EncounterID, 1, , , 6, , , , , , , , true);
    
    return ELR_NoInterrupt;
}

static function X2SitRepEffectTemplate CreateCommsJammingEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyTacticalStartState Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyTacticalStartState', Template, 'CommsJammingEffect_CI');

    Template.ModifyTacticalStartStateFn = CommsJammingStartModifier;

    return Template; 
}

static function CommsJammingStartModifier(XComGameState StartState)
{
    local XComGameState_Player Player;
    local Object PlayerObject;

    foreach StartState.IterateByClassType(class'XComGameState_Player', Player)
    {
        if (Player.GetTeam() == eTeam_XCom)
        {
            break;
        }
    }

    PlayerObject = Player;

    `XEVENTMGR.RegisterForEvent(PlayerObject, 'ReinforcementSpawnerCreated', DelayReinforcements, ELD_OnStateSubmitted);
}

static function EventListenerReturn DelayReinforcements(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_AIReinforcementSpawner ReinforcementSpawner;
    local VisualizationActionMetadata ActionMetadata;
    local X2Action_PlayMessageBanner MessageBanner;
    local XComGameState NewGameState;

    ReinforcementSpawner = XComGameState_AIReinforcementSpawner(EventSource);

    if (ReinforcementSpawner == none)
    {
        `redscreen("SITREP_CommsJamming: could not find ReinformentSpawner, hold onto your britches bitches");

        return ELR_NoInterrupt;
    }
    // we cannot delay instant RNFs
    else if (ReinforcementSpawner.Countdown <= 0)
    {
        return ELR_NoInterrupt;
    }

    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("CI: Changing Reinforcement Spawner Countdown");

    ActionMetadata.StateObject_OldState = ReinforcementSpawner;
    ActionMetadata.StateObject_NewState = ReinforcementSpawner;

    MessageBanner = X2Action_PlayMessageBanner(class'X2Action_PlayMessageBanner'.static.AddToVisualizationTree(ActionMetadata, NewGameState.GetContext()));
    MessageBanner.AddMessageBanner(default.strBannerMessage, , default.strBannerSubtitle, default.strBannerValue, eUIState_Good);
    
    ReinforcementSpawner = XComGameState_AIReinforcementSpawner(NewGameState.ModifyStateObject(class'XComGameState_AIReinforcementSpawner', ReinforcementSpawner.ObjectID));
    ReinforcementSpawner.Countdown += 1;

    `TACTICALRULES.SubmitGameState(NewGameState);
    
    return ELR_NoInterrupt;
}

////////////
/// Misc ///
////////////

static function X2SitRepEffectTemplate CreateInformationWarEffectTemplate_CI()
{
    local X2SitRepEffect_ModifyHackDefenses Template;

    `CREATE_X2TEMPLATE(class'X2SitRepEffect_ModifyHackDefenses', Template, 'InformationWarEffect_CI');

    Template.DefenseDeltaFn = InformationWarModFunction;

    return Template;
}

static function InformationWarModFunction(out int ModValue)
{
    ModValue += `ScaleStrategyArrayInt(class'X2StrategyElement_XpackResistanceActions'.default.InformationWarReduction);
}