# TWRP device tree for Infinix Note 12 2023 (X676C)

## Status

Specs [here](https://www.devicespecifications.com/en/model/69965aab)
Description | Specification
-------:|:-------------------------
Shipped Android Version | 12
Internal Storage | 128 GB (UFS 2.2)

The tester [Chela_vek](https://4pda.to/forum/index.php?showuser=8411813) has new img file to install `vendor_boot-X676C-A12-nnnnnnnn-nnnn.img` and test to know if TWRP can start.

<details><summary>References for Tests & Building: [bootimg header v4] - Click to open</summary>
<p>

[bootimg header v4](https://android.googlesource.com/platform/system/tools/mkbootimg/+/refs/heads/master/include/bootimg/bootimg.h#404)

[BoardConfig.mk](https://android.googlesource.com/device/google/cuttlefish/+/70e6a3f2434529698dc831471a1a7b675cb87cc3/shared/BoardConfig.mk)

[Bootloader overview](https://source.android.com/docs/core/architecture/bootloader)

[Vendor Boot Partitions](https://source.android.com/docs/core/architecture/bootloader/partitions/vendor-boot-partitions)

[Boot Image Header](https://source.android.com/docs/core/architecture/bootloader/boot-image-header)

[Generic Boot Partition - vendor_boot](https://source.android.com/docs/core/architecture/bootloader/partitions/generic-boot)

[Vendor/ODM DLKM Partition](https://source.android.com/docs/core/architecture/bootloader/partitions/vendor-odm-dlkm-partition)

[Version Information in AVB properties](https://source.android.com/docs/core/architecture/bootloader/version-info-avb)
</p>
</details>

<details><summary>Install img file - Click to open</summary>
<p>

[in fastbootd -- Fastboot commands](https://source.android.com/docs/core/architecture/bootloader/fastbootd#fastboot-commands)
`fastboot fetch vendor_boot <out.img>`
Use in Android 12 and higher to support flashing vendor ramdisks.

Gets the entire partition size and the chunk size. Gets data for each chunk, then stitches the data together to <out.img>

For details, see `fastboot fetch vendor_boot <out.img>`.

`fastboot flash vendor_boot:default <vendor-ramdisk.img>`	
Use in Android 12 and higher to support flashing vendor ramdisks.

This is a special variant of the flash command. It performs a fetch vendor_boot image function, as if fastboot fetch was called. The new vendor_boot image it flashes depends on whether the boot header version is version 3 or version 4.

For details, see `fastboot flash vendor_boot:default <vendor-ramdisk.img>`.

fastboot flash vendor_boot:<foo> <vendor-ramdisk.img>	Use in Android 12 and higher to support flashing vendor ramdisks.
Fetches the vendor_boot image. Returns an error if the vendor boot header is version 3. If it’s version 4, it finds the correct vendor ramdisk fragment (if available). It replaces that with the given image, recalculates sizes and offsets, and flashes the new vendor_boot image.

For details, see `fastboot flash vendor_boot:<foo> <vendor-ramdisk.img>`
</p>
</details>

Some information about boot.img GKI 2.0 https://android.googlesource.com/platform/external/avb/#gki-2_0-integration

### Some tests was made: 
Initial DT: 2022-12-20
Issue: Not boot - stuck in TWRP logo. Device need auth file for using SPFT to others attempts.

 - Need test after 2023-02-13
Update:  

### This branch android-12.1 **NOT** has ***encrypt/decrypt*** mode activated.

<details><summary>TWRP Pictures - Click to open</summary>
<p>

 ![TWRP Mount](https://github.com/lopestom/twrp_device_infinix_X676C/releases/download/IN_12_2023-X676C-v848/Screenshot_2023-02-19-13-42-39.png) ![TWRP Backup](https://github.com/lopestom/twrp_device_infinix_X676C/releases/download/IN_12_2023-X676C-v848/Screenshot_2023-02-19-13-42-57.png) ![TWRP Backup1](https://github.com/lopestom/twrp_device_infinix_X676C/releases/download/IN_12_2023-X676C-v848/Screenshot_2023-02-19-13-41-48.png) ![TWRP Backup2](https://github.com/lopestom/twrp_device_infinix_X676C/releases/download/IN_12_2023-X676C-v848/Screenshot_2023-02-19-13-38-14.png) ![TWRP Screen](https://github.com/lopestom/twrp_device_infinix_X676C/releases/download/IN_12_2023-X676C-v848/Screenshot_2023-02-19-13-40-20.png)
</p>
</details>

-----
#### Building

```bash
source build/envsetup.sh
lunch twrp_X676C-eng
mka vendorbootimage
```
