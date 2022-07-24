# Dual Function Keys using udevmon on Wayland

Install [`intercept-dual-function-keys`][dual-function-keys].

```
# pacman -S interception-dual-function-keys
```

Determine keyboard device name.

```
# libinput list-devices
```

Check location of `udevmon.yaml`.

```
$ cat /usr/lib/systemd/system/udevmon.service
[Unit]
Description=Monitor input devices for launching tasks
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service
Documentation=man:udev(7)

[Service]
ExecStart=/usr/bin/udevmon -c /etc/interception/udevmon.yaml
Nice=-20
Restart=on-failure
OOMScoreAdjust=-1000

[Install]
WantedBy=multi-user.target
```

Configure `udevmon.yaml` to monitor keyboard events.

```
- JOB: "intercept -g $DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/thinkpad.yaml | uinput -d $DEVNODE"
  DEVICE:
    NAME: "AT Translated Set 2 keyboard"
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ENTER, KEY_LEFTSHIFT, KEY_RIGHTSHIFT, KEY_LEFTCTRL, KEY_RIGHTCTRL]
```

Configure `dual-function-keys` (note `-c` option above).

```
TIMING:
  TAP_MILLISEC: 200
  DOUBLE_TAP_MILLISEC: 150

MAPPINGS:
  - KEY: KEY_CAPSLOCK
    TAP: KEY_ESC
    HOLD: KEY_LEFTCTRL
```

Enable/start `udevmon.service`.

```
# systemctl enable udevmon
# systemctl restart udevmon
```

[dual-function-keys]: https://gitlab.com/interception/linux/plugins/dual-function-keys/-/tree/master
