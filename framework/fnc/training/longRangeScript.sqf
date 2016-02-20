/*
	File: LongRangeScript.sqf

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

_rangeType = "AR/M203 Range 300m";
laneScore = 0;
_stageMaxScore = 0;
_qualification = "Unset";
_laneNum = _this select 0;
_rangeArray = _this select 1;
_timeBetweenTargets = _this select 2;
_timeBetweenTargetsRapid = _this select 2;
_storeResult = _this select 3;



hint format ["%1, \nMilitary ID Number: %2. \Lane %3 has been activated.", _name,_uuid,_laneNum];

fnc_countDown10 = {
	for "_i" from 5 to 0 step -1 do {
		hint format ["Range Hot in: %1",_i];
		sleep 1;
	};
	playSound "Alarm";
	hint "Range is HOT!";
};



//Comsmetics

titleText ["AR/M203 Range Qualification Course","PLAIN",1];
hint "Welcome to AR/M203 Range Qualification Course";
sleep 5;
hint "You will be given multiple targets which will pop up in groups, your goal is to take each pop up group down.";
sleep 5;
hint "Please Load your Weapon";
sleep 5;

//Begin Alarm
_null = call fnc_countDown10;
//Drop Targets
{
	{_x animate ["terc", 1];} forEach _x;
} forEach _rangeArray;

//sleep 5;
_stageMaxScore = 10;
hint "Range is HOT!";
for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;

	{_x animate ["terc", 0];} forEach _target;
	sleep _timeBetweenTargets;
	{_x animate ["terc", 1];} forEach _target;
	
};


//Reset Targets
{
	{_x animate ["terc", 0];} forEach _x;
} forEach _rangeArray;


//Reset Range
sleep 5;
hint "CEASE FIRE - RANGE IS CLEAR. Return to your instructor for further details.";

sleep 5;


