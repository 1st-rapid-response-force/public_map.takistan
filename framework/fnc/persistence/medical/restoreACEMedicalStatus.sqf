/*
	File: restoreACEMedicalStatus.sqf

	Description:
	Restores ACE medical system on player

	Parameter(s):
  _this:	OBJECT	- Player Object that needs to be restored
          Array - ACE Medical Array from Fusion

	Returns: Nothing
*/

_player = _this select 0;
_medical = _this select 1;

// Restore Medical Status
_player setVariable ["ace_medical_pain",(_medical select 0),false];
_player setVariable ["ace_medical_morphine",(_medical select 1),false];
_player setVariable ["ace_medical_bloodvolume",(_medical select 2),false];
_player setVariable ["ace_isunconscious",(_medical select 3),false];
_player setVariable ["ace_medical_tourniquets",(_medical select 4),false];
_player setVariable ["ace_medical_openwounds",(_medical select 5),false];
_player setVariable ["ace_medical_bandagedwounds",(_medical select 6),false];
_player setVariable ["ace_medical_internalwounds",(_medical select 7),false];
_player setVariable ["ace_medical_lastuniquewoundid",(_medical select 8),false];
_player setVariable ["ace_medical_heartrate",(_medical select 9),false];
_player setVariable ["ace_medical_heartrateadjustments",(_medical select 10),false];
_player setVariable ["ace_medical_bloodpressure",(_medical select 11),false];
_player setVariable ["ace_medical_peripheralresistance",(_medical select 12),false];
_player setVariable ["ace_medical_fractures",(_medical select 13),false];
_player setVariable ["ace_medical_triagelevel",(_medical select 14),false];
_player setVariable ["ace_medical_triagecard",(_medical select 15),false];
_player setVariable ["ace_medical_salineivvolume",(_medical select 16),false];
_player setVariable ["ace_medical_plasmaivvolume",(_medical select 17),false];
_player setVariable ["ace_medical_bloodivvolume",(_medical select 18),false];
_player setVariable ["ace_medical_bodypartstatus",(_medical select 19),false];
_player setVariable ["ace_medical_airwaystatus",(_medical select 20),false];
_player setVariable ["ace_medical_airwayoccluded",(_medical select 21),false];
_player setVariable ["ace_medical_airwaycollapsed",(_medical select 22),false];
_player setVariable ["ace_medical_incardiacarrest",(_medical select 23),false];
_player setVariable ["ace_medical_haslostblood",(_medical select 24),false];
_player setVariable ["ace_medical_isbleeding",(_medical select 25),false];
_player setVariable ["ace_medical_haspain",(_medical select 26),false];
_player setVariable ["ace_medical_alllogs",(_medical select 27),false];
_player setVariable ["ace_medical_logFile_activity",(_medical select 28),false];
_player setVariable ["ace_medical_logFile_activity_view",(_medical select 29),false];

if (debugEnabled == 1) then {
    hint "Medical Status set on client"
};
