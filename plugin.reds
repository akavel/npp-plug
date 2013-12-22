Red/System [
	Title: "Plugin for Notepad++ automation via messages sent through WinAPI Named Pipes"
	Author: "Mateusz Czapliński <czapkofan@gmail.com>"
	Rights: "Copyright (c) 2013 by Mateusz Czapliński"
	License: "MIT/X11"
]

#include %wstring.reds

on-load: func [hModule [integer!]][
	name: utf-to-new-wstr "testRed"
]
on-unload: func [hModule [integer!]][
	free name
	name: as byte-ptr! 0
]


isUnicode: func [
	"If this function is exported (must return 'true'), then Notepad++ assumes this is a Unicode plugin"
	return: [logic!]
][
	true
]

setInfo: func [
	"This routine is called on loading the plugin, providing it with handles to controls of the current instance of Notepad++"
	notepad [integer!]
	scintilla1 [integer!]
	scintilla2 [integer!]
][]

getName: func [
	"Returns name of the plugin, to appear in the Plugin menu"
	return: [byte-ptr!] "WSTR unicode string"
][
	;... fixme todo!
	;0
	;as pointer! [integer!] 0
	name
]

getFuncArray: func [
	n [pointer! [integer!]] "number of entries in returned array"
	;return: [pointer! [struct!]] "pointer to an array of structures that describe the exposed functions"
	return: [pointer! [byte!]] "pointer to an array of structures that describe the exposed functions"
][
	as pointer! [byte!] 0
]

beNotified: func [
	notif [pointer! [byte!]] "TODO"
][
]

messageProc: func [
	message [integer!]
	wparam [integer!]
	lparam [integer!]
	return: [integer!] "LRESULT"
][
	0
]

#export [isUnicode setInfo getName getFuncArray beNotified]
