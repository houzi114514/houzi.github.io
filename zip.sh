[ $# -ne1 ]&&exit1
unzip -oq $1&&unzip -oq ${1%.zip}1.zip&&unzip -oq ${1%.zip}2.zip&&echo 完成