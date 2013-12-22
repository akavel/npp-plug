Red/System [
	Title: "Utilities for conversion to WinAPI WSTR (WCHAR*)"
	Author: "Mateusz Czapliński <czapkofan@gmail.com>"
	File: %wstring.reds
]

ansi-to-new-wstr: func [
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
