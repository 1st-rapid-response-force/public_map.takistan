/*
	File: playerDisconnect.sqf

	Description:
	Deletes Corpse

	Parameter(s):
  	_this:
		0 - integer - Range ID
  		1 - array - integers - lane numbers

	Returns:
	Nothing
*/
params [["_corpse",0]];

deleteVehicle _corpse;

// We could also implement a position save function here if we used the event handler code