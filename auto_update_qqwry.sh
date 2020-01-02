#!/bin/sh

echo start update qqwry data at`date`
tem_file="qqwry_tem.dat"
lastest_data=`pwd`/qqwry_lastest.dat
lastest_md5=""
if [ -f "${lastest_data}" ]; then
	echo old data exist!
	lastest_md5=`md5sum ${lastest_data}|cut -d " " -f 1`
fi

echo old data md5 is ${lastest_md5}


#python3 update_chunzhen.py ${tem_file}
sh ./get_chunzhen.sh ${tem_file}

tem_md5=""
if [ -f "${tem_file}" ];then
	tem_md5=`md5sum ${tem_file}|cut -d " " -f 1`
fi
echo download file md5 is ${tem_md5}
if [ "${lastest_md5}" = "${tem_md5}" ];then
	echo same file, no need update anything!
	rm -f ${tem_file}
	exit 0
fi

# copy data to date dir
echo copy date to date dir

date_dir="historys/`date "+%Y_%m_%d"`"
echo ${date_dir}
mkdir historys
mkdir ${date_dir}

# copy tem file
cp   ${tem_file} ${lastest_data}
cp   ${tem_file} ${date_dir}/qqwry.dat
rm -f ${tem_file}
echo finish everything


