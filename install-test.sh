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
myriota_test 'python -c "import requests"'
myriota_test 'which curl'
myriota_test 'arm-none-eabi-gcc --version | grep -q 7.2.1'
myriota_test 'which gcc || which clang'
myriota_test 'which rtl_sdr'
myriota_test 'updater.py --help'
myriota_test 'log-util.py --help'
myriota_test 'auth.py --help'
myriota_test 'convert_type --help'	
myriota_test 'resampler --help'
myriota_test 'satellite_simulator.py --help'
myriota_test 'cd examples/blinky; make; make clean'
myriota_test 'cd examples/tracker; make; make clean'
myriota_test 'cd examples/event; make; make clean'

