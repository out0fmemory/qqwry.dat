#!/bin/sh
chunzhen_url=http://update.cz88.net/soft/setup.zip
innoextract_path=`pwd`/exe_tool/innoextract
tem_dir=temp

current_dir=`pwd`

echo start down ip data

# prepare
rm -rfv $tem_dir
mkdir $tem_dir
cd $tem_dir

# down
wget --inet4-only $chunzhen_url

# unzip
unzip setup.zip

# extract
ls -al $innoextract_path
$innoextract_path setup.exe
# copy
qqwry_file=app/qqwry.dat

target_file="${current_dir}/qqwry_tem.dat"
echo $qqwry_file $target_file
cp $qqwry_file $target_file

cd $current_dir

rm -rfv $tem_dir

echo end down ip data
