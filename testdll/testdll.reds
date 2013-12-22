
Red/System [
	Title: "test DLL"
	Notes: {
		Compile with:
			red.exe -dlib testdll.reds
		Test from 32b Go with:
			go run calldll.go
	}
]


;--on-load:        func [hModule [integer!]][ ]
;--on-unload:      func [hModule [integer!]][ ]
;--on-new-thread:  func [hModule [integer!]][ ] ;-- Windows-specific callback
;--on-exit-thread: func [hModule [integer!]][ ] ;-- Windows-specific callback

		Foobar: function [
			[callback]
		][
			print "Hello, worrrld"
		]
#export stdcall [Foobar]

