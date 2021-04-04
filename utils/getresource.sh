#!/bin/bash
ram=`docker exec -it nyzo-verifier cat /sys/fs/cgroup/memory/memory.limit_in_bytes`;
cpu=`docker exec -it nyzo-verifier cat /sys/fs/cgroup/cpu/cpu.cfs_quota_us`;
period=`docker exec -it nyzo-verifier cat /sys/fs/cgroup/cpu/cpu.cfs_period_us`;

echo -e "Memory limit in bytes: $ram"
echo -e "CPU period: $period"
echo -e "CPU quota (limit): $cpu"