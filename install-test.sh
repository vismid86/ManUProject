myriota_test() {
    local mlen=${#1}
    local test_string_len=90
    printf "Myriota test: ${1} "
    for i in `seq $mlen $test_string_len`; do printf "."; done;
    printf " "
    testlog=$(mktemp)
    bash -c "${1}" > testlog 2>&1 && echo "pass" || (echo "FAIL"; cat testlog)
}
myriota_test 'which make'
myriota_test 'which python'
myriota_test 'which pip'
myriota_test 'python -c "import serial"'
myriota_test 'which curl'
myriota_test 'arm-none-eabi-gcc --version | grep -q 7.2.1'
myriota_test 'which gcc || which clang'
myriota_test 'which npm'
myriota_test 'which nodejs'
myriota_test 'which virtualenv'
myriota_test 'which gnuplot'
myriota_test 'which jshon'
myriota_test 'which ccache'
myriota_test 'which zip'
