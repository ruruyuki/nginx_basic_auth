#!/bin/bash

#ログ出力関数を定義
function log () {
   LOG="./log/$(echo $0 | sed -e 's/.sh//g').log"
   time=$(date '+%Y/%m/%d %T')
   echo $time $1 | tee -a $LOG
   if [[ $2 != "" ]]; then
       echo $2 | tee -a $LOG
   fi   
}

# 処理開始logを出力
log "処理開始"

# Docker-compose起動
log "docker-compose up -d --build 実行"
result="$(docker-compose up -d --build 2>&1 > /dev/null)"

# Docker-compose実行判定
if [[ $(echo $?) -ne 0 ]]; then
    log "Docker-compose 起動失敗" "$result"
    exit 1
fi


log "docker-compose up -d --build 正常終了"

# 処理終了logを出力
log "処理終了" 

 # 処理終了
exit 0
