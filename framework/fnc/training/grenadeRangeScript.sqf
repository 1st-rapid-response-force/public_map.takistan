/*
	File: GrenadeRangeScript.sqf

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

_rangeType = "Grenade Range";
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

titleText ["Grenade Qualification Course","PLAIN",1];
hint "Welcome to Grenade Qualification Course";
sleep 5;
hint "You will be given multiple targets which will pop up in groups, your goal throw a grenade into the group safely and accurately.";
sleep 5;
hint "Remember to call out when throwing the frag --GRENADE OUT - LOCATION (example would be BUNKER 12 OCLOCK)";
sleep 5;

//Drop Targets
{
	{_x animate ["terc", 1];} forEach _x;
} forEach _rangeArray;

hint "Practice Round - 3";
sleep 5;
hint "Range is HOT!";
_stageMaxScore = 3;
for "_i" from 1 to _stageMaxScore do {
	_target = _rangeArray call BIS_fnc_selectRandom;

	{_x animate ["terc", 0];} forEach _target;
	sleep _timeBetweenTargets;
	{_x animate ["terc", 1];} forEach _target;
	
};

hint "Qualified Round - 3";
sleep 5;
hint "Range is HOT!";
_stageMaxScore = 3;
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


hint "CEASE FIRE - RANGE IS CLEAR";
sleep 5;
