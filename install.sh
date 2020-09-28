cd files

adb kill-server
adb start-server
adb wait-for-device

echo ""
echo "Device Detected!"

echo ""
adb devices
echo ""
echo "Cleaning up for fresh install ..."

echo ""
adb shell "rm -rf /data/local/tmp/mm_twrp_recovery_install"
echo ""
echo "Installing ..."

echo ""
adb shell "mkdir /data/local/tmp/mm_twrp_recovery_install"
adb shell "chmod 755 /data/local/tmp/mm_twrp_recovery_install"
adb push boot_twrp_recovery.sh /data/local/tmp/mm_twrp_recovery_install
adb push busybox /data/local/tmp/mm_twrp_recovery_install
adb push byeselinux.ko /data/local/tmp/mm_twrp_recovery_install
adb push chargemon.sh /data/local/tmp/mm_twrp_recovery_install
adb push install_twrp_recovery.sh /data/local/tmp/mm_twrp_recovery_install
adb push iovyroot /data/local/tmp/mm_twrp_recovery_install
adb push modulecrcpatch /data/local/tmp/mm_twrp_recovery_install
adb push recovery.twrp.cpio.lzma /data/local/tmp/mm_twrp_recovery_install
adb push wp_mod.ko /data/local/tmp/mm_twrp_recovery_install
adb shell "chmod 755 /data/local/tmp/mm_twrp_recovery_install/busybox"
adb shell "chmod 755 /data/local/tmp/mm_twrp_recovery_install/install_twrp_recovery.sh"
adb shell "chmod 755 /data/local/tmp/mm_twrp_recovery_install/iovyroot"
adb shell "chmod 755 /data/local/tmp/mm_twrp_recovery_install/modulecrcpatch"
adb shell "/data/local/tmp/mm_twrp_recovery_install/iovyroot /data/local/tmp/mm_twrp_recovery_install/install_twrp_recovery.sh"

echo ""
echo "Finished!"

echo ""
echo "Rebooting into TWRP recovery ..."
adb reboot

adb kill-server

echo ""

