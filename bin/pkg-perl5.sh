#!/bin/bash

echo -e "是否批量安裝所有包? [ y(Yes) / any(No) ]"
read -r yes_or_no_1
if [[ "$yes_or_no_1" == y ]]; then
    # 安裝 cpanm
    cpan -i App::cpanminus
fi
