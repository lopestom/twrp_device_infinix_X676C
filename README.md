# TWRP device tree for Infinix Note 12 2023 (X676C)

## Status

Specs [here](https://www.devicespecifications.com/en/model/69965aab)
Description | Specification
-------:|:-------------------------
Shipped Android Version | 12
Internal Storage | 128 GB (UFS 2.2)

The tester [Chela_vek](https://4pda.to/forum/index.php?showuser=8411813) only install `vendor_boot-X676C-A12-nnnnnnnn-nnnn.img` test modified file to know if TWRP can start.

References for Tests & Building: [BoardConfig.mk](https://android.googlesource.com/device/google/cuttlefish/+/70e6a3f2434529698dc831471a1a7b675cb87cc3/shared/BoardConfig.mk)

[Bootloader overview](https://source.android.com/docs/core/architecture/bootloader)

[Vendor Boot Partitions](https://source.android.com/docs/core/architecture/bootloader/partitions/vendor-boot-partitions)

[Boot Image Header](https://source.android.com/docs/core/architecture/bootloader/boot-image-header)

[Generic Boot Partition - vendor_boot](https://source.android.com/docs/core/architecture/bootloader/partitions/generic-boot)

[Vendor/ODM DLKM Partition](https://source.android.com/docs/core/architecture/bootloader/partitions/vendor-odm-dlkm-partition)

[Version Information in AVB properties](https://source.android.com/docs/core/architecture/bootloader/version-info-avb)

Install img file: [in fastbootd -- Fastboot commands](https://source.android.com/docs/core/architecture/bootloader/fastbootd#fastboot-commands)
```
fastboot fetch vendor_boot <out.img>	
Use in Android 12 and higher to support flashing vendor ramdisks.

Gets the entire partition size and the chunk size. Gets data for each chunk, then stitches the data together to <out.img>

For details, see fastboot fetch vendor_boot <out.img>.

fastboot flash vendor_boot:default <vendor-ramdisk.img>	
Use in Android 12 and higher to support flashing vendor ramdisks.

This is a special variant of the flash command. It performs a fetch vendor_boot image function, as if fastboot fetch was called. The new vendor_boot image it flashes depends on whether the boot header version is version 3 or version 4.

For details, see fastboot flash vendor_boot:default <vendor-ramdisk.img>.

fastboot flash vendor_boot:<foo> <vendor-ramdisk.img>	Use in Android 12 and higher to support flashing vendor ramdisks.
Fetches the vendor_boot image. Returns an error if the vendor boot header is version 3. If it’s version 4, it finds the correct vendor ramdisk fragment (if available). It replaces that with the given image, recalculates sizes and offsets, and flashes the new vendor_boot image.

For details, see fastboot flash vendor_boot:<foo> <vendor-ramdisk.img>
```

Some information about boot.img GKI 2.0 https://android.googlesource.com/platform/external/avb/#gki-2_0-integration
```
# Uses a prebuilt boot.img
TARGET_NO_KERNEL := true
BOARD_PREBUILT_BOOTIMAGE := device/${company}/${board}/boot.img

# Enables chained vbmeta for the boot.img so it can be updated independently,
# without updating the vbmeta.img. The following configs are optional.
# When they're absent, the hash of the boot.img will be stored then signed in
# the vbmeta.img.
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2
```


Some tests was made: 
Initial DT: 2022-12-20
Issue: 

 - Need test after 2022-12-20

****2022-10-22****: Changes BoardConfig.mk and compiling the img TWRP file.

### This branch android-12.1 has ***encrypt/decrypt*** files and option to more test with that.

![TWRP Working](https://github.com/lopestom/twrp_device_infinix_X676C/blob/android-12.1/pictures/TWRP_DSC_0013.jpg?raw=true)

-----
#### Building

```bash
source build/envsetup.sh
lunch twrp_X676C-eng
mka vendorbootimage
```

