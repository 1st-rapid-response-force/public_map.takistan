/*
	File: marksmanRangeScript.sqf

	Description:
	Initializes the range script for any calling range

	Parameter(s):
  	_this:	0 - int - Lane Number
  			1 - array - Targets in an Array
  			2 - int - Time between targets
  			3 - bool - Determine if score should be sent to Catalyst

	Returns:
	Nothing
*/

//Variable Setup
_player = player;
_ownerID = owner player;
_uuid = getPlayerUID _player;
_name = name player;
_weapon = currentWeapon _player;

_rangeType = "Marksman (Water) Range";
_laneScore = 0;
_stageMaxScore = 0;
_qualification = "Unset";
_laneNum = _this select 0;
_rangeArray = _this select 1;
_timeBetweenTargets = _this select 2;
_storeResult = _this select 3;
_rangeId = _this select 4;

// Call Function on Server by sending it the neccessary information
[_rangeId] remoteExecCall ["rrf_fnc_training_serverRangeStart", 2];

fnc_target ={
	_object = _this select 0;
	_laneNum = _this select 1;
	_rangeId = _this select 2;
	_object removeAllEventHandlers "HitPart";
	// Call Function on Server by sending it the neccessary information
	[_rangeId] remoteExecCall ["rrf_fnc_training_serverRangeHit", 2];

};



fnc_countDown10 = {
	for "_i" from 5 to 0 step -1 do {
		hint format ["Range Hot in: %1",_i];
		sleep 1;
	};
	playSound "Alarm";
	hint "Range is HOT!";
};



//Comsmetics
titleText ["Marksman Range Qualification Course","PLAIN",1];
hint "Welcome to Marksman Range Qualification Course";
sleep 5;
hint "You will be given 20 targets in the Prone Position";
sleep 5;
hint "Please Load your Rifle";
sleep 5;
hint "USE 1 ROUND PER TARGET ONLY!";
sleep 5;
hint "PRONE POSITION";
//Begin Alarm
_null = call fnc_countDown10;
//Drop Targets
{_x animate ["terc", 1];} forEach _rangeArray;

//Standing
_stageMaxScore = 20;
sleep _timeBetweenTargets;
hint "Range is HOT!";
_previousTarget = _rangeArray select 0;

for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;
	if (_previousTarget == _target) then {
	  _target = _rangeArray call BIS_fnc_selectRandom;
	  if (_previousTarget == _target) then {
	    _target = _rangeArray call BIS_fnc_selectRandom;
	  };
	};
	_target addEventHandler ["HitPart", format ["_null = [%1,%2,%3] call fnc_target", _target, _laneNum,_rangeId]];
	_target animate ["terc", 0];
	sleep _timeBetweenTargets;
	_target animate ["terc", 1];
	_previousTarget = _target;
	sleep _timeBetweenTargets;
	_target removeAllEventHandlers "HitPart";
};

[_rangeId,20,player,_ownerID] remoteExecCall ["rrf_fnc_training_serverRangeReport", 2];

//Reset Range
sleep 5;
{_x animate ["terc", 0];} forEach _rangeArray;
hint "CEASE FIRE - RANGE IS CLEAR. Return to your instructor for further details.";

//Submit Score to all Clients
// We will need to create a method for storing this information
if (rrfFusion == 1) then {
	if (_storeResult == 1) then {
	    _store = [_uuid, _rangeType, 20, _weapon, _rangeId] remoteExecCall ["rrf_fnc_training_serverStoreRange",2];
	    RangerMaster sideChat format["MARKSMAN LANE %1 - Score has been saved to Catalyst",_laneNum];
	};
};
//

sleep 5;
