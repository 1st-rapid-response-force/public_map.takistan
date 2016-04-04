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
_rangeMaster = _this select 4;

call (compile (format ["profileNamespace setVariable [""marksman_lane_score_%1"",%2];",_laneNum,0]));

fnc_target ={
	_object = _this select 0;
	_object removeMPEventHandler ["MPHit", 0];
	_laneNum = _this select 1;
	_laneScore = call (compile (format ["profileNamespace getVariable ""marksman_lane_score_%1"";",_laneNum]));
	//Increment
	_laneScore = _laneScore+1;
	call (compile (format ["profileNamespace setVariable [""marksman_lane_score_%1"",%2];",_laneNum,_laneScore]));

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
_stageMaxScore = 10;
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
	_target addMPEventHandler ["MPHit", format ["_null = [%1,%2] call fnc_target", _target, _laneNum]];
	_target animate ["terc", 0];
	sleep _timeBetweenTargets;
	_target animate ["terc", 1];
	_previousTarget = _target;
	sleep _timeBetweenTargets;
};

_laneScore = call (compile (format ["profileNamespace getVariable ""marksman_lane_score_%1"";",_laneNum]));
hint format ["Total Score: %1/20",_laneScore];

//Reset Range
sleep 5;
{_x animate ["terc", 0];} forEach _rangeArray;
hint "CEASE FIRE - RANGE IS CLEAR. Return to your instructor for further details.";

//Submit Score to all Clients
// We will need to create a method for storing this information
if (rrfFusion == 1) then {
	if (_storeResult == 1) then {
	    _store = [_uuid, _rangeType, _laneScore, 60, _weapon] remoteExecCall ["rrf_fnc_training_serverStoreRange",2];
	    RangerMaster sideChat format["MARKSMAN LANE %1 - %2/20 - Score has been saved to Catalyst",_laneNum,_laneScore];
	};
};
//

sleep 5;
//Determine Qualification
hint format ["Final Report: %1/20 \n \n Remove the Magazine from your weapon!",_laneScore];
call (compile (format ["profileNamespace setVariable [""marksman_lane_score_%1"",%2];",_laneNum,0]));