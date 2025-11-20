#!/bin/bash

function run_cmd() {
    # 첫 번째 인자는 실행할 명령, 나머지는 옵션/인자
    cmd="ls $@"
    
    echo "[실행할 명령어] : $cmd"
    # eval 로 하나의 명령 문자열처럼 실행
    eval "$cmd"
}

echo ">>1. 기본 실행"
run_cmd
echo

echo ">> 2. 옵션(-l) 전달"
run_cmd -l
echo

echo ">> 3. 복합 옵션(-al) 및 경로 (/tmp) 전달"
run_cmd -al /tmp