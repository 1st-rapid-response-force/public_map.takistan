/*
	File: getLoadout.sqf

	Description:
	This is the player side function that will allow the script to get all neccessary
  before passing it to the server to make the function call.

	Parameter(s):
  _this:	OBJECT	- Armorer Unit that will serve as the base armorer

	Returns:
	Nothing
*/

_player = player;
_uuid = getPlayerUID _player;
_name = name player;
hint format ["%1, \nMilitary ID Number: %2. \nLoadout request received, one moment.", _name,_uuid];


// Call Function on Server by sending it the neccessary information
[_uuid,_name] remoteExecCall ["rrf_fnc_loadout_serverGetLoadout",2];
