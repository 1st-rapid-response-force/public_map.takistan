/*
  File: CoalaOsMain.sqf
  Creator: Niky
  Date: 11.03.2015
*/

/*    ___..._           _...___
   /'--.._ `'-="""=-'` _..--'\
   |   ~. )  _     _  ( .~   |
    \  '~/   a  _  a   \~'  /
     \  `|     / \     |`  /
      `'--\    \_/    /--'`
          .'._  J__.-'.
         / /  '-/_ `-  \
        / -"-'-.  '-.__/
        \__,-.\/     | `\
        /  ;---.  .--'   |
       |     /\'-'      /
       '.___.\   _.--;'`)
              '-'     `"*/
coalaFunctionsInit = execVM "framework\3rd_party\CoalaOS\CoalaOsFunctions.sqf";
coalaHandlerInit = execVM "framework\3rd_party\CoalaOS\CoalaOsHandler.sqf";
coalaFileInit = execVM "framework\3rd_party\CoalaOS\CoalaOsFileStructure.sqf";
coalaDefaultWebPage = "http://www.justdev.de/arma/index.html";
coalaDebug = true;
_coalaOpenPrograms = missionNamespace getVariable ["CoalaLastOpenPrograms", []];
fnCoala_debug = 
{
	//"debug_console" callExtension ((_this select 0) + "#1111");
};

waitUntil { scriptDone coalaFunctionsInit && scriptDone coalaHandlerInit && scriptDone coalaFileInit };


_ok = createDialog "LaptopBase";
sleep 0.10;
closeDialog 2;
_ok = createDialog "LaptopBase";
_CRLF = toString [0x0D, 0x0A];

_welcomeText = format["Coala OS [Version 1.34.483]%1Copyright (c) 2015 Legion Corporation. All rights reserved.%1%1%2 ", _CRLF, coala_currentFolderName];
ctrlSetText [1400, _welcomeText];

[_coalaOpenPrograms] execVM "framework\3rd_party\CoalaOS\CoalaOsReopenPrograms.sqf";

waitUntil { (!dialog) or (!alive player) }; // hit ESC to close it 

if(!alive player) then
{
	closeDialog 2;
};

//kill remaining processes
{
	call compile format["[%2] call fncoala_stop%1", _x select 4, _x select 1];
}
foreach coala_ActivePrograms;
missionNamespace setVariable ["CoalaLastOpenPrograms", coala_ActivePrograms];

//coalaDisplay displayRemoveAllEventHandlers "MouseMoving";
//coalaDisplay displayRemoveAllEventHandlers "MouseButtonUp";
