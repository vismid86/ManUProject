t:=$(shell date +%s)
f1:=$(shell mktemp)
f2:=$(shell mktemp)
f3:=$(shell mktemp)
f4:=$(shell mktemp)

test_seed: app/seed
        # these should be the same, default system seed
	LATITUDE=0 LONTGITUDE=0 STARTTIME=$(t) app/seed | grep -v "===Application process ID " | head -n500 > $(f1)
	LATITUDE=0 LONTGITUDE=0 STARTTIME=$(t) app/seed | grep -v "===Application process ID " | head -n500 > $(f2)
	diff $(f1) $(f2)
        # these should be the same, default system seed
	SEED=100 LATITUDE=0 LONTGITUDE=0 STARTTIME=$(t) app/seed | grep -v "===Application process ID " | head -n500 > $(f3)
	SEED=100 LATITUDE=0 LONTGITUDE=0 STARTTIME=$(t) app/seed | grep -v "===Application process ID " | head -n500 > $(f4)
	diff $(f3) $(f4)
        # should be different, different seeds
	! diff $(f1) $(f3)
	! diff $(f2) $(f4)
