#!/bin/bash
# 说明：DIY 脚本第1部分（Update feeds之前）
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

shopt -s extglob
kernel_version="$(curl -sfL https://github.com/openwrt/openwrt/commits/master/include/kernel-version.mk | grep -o 'href=".*>kernel: bump 5.10' | head -1 | cut -d / -f 5 | cut -d "#" -f 1)"
version="$(git rev-parse HEAD)"
git checkout $kernel_version
git checkout HEAD^
mv -f target/linux package/kernel include/kernel-version.mk include/kernel-defaults.mk .github/
git checkout $version
rm -rf target/linux package/kernel include/kernel-version.mk include/kernel-defaults.mk
mv -f .github/linux target/
mv -f .github/kernel package/
mv -f .github/kernel-version.mk .github/kernel-defaults.mk include/
sed -i 's/ libelf//' tools/Makefile

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
