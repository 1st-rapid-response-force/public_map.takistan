/*
	File: serverGetLoadout.sqf

	Description:
	This is the server side function that will invoke fusion in order to spawn the
  players loadout.

	Parameter(s):
  _this:	STRING	- UUID of player who invoked the function call
	STRING	- Name of player who invoked the function call

	Returns:
	Nothing
*/

_uuid = _this select 0;
_name = _this select 1;

//hint format ["%1", _name];
_analystics = ["Loadout Accessed",_uuid] spawn rrf_fnc_analytics_analyticEvent;

[[_uuid,_name]] spawn {


        private["_method", "_response", "_params"];
        _perms = _this select 0;
        _uuid = _perms select 0;
        _name = _perms select 1;
        _method = "GET_LOADOUT";
        _params = [_uuid];
        _response = [_method, _params] call sock_rpc;

		_case = "SMA_CASE_SMA_MK17" createVehicle getMarkerPos "armory_spawn";

		//Add Actions Name of Player to all boxes/ and Remove
    [_case,_name] remoteExecCall ["rrf_fnc_loadout_nameLoadoutBox",0,true];
    [_case] remoteExecCall ["rrf_fnc_loadout_removeLoadoutBox",0,true];

		clearWeaponCargoGlobal _case;
		clearItemCargoGlobal _case;

		for [{_i=0}, {_i<(count _response)}, {_i=_i+1}] do
		{
			_itemSlot = ((_response select _i) select 0);
			if ( _itemSlot == "primary"  || _itemSlot == "secondary" || _itemSlot == "launcher" ) then {
				_case addWeaponCargoGlobal [(_response select _i) select 1, 1];
			};

			if ( _itemSlot == "uniform" || _itemSlot == "vest" || _itemSlot == "helmet" || _itemSlot == "goggles" || _itemSlot == "nightvision" || _itemSlot == "binoculars" || _itemSlot == "primary_attachments" || _itemSlot == "secondary_attachments"|| _itemSlot == "items" ) then {
				_case addItemCargoGlobal [(_response select _i) select 1, 1];
			};

			if ( _itemSlot == "backpack" ) then {
				_case addBackpackCargoGlobal [(_response select _i) select 1, 1];
			};
		};
};
