# project-safesquid

System Monitoring Dashboard Script

This script monitors various system resources and presents them in a dashboard format. It refreshes the data every few seconds to provide real-time insights. The script also allows users to view specific parts of the dashboard using command-line switches.

In this, we have provided output one by one as mentioned in the question blank.
For each term its commands are specified and called for the output.
Below is the sequence :

1. **Top 10 Most Used Applications**
2. **Network Monitoring**
3. **Disk Usage**
4. **System Load**
5. **Memory Usage**
6. **Process Monitoring**

Also, further the dashboard is also displayed as to view the full dashboard with all sections, simply run the script without any arguments:

```bash
./script.sh

You can use command-line switches to view specific parts of the dashboard like
To view top 10 applications we can run the script as
./script.sh  -c

To view network monitoring we can run the script as
./script.sh -n

To view disk usage we can run the script as
./script.sh -d

To view system load we can run the script as
./script.sh -s

To view memory usage we can run the script as
./script.sh -m

To view process monitoring we can run the script as
./script.sh -p
