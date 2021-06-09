t:=$(shell date +%s)
f1:=$(shell mktemp)
f2:=$(shell mktemp)
f3:=$(shell mktemp)
f4:=$(shell mktemp)

test_seed: app/seed
	yes | grep -v 'n' | head -n10 | tee afile
	cat afile | grep -q 'y'
