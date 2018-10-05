##  Copyright 2017
##  Myriota Pty Ltd
##  Myriota Confidential

# TRAVIS_TRAVIS_BRANCH under test.
# Default is current TRAVIS_TRAVIS_BRANCH if not set in an environment variable
#export TRAVIS_BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)

# current remote/TRAVIS_BRANCH
#tracking:=$(shell git rev-parse --abbrev-ref @{u})
# current remote
#remote:=$(patsubst %/$(TRAVIS_BRANCH), %, $(tracking))

# Repository/remote url under test.
# Default is url of current TRAVIS_BRANCH if not set in environment variable
#export REPOSITORY?=$(shell git remote get-url $(remote))

# The current test runner ami
#ami:=$(shell cat create-image/ami)

#volumejson:=$(shell mktemp)
#instancejson:=$(shell mktemp)

# Temporary user data script
#userdatascript:=$(shell mktemp)>

# Create user data script and launch test instance
test:
	./test.sh

# Run script locally
#local: $(userdatascript) .FORCE
#	printf "\nGithub badge links:"
#	./markdown_badge_links
#	bash $(userdatascript)
export SDK_ROOTDIR:=$(shell mktemp -d)

file:
	cd $(SDK_ROOTDIR)
	touch installfile
	echo "modify" >> installfile
	ls -lrt
	cd ..

dockerexample: file
	mkdir -p sdkdocdir
	cp -r $(SDK_ROOTDIR) sdkdocdir
	cd sdkdocdir
	docker build . --tag test:16.04
	docker run -v $(ROOTDIR):/home/root --rm test:16.04  bash -c 'pwd; ls -lrt'
