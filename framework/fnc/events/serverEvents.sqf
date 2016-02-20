/*
	File: serverEvents.sqf

	Description:
	The Server Event handler registers multiple events for analytics
  handling.

	Parameter(s): None

	Returns: Nothing
*/

onPlayerConnected {
  _analystics = ["User Connected",_uid] spawn rrf_fnc_analytics_analyticEvent;
};

onPlayerDisconnected {
    _analystics = ["User Disconnected",_uid] spawn rrf_fnc_analytics_analyticEvent;
};
