#!/bin/sh

#  cconv.sh
#  Joke
#  繁体化脚本，将项目资源文件繁体化
#  Created by ccc on 14-3-13.
#  Copyright (c) 2014年 ccc. All rights reserved.

#!/bin/bash

here=`which "$0" 2>/dev/null || echo .`
base="`dirname $here`"
SHELL_DIR=`(cd "$base"; echo $PWD)`

cd ${SHELL_DIR}/..

#项目名称
PROJECT_NAME=TurnScreen

# 项目目录
PROJECT_HOME=`(cd "$base"; echo $PWD)`
PROJECT_HOME=${PROJECT_HOME}/${PROJECT_NAME}
cd ${SHELL_DIR}


# 繁体化资源文件，源目录
CCONV_RES_SRC=${PROJECT_HOME}/zh-Hans.lproj
# 繁体化资源文件，目标目录
CCONV_RES_TARGET=${PROJECT_HOME}/zh-Hant.lproj

FILES=(
"InfoPlist.strings"
"Localizable.strings"
)

for file in ${FILES[@]}
do
    FILE_SRC=${CCONV_RES_SRC}/${file}
    FILE_TARGET=${CCONV_RES_TARGET}/${file}
    \/bin/cp ${FILE_SRC}  ${FILE_TARGET}.tc
    /usr/local/bin/cconv -f utf-8 -t utf8-tw  ${FILE_TARGET}.tc > ${FILE_TARGET}
    /bin/rm -f ${FILE_TARGET}.tc

#替换文字
    sed -i "" "s/充值/儲值/g"  ${FILE_TARGET} >/dev/null
    sed -i "" "s/在线/在線/g"  ${FILE_TARGET} >/dev/null
    sed -i "" "s/剛纔/剛才/g"  ${FILE_TARGET} >/dev/null

done

echo "繁体化成功！"

