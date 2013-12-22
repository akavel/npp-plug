Red/System [
	Title: "Utilities for conversion to WinAPI WSTR (WCHAR*)"
	Author: "Mateusz Czapliński <czapkofan@gmail.com>"
	File: %wstring.reds
	Rights: "Copyright (c) 2013 by Mateusz Czapliński"
	License: "MIT/X11"
]

ansi-to-new-wstr: func [
	"Allocates memory block and writes string converted to UCS-2 (WCHAR) with trailing NULL"
	s [c-string!]
	return: [byte-ptr!]
	/local
		buf [byte-ptr!]
		pbuf [byte-ptr!]
		zero [byte!]
][
	zero: #"^(00)"
	buf: allocate 2 * size? s
	ansi-to-wstr s buf
	buf
]

ansi-to-wstr: func [
	"Writes to buf a UCS-2 (WCHAR) string from s, with trailing NULL"
	s [c-string!]
	buf [byte-ptr!]
	/local
		pbuf [byte-ptr!]
		zero [byte!]
][
	zero: #"^(00)"
	while [s/1 <> zero][
		; little endian...
		buf/1: s/1
		buf/2: zero
		buf: buf + 2
		s: s + 1
	]
	buf/1: zero
	buf/2: zero
]
