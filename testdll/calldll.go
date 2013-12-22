package main

import (
	"syscall"
)

func main() {
	println("hello Go\n")
	dll := syscall.MustLoadDLL("testdll.dll")
	println("found DLL\n")
	proc := dll.MustFindProc("Foobar")
	proc.Call(25)
}
