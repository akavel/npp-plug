
Red/System [
	Title: "test DLL"
	Notes: {
		Compile with:
			red.exe -dlib testdll.reds
		Test from 32b Go with:
			go run calldll.go
	}
]

Foobar: function [
	n [integer!]
][
	print "Hello, worrrld"
	print "^(0a)" ; newline
	print n
]
#export [Foobar]

