/*
	File: rifleRangeScript.sqf

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
_weapon = primaryWeapon _player;

_rangeType = "Rifle Range 250m";
_laneScore = 0;
_stageMaxScore = 0;
_qualification = "Unset";
_laneNum = _this select 0;
_rangeArray = _this select 1;
_timeBetweenTargets = _this select 2;
_storeResult = _this select 3;
_player setVariable ["laneScore", 0, false];
_player setVariable ["laneNum", _laneNum, false];


hint format ["%1, \nMilitary ID Number: %2. \Lane %3 has been activated.", _name,_uuid,_laneNum];


fnc_target ={
	_player = _this select 0;
	_playerName = name _player;
	_laneScore = _player getVariable ["laneScore",0];
	_laneScore = _laneScore+1;
	_player setVariable ["laneScore",_laneScore,false];
	RangerMaster sideChat  format["Rifle Range - %1 - Hit - %2/40",_playerName,_laneScore];
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

titleText ["Rifle Range 250m Qualification Course","PLAIN",1];
hint "Welcome to Rifle Range 250m Qualification Course";
sleep 5;
hint "You will be given 10 Targets in the Standing Position, 10 Targets in the Crouch Position, and 10 targets in the Prone Position";
sleep 5;
hint "Please Load your Rifle";
sleep 5;
hint "USE 1 ROUND PER TARGET!";
sleep 5;
hint "STANDING POSITION";
//Begin Alarm
_null = call fnc_countDown10;
//Drop Targets



{_x animate ["terc", 1];} forEach _rangeArray;
//Add Event Handlers on all Targets
_rangeArray select 0 addMPEventHandler ["MPHit", "_null = [player] call fnc_target"];
_rangeArray select 1 addMPEventHandler ["MPHit", "_null = [player] call fnc_target"];
_rangeArray select 2 addMPEventHandler ["MPHit", "_null = [player] call fnc_target"];
_rangeArray select 3 addMPEventHandler ["MPHit", "_null = [player] call fnc_target"];
_rangeArray select 4 addMPEventHandler ["MPHit", "_null = [player] call fnc_target"];


//call fnc_countDown10;

//Standing
_stageMaxScore = 10;
titleText ["Standing - 10 Round","PLAIN",1];
sleep _timeBetweenTargets;
hint "Range is HOT!";
for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;
	animateUp = _target; publicVariable "animateUp"; _target animate ["terc", 0];
	sleep _timeBetweenTargets;
	animateDown = _target; publicVariable "animateDown"; _target animate ["terc", 1];
};
_laneScore = player getVariable ['laneScore',0];
hint format ["Total Score: %1/40",_laneScore];

//Crouch
sleep 5;
hint "Prepare for Crouch Qualification";
hint "Go to the Crouch Position";
sleep 5;
titleText ["Crouch - 10 Round","PLAIN",1];
_stageMaxScore = 10;
sleep _timeBetweenTargets;

hint "Range is HOT!";
for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;
	animateUp = _target; publicVariable "animateUp"; _target animate ["terc", 0];
	sleep _timeBetweenTargets;
	animateDown = _target; publicVariable "animateDown"; _target animate ["terc", 1];
};
_laneScore = player getVariable ['laneScore',0];
hint format ["Total Score: %1/40",_laneScore];

//Prone
sleep 5;
hint "Prepare for Prone Qualification";
hint "Go to the Prone Position";
sleep 5;
hint "Prone Unsupported";
titleText ["Prone - 20 Round","PLAIN",1];
_stageMaxScore = 20;

sleep _timeBetweenTargets;

hint "Range is HOT!";
for "_i" from 1 to (_stageMaxScore) do {
	_target = _rangeArray call BIS_fnc_selectRandom;
	animateUp = _target; publicVariable "animateUp"; _target animate ["terc", 0];
	sleep _timeBetweenTargets;
	animateDown = _target; publicVariable "animateDown"; _target animate ["terc", 1];
};

_laneScore = player getVariable ['laneScore',0];
hint format ["Total Score: %1/40",_laneScore];

//Add Event Handlers on all Targets
_rangeArray select 0 removeMPEventHandler ["MPHit", 0];
_rangeArray select 1 removeMPEventHandler ["MPHit", 0];
_rangeArray select 2 removeMPEventHandler ["MPHit", 0];
_rangeArray select 3 removeMPEventHandler ["MPHit", 0];
_rangeArray select 4 removeMPEventHandler ["MPHit", 0];

//Reset Range
sleep 5;
{_x animate ["terc", 0];} forEach _rangeArray;
hint "CEASE FIRE - RANGE IS CLEAR. Return to your instructor for further details.";

//Submit Score to all Clients
// We will need to create a method for storing this information
//[_uuid,_name] remoteExecCall ["rrf_fnc_training_serverStoreRange",2];

sleep 5;
//Determine Qualification
hint format ["Final Report: %1/40 \n \n Remove the Magazine from your weapon!",_laneScore];

