t:=$(shell date +%s)
f1:=$(shell mktemp)
f2:=$(shell mktemp)
f3:=$(shell mktemp)
f4:=$(shell mktemp)

test_seed: app/seed
	LATITUDE=0 LONTGITUDE=0 STARTTIME=$(t) app/seed | grep -v "===Application process ID " | head -n500 > $(f1)
