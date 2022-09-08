#!/bin/bash
# 说明：DIY 脚本第1部分（Update feeds之前）
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default  
echo 'src-git kenzok https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default  
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
