#!/bin/bash

if [ $# -lt 2 ]; then
    echo "인자가 두 개 이상 필요합니다."
    echo "사용법: $0 <인자1> <인자2> ..."
    exit 1
fi

echo "셸에서 파이썬 실행파일을 시작합니다."
python3 shell_count.py "$@"
echo "셸에서 파이썬 실행파일이 종료되었습니다."