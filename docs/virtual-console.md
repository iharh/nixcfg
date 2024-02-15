# virtual console

* https://www.baeldung.com/linux/font-change-virtual-console

sudo dpkg-reconfigure console-setup

??
boot/kernel font
fixed
goha
goha classic
terminus
terminus bold
terminus bold vga
vga

some fonts require are framebuffer-only

cat /etc/default/console-setup
```
# Consult the console-setup(5) manual page.

ACTIVE_CONSOLES="/dev/tty[1-6]"

CHARMAP="UTF-8"

CODESET="guess"
FONTFACE="VGA"
FONTSIZE="16x32"

VIDEOMODE=

# The following is an example how to use a braille font
# FONT='lat9w-08.psf.gz brl-8x8.psf'
```

cat /etc/vconsole.conf
```
# KEYBOARD CONFIGURATION FILE
# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="us"
XKBVARIANT=""
XKBOPTIONS=""

BACKSPACE="guess"

??? FONT="Lat15-TerminusBold32x16"
```

ls /usr/share/consolefonts
```
... tons of stuff ...
```

man setupcon

```
~/.console-setup
~/.keyboard
/etc/default/console-setup
/etc/default/keyboard
/etc/default/console-setup.VARIANT
/etc/default/keyboard.VARIANT
/etc/console-setup/
```

## misc

* https://en.wikipedia.org/wiki/Virtual_console
* https://wiki.archlinux.org/title/Linux_console
* https://wiki.archlinux.org/title/Linux_console/Keyboard_configuration
