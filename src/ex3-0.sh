#!/bin/bash

echo "===== 1. .bashrc 에 MYENV 등록 ====="

echo 'export MYENV="Hello Shell"' >> ~/.bashrc
echo "등록완료"
echo

echo "===== 2. 셸에서 MYENV 값 확인 ====="
bash -i -c 'echo "등록후 셸 MYENV: $MYENV"'
echo

echo "===== 3. 환경변수 해제 (.bashrc 에서 제거) ====="
# .bashrc 에서 해당 줄 삭제
sed -i '/export MYENV="Hello Shell"/d' ~/.bashrc
echo "환경변수 해제 완료"
echo

echo "===== 4. 셸에서 해제 여부 확인 ====="
bash -i -c 'echo "해제 후 셸 MYENV: $MYENV"'
echo

echo "===== 작업 완료 ====="