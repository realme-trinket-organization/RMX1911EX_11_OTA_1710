#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:4b19d9016125b7501755ddcd0efb2f78ae28fb81; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:e41ff10ebc025c9db70d876992abc41194e89be4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:4b19d9016125b7501755ddcd0efb2f78ae28fb81 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
