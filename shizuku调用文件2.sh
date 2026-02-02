#!/system/bin/sh
SOURCE_PATH="/storage/emulated/0/Android/data/moe.shizuku.privileged.api/starter"
STARTER_PATH="/data/local/tmp/shizuku_starter"
recreate_tmp() {
  rm -rf /data/local/tmp &>/dev/null
  mkdir -p /data/local/tmp &>/dev/null
}
broken_tmp() {
  exit 1
}
if [ -f "$SOURCE_PATH" ]; then
    rm -f $STARTER_PATH &>/dev/null
    cp "$SOURCE_PATH" $STARTER_PATH &>/dev/null
    res=$?
    if [ $res -ne 0 ]; then
      recreate_tmp
      cp "$SOURCE_PATH" $STARTER_PATH &>/dev/null
      res=$?
      if [ $res -ne 0 ]; then
        broken_tmp
      fi
    fi
    chmod 700 $STARTER_PATH &>/dev/null
    chown 2000 $STARTER_PATH &>/dev/null
    chgrp 2000 $STARTER_PATH &>/dev/null
fi
if [ -f $STARTER_PATH ]; then
    $STARTER_PATH "$1" &>/dev/null
else
    exit 1
fi
