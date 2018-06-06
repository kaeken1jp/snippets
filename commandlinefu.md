# commandlinefu snippets

## API
https://www.commandlinefu.com/site/api
```
http://www.commandlinefu.com/commands/<command-set>/<format>/
Here, <command-set> is the URL component which specifies which set of commands to return. Possible values are:

browse/sort-by-votes - All commands sorted by votes
tagged/163/grep - Commands tagged with 'grep', sorted by date (the default sort order)
matching/ssh/c3No - Search results for the query 'ssh' (note that the final segment is a base64-encoding of the search 

Also, <format> is one of the following:
 curl "https://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext"
 curl "https://www.commandlinefu.com/commands/browse/sort-by-votes/json"
 curl "https://www.commandlinefu.com/commands/browse/sort-by-votes/rss"
```

```bash
 curl "https://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext"
# commandlinefu.com - questions/comments: danstools00@gmail.com

# Run the last command as root
sudo !!

# Serve current directory tree at http://$HOSTNAME:8000/
python -m SimpleHTTPServer

# Runs previous command but replacing
^foo^bar

# Rapidly invoke an editor to write a long, complex, or tricky command
ctrl-x e

# Place the argument of the most recent command on the shell
'ALT+.' or '<ESC> .'

# Salvage a borked terminal
reset

# currently mounted filesystems in nice layout
mount | column -t

# Execute a command at a given time
echo "ls -l" | at midnight

# Get your external IP address
curl ifconfig.me

# Quick access to the ascii table.
man ascii

# output your microphone to a remote computer's speaker
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp

# Query Wikipedia via console over DNS
dig +short txt <keyword>.wp.dg.cx

# type partial command, kill this command, check something you forgot, yank the command, resume typing.
<ctrl+u> [...] <ctrl+y>

# Mount folder/filesystem through SSH
sshfs name@server:/path/to/folder /path/to/mount/point

# Mount a temporary ram partition
mount -t tmpfs tmpfs /mnt -o size=1024m

# Download an entire website
wget --random-wait -r -p -e robots=off -U mozilla http://www.example.com

# Clear the terminal screen
ctrl-l

# Update twitter via curl
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml

# Compare a remote file with a local file
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -

# A very simple and useful stopwatch
time read (ctrl-d to stop)

# SSH connection through host in the middle
ssh -t reachable_host ssh unreachable_host

# Watch Star Wars via telnet
telnet towel.blinkenlights.nl

# Make 'less' behave like 'tail -f'.
less +F somelogfile

# Close shell keeping all subprocess running
disown -a && exit

# Put a console clock in top right corner
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```
