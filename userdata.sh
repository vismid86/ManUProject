##  Copyright 2017
##  Myriota Pty Ltd
##  Myriota Confidential

# redirects this scripts stderr and stdout to file copied to s3 periodically
#scriptlog=$(mktemp)
#exec > $scriptlog
#exec 2>&1

badge_args="--content-type image/svg+xml --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers full=emailaddress=aws-production@myriota.com --cache-control max-age=0"
log_args="--content-type text/plain --acl bucket-owner-full-control --cache-control max-age=0"

starttimestamp=$(date +%s)
#echo "Test started: $(TZ='Australia/Adelaide' date)"

# First argument is test folder.
update_test_results() {
    local testfolder=$1
    local badge=$(mktemp).svg
    local testlog=$(mktemp)

    # combine test logs and generate badge
    local testlogs=$(find $testfolder -name myriota_build.log | tr '\n' ' ')
    cat $testlogs $(mktemp) | tee $testlog | myriotatest/badge $testfolder > $badge

    # copy badge and logs
    aws s3 cp $badge s3://com.myriota.static-http/test/$repository/$branch/$testfolder/test/badge.svg $badge_args
    aws s3 cp $testlog s3://com.myriota.test-logs/$repository/$branch/$testfolder/test/myriota_test.log $log_args
    aws s3 cp $testlog s3://com.myriota.test-logs/$repository/$branch/$revision/$testfolder/test/myriota_test.log $log_args

    rm $testlog $badge
}

# Update commit badge and script log. First argument is badge text, second is colour
commit_badge() {
    revisionshort=$(git rev-parse --short HEAD)
    datestring=$(TZ='Australia/Adelaide' date | sed 's/\ /\%20/g')
    curl -s "https://img.shields.io/badge/${revisionshort}-${1}%20${datestring}-${2}.svg" > commit.svg
    aws s3 cp commit.svg s3://com.myriota.static-http/test/$repository/$branch/commit.svg $badge_args
#    aws s3 cp $scriptlog s3://com.myriota.test-logs/$repository/$branch/script.log $log_args
}

#Update commit badge and script log. First argument is badge text, second is colour
update_results() {
    commit_badge $1 $2
    update_test_results "commslib"
    update_test_results "math"
    update_test_results "satellite"
    update_test_results "devops"
    update_test_results "tools"
    update_test_results "sdk"
    update_test_results "apps"
    update_test_results "terminal"
}

# die if taking too long
#timeout_check() {
#    local current=$(date +%s)
#    local duration_min=$(echo "(${current} - ${starttimestamp})/60" | bc)
#    if [ "${duration_min}" -ge 90 ]; then
#	echo "Test runner timed out: $(TZ='Australia/Adelaide' date)"
#	commit_badge "Timed out" "red"
#	sudo shutdown -h now
#    fi
#}

#clone repository and udpate badge to indicate status
#ssh-keyscan github.com >> /root/.ssh/known_hosts
#git clone -b $branch $repository repo_under_test || { commit_badge "Failed to clone repository, try again" "red"; sudo shutdown -h now; }
#cd repo_under_test
#commit_badge "Installing" "orange"

# install dependencies and wait until they are installed
#sh install-apt.sh &
#while ps -p $!; do
#    update_results "Installing" "orange"
#    timeout_check
#    sleep 30
#done

# add installed ARM compiler to the path
#PATH=/opt/gcc-arm/bin:$PATH

# the revision number for this branch
revision=$(git rev-parse HEAD)

# Run tests in separate processes to allow finer control of parallelism, e.g. devops can gave lots of threads
#(
#    export REMOTELAB_TIMEOUT=3m
#    make -s commslib/test &
#    make -s math/test &
#    make -j3 -s tools/test &
#    make -j3 -s terminal/test &
#    make -j30 -s devops/test &
#    make -s apps/test &
#    make -j2 -s sdk/test &
#    make -s satellite/test &
#    wait
#) &

# Wait for test process above to finish. Sync results to s3 periodically
#while ps -p $!; do
#    update_results "Testing" "orange"
#    timeout_check
#    sleep 30
#done

#echo "Test finished: $(TZ='Australia/Adelaide' date)"
update_results "Finished" "brightgreen"
#sudo shutdown -h now
