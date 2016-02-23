/*
	File: removeLoadoutBox.sqf

	Description:
	A function used to add action of removing a box once a loadout box is spawned

	Parameter(s):
  _this:	OBJECT	- Box that needs to be removed

	Returns:
	Nothing
*/
if (isDedicated) exitWith {};

_case = _this select 0;

//Ace Interactions
// [name, displayname, statement, condition -> optional]
_action = ["removeLoadoutBox","Return Loadout Box","",{deleteVehicle (_this select 0);},{true}] call ace_interact_menu_fnc_createAction;
[_case, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
