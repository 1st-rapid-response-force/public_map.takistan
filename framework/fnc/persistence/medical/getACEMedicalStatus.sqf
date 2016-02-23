/*
	File: getACEMedicalStatus.sqf

	Description:
	Gathers all information current ACE medical status and stores it into an array
  to store on the server.

	Parameter(s):
  _this:	OBJECT	- Player Object that needs to be examined

	Returns: Nothing, however submits the following to Server
		String - UUID
    Array - ACE Medical Array
*/

_player = _this select 0;
_playerName = name _player;
_playerUUID = getPlayerUID _player;

// Get all ACE Init Variables
// basic
_pain = _player getVariable "ace_medical_pain";
_morphine = _player getVariable "ace_medical_morphine";
_bloodVolume = _player getVariable "ace_medical_bloodvolume";
_isUnconscious =  _player getVariable "ace_isunconscious";

//Advanced
// tourniquets
_tourniquets =  _player getVariable "ace_medical_tourniquets";

// wounds and injuries
_openWounds = _player getVariable "ace_medical_openwounds";
_bandagedWounds = _player getVariable "ace_medical_bandagedwounds";
_internalWounds = _player getVariable "ace_medical_internalwounds";
_lastUniqueWoundID =_player getVariable "ace_medical_lastuniquewoundid";

// vitals
_heartRate =_player getVariable "ace_medical_heartrate";
_heartRateAdjustments =_player getVariable "ace_medical_heartrateadjustments";
_bloodPressure =_player getVariable "ace_medical_bloodpressure";
_peripheralResistance =_player getVariable "ace_medical_peripheralresistance";

// fractures
_fractures =_player getVariable "ace_medical_fractures";

// triage card and logs
_triageLevel = _player getVariable "ace_medical_triagelevel";
_triageCard = _player getVariable "ace_medical_triagecard";

// IVs
_salineIVVolume =_player getVariable "ace_medical_salineivvolume";
_plasmaIVVolume = _player getVariable "ace_medical_plasmaivvolume";
_bloodIVVolume = _player getVariable "ace_medical_bloodivvolume";

// damage storage
_bodyPartStatus =_player getVariable "ace_medical_bodypartstatus";

// airway
_airwayStatus = _player getVariable "ace_medical_airwaystatus";
_airwayOccluded = _player getVariable "ace_medical_airwayoccluded";
_airwayCollapsed = _player getVariable "ace_medical_airwaycollapsed";

// generic medical admin
_inCardiacArrest = _player getVariable "ace_medical_incardiacarrest";
_hasLostBlood = _player getVariable "ace_medical_haslostblood";
_isBleeding = _player getVariable "ace_medical_isbleeding";
_hasPain = _player getVariable "ace_medical_haspain";

//Need to deal with non existant variables
_medicalLogs = _player getVariable ["ace_medical_alllogs",[]];
_logFile_activity = _player getVariable ["ace_medical_logFile_activity",[]];
_logFile_activity_view = _player getVariable ["ace_medical_logFile_activity_view",[]];

/*
 0 - Pain
*/
_array = [
_pain,
_morphine,
_bloodVolume,
_isUnconscious,
_tourniquets,
_openWounds,
_bandagedWounds,
_internalWounds,
_lastUniqueWoundID,
_heartRate,
_heartRateAdjustments,
_bloodPressure,
_peripheralResistance,
_fractures,
_triageLevel,
_triageCard,
_salineIVVolume,
_plasmaIVVolume,
_bloodIVVolume,
_bodyPartStatus,
_airwayStatus,
_airwayOccluded,
_airwayCollapsed,
_inCardiacArrest,
_hasLostBlood,
_isBleeding,
_hasPain,
_medicalLogs,
_logFile_activity,
_logFile_activity_view];

// Call Function on Server by sending it the neccessary information
[_playerUUID,_array] remoteExecCall ["rrf_fnc_persistence_medical_serverStoreMedical", 2];
