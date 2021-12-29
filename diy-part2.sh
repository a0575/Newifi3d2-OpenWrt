#!/bin/bash
# 描述：DIY 脚本第2部分（Update feeds之后）

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
