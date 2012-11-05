#!/bin/bash
#

# USBメモリのパスを設定
USB_HOME=/mnt/usb1
USB_DIR=$USB_HOME/`/bin/date '+%Y%m%d.%H%M%S'`


# USBメモリをマウント
# mount -t vfat /dev/sda1 $USB_HOME

# ディレクトリを作成
mkdir $USB_DIR

# mysqlのダンプをUSBメモリに保存
mysqldump -u root -p【mysqlパスワード】 -x --all-databases | gzip > $USB_DIR/home1.sqldump.gz

# porvieの画像をcpioで固めてUSBメモリにバックアップ
find /home/hoge/public_html/img/ | cpio -o > $USB_DIR/hoge_img.cpio

# 一週間過ぎたバックアップディレクトリを削除
find $USB_HOME -iregex ".*" -mtime +7 -exec rm -rf {} \;

# アンマウント
# umount /mnt/usb1/


