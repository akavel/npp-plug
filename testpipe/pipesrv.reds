Red/System [
	Title: "Test application of a WinAPI Named Pipe server"
	Author: "Mateusz Czapliński <czapkofan@gmail.com>"
	Rights: "Copyright (c) 2013 by Mateusz Czapliński"
	License: "MIT/X11"
]

#import [
	"kernel32.dll" cdecl [
		; http://msdn.microsoft.com/en-us/library/windows/desktop/aa365150%28v=vs.85%29.aspx
		CreateNamedPipeA: "CreateNamedPipeA" [
			name [c-string!]  ;-- must be: "\\.\pipe\" + pipename
			open-mode [integer!]
			pipe-mode [integer!]
			max-instances [integer!]  ;-- 255=unlimited; must be equal in clients
			out-buffer-size [integer!]
			in-buffer-size [integer!]
			default-timeout [integer!]
			security-attributes [byte-ptr!] ;-- LPSECURITY_ATTRIBUTES
			return: [integer!]
		]
	]
]

PIPE_ACCESS_DUPLEX: 00000003h
FILE_FLAG_OVERLAPPED: 40000000h
PIPE_TYPE_MESSAGE: 00000004h
PIPE_READMODE_MESSAGE: 00000002h

main: func [
	/local
		err
][
	err: CreateNamedPipeA
		"\\.\pipe\test-named-pipe-mc" 
		PIPE_ACCESS_DUPLEX + FILE_FLAG_OVERLAPPED
		PIPE_TYPE_MESSAGE + PIPE_READMODE_MESSAGE
		1  ;-- max instances
		0  ; FIXME
		0  ; FIXME
		0  ; default timeout
		as byte-ptr! 0  ; FIXME
		
	; FIXME: check err, GetLastError
]

main
