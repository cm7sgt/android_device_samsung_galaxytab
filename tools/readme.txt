This is a beta build of CyanogenMod 7 Gingerbread for GSM Galaxy Tab 7
by Technomancer (TCMAN-dmg on freenode.net #cm7sgt channel)

Bug reports: open issues at http://github.com/cm7sgt/android_device_samsung_galaxytab/issues

This build is for beta testing, not for general consumption

CREDITS

The github for CM7SGT Tab is http://github.com/cm7sgt

It is based on great work of CyanogenMod and CM SGS/Teamhacksung http://cmsgs.com

Thanks to codeworkx, coolya and noobnl and all beta testers.

INSTALLATION

Your Tab should be partitioned with gt-p1000_mr.pit
It should have Gingerbread bootloaders from JQ1.
Please use Bell I9000 JK5 modem.bin for AT&T Tab, and JQ1 modem.bin for Euro tabs. I am not sure about T-mobile, try JQ1.

To flash it, flash at least zImage and factoryfs.ext4 using Heimdall http://www.glassechidna.com.au/products/heimdall/
setup_fs should automatically reformat data,dbdata and cache to ext4 on first boot.
If not please reboot to recovery and try wipe from recovery.

Status
Voice: OK
3G Data: OK
Wifi: OK
BT: OK
GPS: working
Lights: OK
Sensors: OK
Camera: mostly OK (video recording broken)

Issues and workarounds
* Stuck on CM boot ani after flash
    After first install please start in recovery and do full wipe (select "wipe data/factory reset in recovery)

* BT doesnt start
    Try again
    Try rebooting
    If that doesnt help try "adb shell stop hciattach" Sometimes hciattach service gets stuck when starting.

Changelog:
2011-10-09
    move download cache to /data/cache_download and system dalvik cache to data, it should fix download issues with large APKs
    fix bluetooth keyboard keypad rotation issue
    move touchscreen event rotation to kernel to to clean up frameworks/base
    use switchable pair and new stacked mounts in vold for /mnt/sdcard and and /mnt/sdcard/external_sd

2011-09-20
    Update to latest from git.
    Merged P1000L/N kernel. P1000L kernel included in build.
    Voodoo Sound update to V10. Switch to JHASH3 hash function in kernel.
    Disable NEW_AP in Wifi driver, fix hotspot mode.

2011-08-07
    Update to latest from git. Android 2.3.5.
    Added BLN kernel driver and LIGHT_ID_NOTIFICATIONS -> /sys/class/misc/backlightnotification/notification_led device to liblights. Big thanks to Neldar.
    Fix geolocation/networklocation settings in props and frameworks' config.xml
    Update EGL driver and pvrsvrkm kernel driver to latest from EF17 Sprint GB release.

2011-07-20
    Update to latest from git.
    Merge changes from Sprint GB kernel source release. Merge relevant kernel changes to up to 2.6.35.10.

2011-06-21
    Enable CRT screen off/on animation.
    Add virtual flag to capacitive buttons to enable vibration when they are pressed.
    Increase HCI baud rate to 3M, hopefully this will help A2DP issues with BT keyboards.

2011-06-13
    Rotary Lockscreen bitmaps and Twelve Key Dialer portrait and landscape layouts have been fixed by Fabrizio. Big thanks!
    Fixed wrong parameter to ril->setCallVolume, hopefully will make call audio better.
    Switched to use Samsung's binary brcm_patchram_plus with the same parameters in init.rc. Bluetooth SCO works now. Magic?

2011-06-06
    Add attribute for available frequencies, fix cpufreq sysfs permissions so CMParts can access it.
    Change compile options for kernel to cortex-a8. Enable Tiny RCU.
    Fixed calls from other places in the kernel that used olde speed levels and caused frequency spikes to 1.2GHz.
    Fixed Low Power Mode (it properly starts /lpm.rc and displays charging animation).

2011-06-05
    Added 10-point Multitouch to kernel (thanks to The_Double and hoss_n2)
    Added overclock (1.4GHz) and undevolt (thanks to Richard Trip and Koxudaxi)
    Added Voodoo Sound V9 (thanks to Supercurio and Richard Trip)
    Switched to (some) Crespo EGL SOs, hopefully will fix some OpenGL issues.

2011-06-03
    Add usb_connected switch to kernel, fixes usb mounting and usb connection detection.
    Use mke2fs instead of make_ext4 for formatting in OTA and setup_fs. Should be more reliable.
    Added download mode to reboot menu.

2011-05-30
    Fix problems with headphones/headsets and libaudio, kanged common-aries libaudio.
    Added OMX libraries and overlay from common-aries.

2011-05-28r2
    Fixed setup_fs so it properly formats partitions.
    Enabled more tablet tweaks (soft buttons).
    Removed format for .android_secure in recovery, should fix wipe.
2011-05-28
    Switched to Gingerbread kernel 2.6.35.7 recently released by Samsung.
    Use JQ1 binary drivers for OpenGL, sensors, lights, copybit, overylay, camera etc, so they all work!
    Portrait is default orientation now, ro.sf.hwrotation=90 is set and touchscreen events are rotated in input layer so they match.

2011-04-21
    Fix mounting Tab as USB drive (ums switch in kernel reported "ums online" instead of "online" that vold expects)
    Fixed phone calls. Reapply RIL.java and RILConstants.java patches from cmsgs frameworks_base.

2011-04-20
    Cleanup of init scripts, added /sdcard and /emmc links.

2011-04-05
    Fixed suid/root issues. Refreshed and rebuilt with latest.

2011-03-30
    Built from new repo branched off teamhacksung.
    overlay and libstagefrighthw (video accell) disabled so it is stable now.
    Camera is disabled (stubbed).
    data, dbdata and cache partition switched to ext4.

2011-03-02
    Added source modules for pvrsrvkm, s3c_bc and s3c_lcd to kernel sources and build them from scratch
    Refreshed, merged and rebuilt, media scanner works again
2011-03-01
    Refreshed and merged latest frameworks etc from CM repo
    Rebuilt everything
    Use vold built from source

2011-02-17
    Refreshed repo and rebuild
    initramfs built from sources instead of checked in, still far from automated build tho ;-(
2011-02-07
    Refreshed repo and rebuilt.
    Backed out codeworkx's bluetooth fix, it seems to make things worse. Added stopping and cleaning up hciattach if it fails. Now if Bluetooth start fails, just try starting it again.
    Removed overlay and copybit built from source, they cant both be installed. Use binary copybit since the ones built from the source use wrong kernel headers. Camera shows some signs of life now.
    Patched code that calls gralloc to remove usage flags not known by froyo gralloc.
    
2011-02-03 New kernel from Update1
    Refreshed repo and rebuild with latest
    added codeworkx's brcm_patchram_plus fix that should hopefully fix bluetooth initialization
    
2011-01-31 GPS should work now
    Used Nexus S GPS binaries
    Switched to init compiled from sources
    Switched to CWM 3.x (still very broken)

2011-01-29 Fixed 3G data

2011-01-28 First beta release


--
Dominik

