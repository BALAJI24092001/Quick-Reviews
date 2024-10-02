## CMD useful commands
| Command | What it Does | Usage | Special Cases & Extra Info |
|---------|--------------|-------|----------------------------|
| `dir` | Displays a list of files and subdirectories in a directory. | `dir [drive:][path][filename]` | - Use `/a` to show hidden files<br>- Use `/s` for recursive listing<br>- Use `/b` for bare format (no heading information or summary) |
| `cd` or `chdir` | Changes the current directory or displays the current working directory path. | `cd [/d] [drive:][path]`<br>`cd ..` (move up one level) | - Use `/d` to change current drive in addition to changing current directory |
| `mkdir` or `md` | Creates a new directory. | `mkdir [drive:]path` | - Can create multiple nested directories in one command:<br>  `mkdir a\b\c` |
| `rmdir` or `rd` | Removes (deletes) a directory. | `rmdir [/s] [/q] [drive:]path` | - Use `/s` to remove all subdirectories and files<br>- Use `/q` for quiet mode |
| `copy` | Copies one or more files to another location. | `copy [/v] [/y\|-y] [/a\|/b] source [/a\|/b] [+ source [/a\|/b] [+ ...]] [destination [/a\|/b]]` | - Use `/v` to verify that new files are written correctly<br>- Use `/y` to suppress prompting to confirm overwriting of destination files |
| `move` | Moves files and renames files and directories. | `move [/y \| /-y] [source] [destination]` | - Can be used to rename a directory |
| `del` or `erase` | Deletes one or more files. | `del [/p] [/f] [/s] [/q] [/a[:attributes]] names` | - Use `/p` to prompt for confirmation before deleting each file<br>- Use `/s` to delete specified files from all subdirectories |
| `ren` or `rename` | Renames a file or files. | `ren [drive:][path]filename1 filename2` | - Wildcards can be used to rename multiple files |
| `type` | Displays the contents of a text file. | `type [drive:][path]filename` | - Can be used to concatenate files: `type file1.txt file2.txt > combined.txt` |
| `echo` | Displays messages, or turns command echoing on or off. | `echo [on \| off]`<br>`echo [message]` | - Useful in batch files for displaying status messages |
| `cls` | Clears the screen. | `cls` | - Useful for creating a clean display in batch files |
| `help` | Provides help information for Windows commands. | `help [command]` | - Use without a command to list all available commands |
| `ipconfig` | Displays all current TCP/IP network configuration values. | `ipconfig [/all]` | - Use `/all` for detailed configuration information<br>- Use `/renew` to renew DHCP configuration |
| `ping` | Tests network connectivity to another computer. | `ping [-t] [-a] [-n count] [-l size] target_name` | - Use `-t` to ping continuously until stopped<br>- Use `-a` to resolve addresses to hostnames |
| `netstat` | Displays active TCP connections and ports. | `netstat [-a] [-b] [-e] [-n] [-o] [-p proto] [-r] [-s] [interval]` | - Use `-a` to display all connections and listening ports<br>- Use `-b` to display the executable involved in creating each connection |
| `tasklist` | Displays a list of currently running processes. | `tasklist [/s computer] [/u username] [/p password] [/fo format] [/nh]` | - Use `/fo` to specify the output format (table, list, csv) |
| `taskkill` | Terminates tasks by process id (PID) or image name. | `taskkill [/f] [/im processname \| /pid processid]` | - Use `/f` to forcefully terminate the process<br>- Use `/im` to specify the image name of the process |
| `sfc` | System File Checker - Scans and repairs system files. | `sfc /scannow` | - Requires administrative privileges |
| `chkdsk` | Checks a disk and displays a status report. | `chkdsk [volume[[path]filename]]] [/f] [/v] [/r] [/x]` | - Use `/f` to fix errors on the disk<br>- Use `/r` to locate bad sectors and recover readable information |
| `shutdown` | Shuts down or restarts the computer. | `shutdown [/s \| /r \| /g \| /a] [/t xxx] [/c "comment"]` | - `/s` for shutdown, `/r` for restart, `/g` for full shutdown and restart<br>- `/t xxx` specifies the time delay in seconds |
