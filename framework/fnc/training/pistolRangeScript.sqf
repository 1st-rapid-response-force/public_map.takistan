/*
	File: pistolRangeScript.sqf

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
_weapon = secondaryWeapon _player;

_rangeType = "Pistol Range";
_laneScore = 0;
_stageMaxScore = 0;
_qualification = "Unset";
_laneNum = _this select 0;
_rangeArray = _this select 1;
_timeBetweenTargets = _this select 2;
_storeResult = _this select 3;
profileNamespace setVariable ["pistol_lane_score",0];


fnc_target ={
	_object = _this select 0;
	_laneNum = _this select 1;
	_laneScore = profileNamespace getVariable "pistol_lane_score";
	//Increment
	_laneScore = _laneScore+1;
	profileNamespace setVariable ["pistol_lane_score",_laneScore];
	RangerMaster sideChat format["RIFLE LANE %1 - %2/60",_laneNum,_laneScore];
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

titleText ["Pistol Range Qualification Course","PLAIN",1];
hint "Welcome to Pistol Range Qualification Course";
sleep 5;
hint "You will be given 30 Targets in the Standing Position (REST AT 15), Shoot ONLY ONE ROUND per target.";
sleep 5;
hint "Please Load your Pistol";
sleep 5;
hint "STANDING POSITION";
//Begin Alarm
_null = call fnc_countDown10;
//Drop Targets
{_x animate ["terc", 1];} forEach _rangeArray;
{_x addMPEventHandler ["MPHit", format ["_null = [%1,%2] call fnc_target", _x, _laneNum]];} forEach _rangeArray;
//Standing
_stageMaxScore = 15;
titleText ["Standing - 15 Round","PLAIN",1];
sleep _timeBetweenTargets;
hint "Range is HOT!";
for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;
	_target animate ["terc", 0];
	sleep _timeBetweenTargets;
	_target animate ["terc", 1];
};
_rifleArray = RangerMaster getVariable "pistolScores";
_laneScore = profileNamespace getVariable "pistol_lane_score";
hint format ["Total Score: %1/30",_laneScore];

//Standing
_stageMaxScore = 15;
titleText ["Standing - 15 Round (FINAL)","PLAIN",1];
sleep _timeBetweenTargets;
hint "Range is HOT!";
for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;
	_target animate ["terc", 0];
	sleep _timeBetweenTargets;
	_target animate ["terc", 1];
};
_rifleArray = RangerMaster getVariable "pistolScores";
_laneScore = profileNamespace getVariable "pistol_lane_score";
hint format ["Total Score: %1/30",_laneScore];


//Reset Range
sleep 5;
{_x removeMPEventHandler ["MPHit", 0];} forEach _rangeArray;
{_x animate ["terc", 0];} forEach _rangeArray;
hint "CEASE FIRE - RANGE IS CLEAR. Return to your instructor for further details.";

//Submit Score to all Clients
// We will need to create a method for storing this information
//[_uuid,_name] remoteExecCall ["rrf_fnc_training_serverStoreRange",2];

sleep 5;
//Determine Qualification
hint format ["Final Report: %1/30 \n \n Remove the Magazine from your weapon!",_laneScore];

