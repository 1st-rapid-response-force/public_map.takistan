/*
	File: setupArmory.sqf

	Description:
	Handles Init for Armory Setup, adds interactions

	Parameter(s):
  _this:	OBJECT	- Armorer Unit that will have the new options added to him

	Returns:
	Nothing
*/

_armorer = _this select 0;


//Ace Interactions
// [name, displayname, statement, condition -> optional]
_action = ["Armory","Armory","",{},{true}] call ace_interact_menu_fnc_createAction;
[_armorer, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = ['Armory_getLoadout','Request Loadout','',{[] call rrf_fnc_loadout_getLoadout},{true}] call ace_interact_menu_fnc_createAction;
[_armorer, 0, ["ACE_MainActions","Armory"], _action] call ace_interact_menu_fnc_addActionToObject;
