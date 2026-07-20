#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
NC=$(tput sgr0)

PS3="${BOLD}${RED}ENTER NUMBER${NC} >${GREEN}"

#information system
select a in "kernelـversion" "ubuntuـversion" "ip_address" "memory_info" "RAM_info" "CPU_info" "Virtualization_info" "ALL_info" "quit"

do

if [ $a = "kernelـversion" ]
then
echo "kernel version : "$(uname -r)

elif [ $a = "ubuntuـversion" ]
then
cat /etc/os-release | grep -E "PRETTY_NAME|VERSION_CODENAME|ID_LIKE" | sed 's/=/ : /'

elif [ $a = "ip_address" ]
then
ifconfig | grep broadcast | mawk '{ print "ip_address = " $2 }'

elif [ $a = "memory_info" ]
then
df -h | grep /dev/nvme0n1p9 | mawk '{ print "total space = " $2; print "free space = "$4; print "used = "$3 }'

elif [ $a = "RAM_info" ]
then
free -h | grep Mem | mawk '{ print "total = " $2; print "free = "$4; print "used = "$3 }'
free -h | grep Swap | mawk '{ print "Swap total = " $4;print "Swap used = " $3 }'

elif [ $a = "CPU_info" ]
then
lscpu | awk -F': *' '/^Model name:/ {print "processor model : "$2}'
lscpu | grep "^CPU(s):" | mawk '{ print "core numbers = " $2 }'

elif [ $a = "Virtualization_info" ]
then
output=$(lscpu | grep "Virtualization: " | mawk '{ print "Virtualization : " $2 }')
echo $output
case  $output in
"VT-x"|"AMD-V"|"KVM"|"Hypervisor"|"HVM"|"svm") echo "not Active";;
*) echo "Active";;
esac

elif [ $a = "ALL_info" ]
then
hostnamectl

elif [ $a = "quit" ]
then
break

fi

done
