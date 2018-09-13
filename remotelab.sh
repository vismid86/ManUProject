#! /bin/bash

ssh -p 9026 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=10 remote@remotelab.myriota.com "pwd; whoami; ls -lrt >/dev/null 2>&1"


