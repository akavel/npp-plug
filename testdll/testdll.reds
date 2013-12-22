
Red/System [
	Title: "test DLL"
	Notes: {
		Compile with:
			red.exe -dlib testdll.reds
		Test from 32b Go with:
			go run calldll.go
	}
]

on-load: func [hModule [integer!]][
	print "onload called!^(0a)"
]
on-unload: func [hModule [integer!]][
	print "on-unload called!^(0a)"
]

Foobar: function [
	n [integer!]
][
	print "Hello, worrrld"
	print "^(0a)" ; newline
	print n
	print "^(0a)" ; newline
]
#export [Foobar]

