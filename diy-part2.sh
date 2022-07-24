#!/bin/bash
# 描述：DIY 脚本第2部分（Update feeds之后）

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
#sed -i '/root::0:0:99999/d' package/lean/default-settings/files/zzz-default-settings

#取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile

#加入作者信息
#sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='xxxWrt-$(date +%Y%m%d)'/g" package/lean/default-settings/files/zzz-default-settings   
#sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' xxx'/g" package/lean/default-settings/files/zzz-default-settings

#更改主机名
sed -i "s/hostname='.*'/hostname='xxxWrt'/g" package/base-files/files/bin/config_generate

curl -sfL https://raw.githubusercontent.com/friendlyarm/friendlywrt/master-v21.02/target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol.sh --create-dirs -o files/usr/bin/fa-fancontrol.sh
curl -sfL https://raw.githubusercontent.com/friendlyarm/friendlywrt/master-v21.02/target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol-direct.sh --create-dirs -o files/usr/bin/fa-fancontrol-direct.sh
curl -sfL https://raw.githubusercontent.com/friendlyarm/friendlywrt/master-v21.02/target/linux/rockchip/armv8/base-files/etc/init.d/fa-fancontrol --create-dirs -o files/etc/init.d/fa-fancontrol
chmod +x files/usr/bin/fa-*.sh files/etc/init.d/fa-fancontrol
