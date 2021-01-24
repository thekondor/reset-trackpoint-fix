# reset-trackpoint-fix (thinkpad)

The script addresses a dead trackpoint/trackpad accordingly to [wiki page](https://wiki.archlinux.org/index.php/Lenovo_ThinkPad_X1_Carbon_(Gen_6)#TrackPoint_and_Touchpad_issues) by disconnecting and reconnecting a broken SerIO device on resume.

## Configuration

- Uncomment and set a proper value in `/etc/reset-trackpoint-fix.conf`. Usually it is equal to `serio1`.

- Enable `systemctl enable /etc/systemd/system/reset-trackpoint-fix.service`


## Files

**aka** installation locations:

- `/usr/bin/reset-trackpoint-fix.sh`

- `/etc/reset-trackpoint-fix.conf`

- `/etc/systemd/system/reset-trackpoint-fix.service`
