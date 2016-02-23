/*
	File: setupTOC.sqf

	Description:
	Handles Init for TOC Setup, adds interactions

	Parameter(s):
  _this:	OBJECT	- Object that will have the new options added

	Returns:
	Nothing
*/

_objects = _this select 0;


{

//Ace Interactions
// [name, displayname, statement, condition -> optional]
_action = ["Computer","Computer","",{},{true}] call ace_interact_menu_fnc_createAction;
[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = ['laptop_getOS','Open CoalaOS','',{[] call rrf_fnc_toc_openCoalaOS},{true}] call ace_interact_menu_fnc_createAction;
[_x, 0, ["ACE_MainActions","Computer"], _action] call ace_interact_menu_fnc_addActionToObject;


} forEach _objects;

monitor6 setObjectTextureGlobal [0, "framework\img\callcard_1.jpg"];