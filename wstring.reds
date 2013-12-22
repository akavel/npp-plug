Red/System [
	Title: "Utilities for conversion to WinAPI WSTR (WCHAR*)"
	Author: "Mateusz Czapliński <czapkofan@gmail.com>"
	File: %wstring.reds
]

utf-to-new-wstr: func [
	s [c-string!]
	return: [byte-ptr!]
	/local
		buf [byte-ptr!]
		pbuf [byte-ptr!]
		zero [byte!]
][
	zero: #"^(00)"
	buf: allocate 2 * size? s
	pbuf: buf
	while [s/1 <> zero][
		; little endian...
		pbuf/1: s/1
		pbuf/2: zero
		pbuf: pbuf + 2
		s: s + 1
	]
	pbuf/1: zero
	pbuf/2: zero
	buf
]
