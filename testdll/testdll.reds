
Red/System [
	Title: "test DLL"
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

