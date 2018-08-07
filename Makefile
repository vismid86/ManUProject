##  Copyright 2017
##  Myriota Pty Ltd
##  Myriota Confidential

# Branch under test.
# Default is current branch if not set in an environment variable
export BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)

# current remote/branch
tracking:=$(shell git rev-parse --abbrev-ref @{u})
# current remote
remote:=$(patsubst %/$(BRANCH), %, $(tracking))

# Repository/remote url under test.
# Default is url of current branch if not set in environment variable
export REPOSITORY?=$(shell git remote get-url $(remote))

# The current test runner ami
#ami:=$(shell cat create-image/ami)

#volumejson:=$(shell mktemp)
#instancejson:=$(shell mktemp)

# Temporary user data script
userdatascript:=$(shell mktemp)

# Create user data script and launch test instance
test: $(userdatascript) .FORCE
	./userdata.sh
	
# Run script locally
#local: $(userdatascript) .FORCE
#	printf "\nGithub badge links:"
#	./markdown_badge_links
#	bash $(userdatascript)

$(userdatascript) : .FORCE
	@echo "Executing tests on: "$(REPOSITORY)/$(BRANCH)
	@echo "Test results stored at s3://com.myriota.test-logs/"$(REPOSITORY)/$(BRANCH)
	echo "#!/bin/bash -x" > $(userdatascript)
	echo "" >> $(userdatascript)
	echo "branch="$(BRANCH) >> $(userdatascript)
	echo "repository="$(REPOSITORY) >> $(userdatascript)
	echo "" >> $(userdatascript)
#	cat userdata.sh >> $(userdatascript)

.FORCE:
