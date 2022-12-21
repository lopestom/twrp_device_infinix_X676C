# TWRP device tree for Infinix Note 12 2023 (X676C)

## Status

Specs [here](https://www.devicespecifications.com/en/model/69965aab)
Shipped Android Version | 12
Internal Storage | 128 GB (UFS 2.2)

The tester [Chela_vek](https://4pda.to/forum/index.php?showuser=8411813) only install `boot-X676C-A12-nnnnnnnn-nnnn.img` test modified file to know if TWRP can start.

Some tests was made: 
Initial DT: 2022-12-20
Issue: 

 - Need test after 2022-12-20

****2022-10-12****: Changes to made new version TWRP3.7.0

### This branch android-12.1 has ***encrypt/decrypt*** files and option to more test with that.

![TWRP Working](https://github.com/lopestom/t)

-----
#### Building

```bash
source build/envsetup.sh
lunch twrp_X676C-eng
mka vendorbootimage
```

