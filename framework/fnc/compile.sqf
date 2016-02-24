/*
* 1st RRF - Framework - Function Compile File - compile.sqf
* Used to compile functions for use in the game.
* Version 1.0
*/

/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then {
  // Loadout
  if (rrfWebLoadout == 1) then {
    rrf_fnc_loadout_serverGetLoadout = compile preprocessfilelinenumbers "framework\fnc\armory\serverGetLoadout.sqf";
  };
  // Persistence
  if (rrfPersistence == 1) then {
    rrf_fnc_persistence_player_serverStoreLoadout =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\serverStoreLoadout.sqf';
    rrf_fnc_persistence_player_serverStorePosition =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\serverStorePosition.sqf';
    rrf_fnc_persistence_player_serverRestoreLoadout =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\serverRestoreLoadout.sqf';
    rrf_fnc_persistence_player_serverRestorePosition =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\serverRestorePosition.sqf';
    rrf_fnc_persistence_medical_serverStoreMedical =  compile preprocessfilelinenumbers 'framework\fnc\persistence\medical\serverStoreMedical.sqf';
    rrf_fnc_persistence_medical_serverRestoreMedical =  compile preprocessfilelinenumbers 'framework\fnc\persistence\medical\serverRestoreMedical.sqf';


    rrf_fnc_persistence_medical_serverACEMedicalStore = "";
  };

  rrf_fnc_analytics_analyticEvent = compile preprocessfilelinenumbers "framework\fnc\analytics\analyticEvent.sqf";
};

/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\

// Debug
if (debugEnabled == 1) then {
    rrf_fnc_debug_arrayCheck = compile preprocessfilelinenumbers "framework\fnc\debug\arrayCheck.sqf";
};

// Loadout
if (rrfWebLoadout == 1) then {
  rrf_fnc_loadout_nameLoadoutBox = compile preprocessfilelinenumbers 'framework\fnc\armory\nameLoadoutBox.sqf';
  rrf_fnc_loadout_removeLoadoutBox = compile preprocessfilelinenumbers 'framework\fnc\armory\removeLoadoutBox.sqf';
};

// Persistence
if (rrfPersistence == 1) then {
  //// Player
  rrf_fnc_persistence_player_getPlayerLoadout =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\getPlayerLoadout.sqf';
  rrf_fnc_persistence_player_restorePlayerLoadout =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\restorePlayerLoadout.sqf';
  rrf_fnc_persistence_player_getPlayerPosition =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\getPlayerPosition.sqf';
  rrf_fnc_persistence_player_restorePlayerPosition =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\restorePlayerPosition.sqf';
  rrf_fnc_persistence_medical_getPlayerMedical =  compile preprocessfilelinenumbers 'framework\fnc\persistence\medical\getACEMedicalStatus.sqf';
  rrf_fnc_persistence_medical_restorePlayerMedical =  compile preprocessfilelinenumbers 'framework\fnc\persistence\medical\restoreACEMedicalStatus.sqf';
};

// Mission Specific
rrf_fnc_training_rifleRange =  compile preprocessfilelinenumbers 'framework\fnc\training\rifleRangeScript.sqf';
rrf_fnc_training_pistolRange =  compile preprocessfilelinenumbers 'framework\fnc\training\pistolRangeScript.sqf';
rrf_fnc_training_longRange =  compile preprocessfilelinenumbers 'framework\fnc\training\longRangeScript.sqf';
rrf_fnc_training_grenadeRange =  compile preprocessfilelinenumbers 'framework\fnc\training\grenadeRangeScript.sqf';
rrf_fnc_training_serverStoreRange =  compile preprocessfilelinenumbers 'framework\fnc\training\serverStoreRange.sqf';


/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
  // Loadout
  if (rrfWebLoadout == 1) then {
    rrf_fnc_loadout_setupArmory = compile preprocessfilelinenumbers "framework\fnc\armory\setupArmory.sqf";
    rrf_fnc_loadout_getLoadout = compile preprocessfilelinenumbers "framework\fnc\armory\getLoadout.sqf";
  };

  rrf_fnc_toc_setupTOC = compile preprocessfilelinenumbers "framework\fnc\toc\setupTOC.sqf";
  rrf_fnc_toc_openCoalaOS = compile preprocessfilelinenumbers "framework\fnc\toc\openCoalaOS.sqf";

};

if (debugEnabled == 1) then {
    hint "Compiled Functions";
};
