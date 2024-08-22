#!/bin/bash


INTERVAL=5

function top_applications {
    echo "Top 10 Most Used Applications:"
    echo "--------------------------------"
    echo "By CPU usage:"
    ps aux --sort=-%cpu | head -n 10
    echo "By Memory usage:"
    ps aux --sort=-%mem | head -n 10
    echo
}

function network_monitoring {
    echo "Network Monitoring:"
    echo "-------------------"
    echo "Concurrent connections:"
    netstat -an | grep ESTABLISHED | wc -l
    echo "Packet drops:"
    netstat -s | grep "packet loss"
    echo
}

function disk_usage {
    echo "Disk Usage:"
    echo "-----------"
    df -h | awk '{print $1, $5, $6}'
    echo
}


function system_load {
    echo "System Load:"
    echo "------------"
    uptime 
    echo
    echo "Breakdown of CPU Usage: "
    mpstat | awk 'NR==4 {print "User: " $3 "%, System: " $5 "%, Idle: " $12 "%"}'
    echo
}

function memory_usage {
    echo "Memory Usage:"
    echo "--------------"
    free -h | awk 'NR==2 {print "Total: " $2 ", Used: " $3 ", Free: " $4}'
    echo "Swap Usage:"
    free -h | awk 'NR==3 {print "Total: " $2 ", Used: " $3 ", Free: " $4}'
    echo
}

function process_monitoring {
    echo "Process Monitoring:"
    echo "-------------------"
    echo "Number of active processes:"
    ps aux | wc -l
    echo "Top 5 processes by CPU usage:"
    ps aux --sort=-%cpu | head -n 6 
    echo "Top 5 processes by memory usage:"
    ps aux --sort=-%mem | head -n 6 
    echo
}


function my_dashboard {
    clear
    top_applications
    network_monitoring
    disk_usage
    system_load
    memory_usage
    process_monitoring
}

while getopts ":c:m:n:d:s:p:" opt; do
    case ${opt} in
        c )
            top_applications
            process_monitoring
            ;;
        m )
            memory_usage
            ;;
        n )
            network_monitoring
            ;;
        d )
            disk_usage
            ;;
        s )
            system_load
            ;;
        p )
            process_monitoring
            ;;
        \? )
            echo "Usage: $0 [-c] [-m] [-n] [-d] [-s] [-p]"
            exit 1
            ;;
    esac
    exit 0
done

while true; do
    my_dashboard
    sleep $INTERVAL
done
