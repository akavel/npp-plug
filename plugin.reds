Red/System [
	Title: "Plugin for Notepad++ automation via messages sent through WinAPI Named Pipes"
	Author: "Mateusz Czapliński <czapkofan@gmail.com>"
	Rights: "Copyright (c) 2013 by Mateusz Czapliński"
	License: "MIT/X11"
]

#include %wstring.reds

Shortcut!: alias struct! [
	ctrl [logic!]
	alt [logic!]
	shift [logic!]
	key [byte!]
]
FuncItemData!: alias struct! [
	pfunc [function! []]
	cmdid [integer!]
	init2check [logic!]
	pshortcut [Shortcut!] ; note: struct is actually pointer to struct
]

donothing: func[][]

on-load: func [
	hModule [integer!]
	/local
		fdata
][
	name: utf-to-new-wstr "testRed"
	
	funcs: allocate (64 + size? FuncItemData!)
	fdata: as FuncItemData! (funcs + 64)
	fdata/pfunc: :donothing
	fdata/cmdid: 0
	fdata/init2check: true
	fdata/pshortcut: as Shortcut! 0
	;fdata/pshortcut: as Shortcut! allocate size? Shortcut!
	;fdata/pshortcut/key: #"^(00)"
]
on-unload: func [hModule [integer!]][
	free name
	name: as byte-ptr! 0
	
	free funcs
	funcs: as byte-ptr! 0
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

getFuncsArray: func [
	n [pointer! [integer!]] "number of entries in returned array"
	;return: [pointer! [struct!]] "pointer to an array of structures that describe the exposed functions"
	return: [pointer! [byte!]] "pointer to an array of structures that describe the exposed functions"
][
	n/1: 1
	funcs
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

#export [isUnicode setInfo getName getFuncsArray beNotified messageProc]
