# speed-monitor

Want to keep a log of your connection speed? 

### Requirements
 - speedtest-cli
 - gawk

### Usage
Typical speedtest-cli output looks like this, but I wanted to pull out the relevant bits, and dump them to a file.

```bash
speedtest-cli

Retrieving speedtest.net configuration...
Testing from ****** Corporation (xxx.xxx.101.253)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Unwired (San Francisco, CA) [2.69 km]: 77.225 ms
Testing download speed................................................................................
Download: 0.45 Mbit/s
Testing upload speed................................................................................................
Upload: 6.60 Mbit/s

```

Pipe the above to the script provided and output looks a little more like this.

```bash
# Format  [Timestamp, Ping, Download, Upload, Public IP, Speedtest server]
speedtest-cli | gawk -f awk-filter.awk
01/09/2019 18:57:37 | 78.223ms | 0.32 Mbit/s | 7.46 Mbit/s | xxx.xxx.101.253 | Monkey Brains (San Francisco, CA) [2.69 km]
```

Hopefully your connection is better than that...

If you want to track this over time though, you can just bash it 

```bash
while true; do speedtest-cli | gawk -f ~/GitHub/jbharter/speed-monitor/awk-filter.awk; sleep 60; done 
```

Better yet, just direct it to file and background it

```bash
 while true; do speedtest-cli | gawk -f ~/GitHub/jbharter/speed-monitor/awk-filter.awk; sleep 60; done > outfile.txt & 
```