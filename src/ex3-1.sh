#!/bin/bash

# 인자 개수 확인 
if [ $# -ne 2 ]; then
    echo "사용법: $0 <숫자1> <숫자2>"
    exit 1
fi

a=$1  # 첫 번째 인자
b=$2  # 두 번째 인자

echo "정수 범위에서 작동하는 연산 프로그램입니다."
echo "첫 번째 숫자: $a"
echo "두 번째 숫자: $b"

sum=$((a + b))
sub=$((a - b))
mul=$((a * b))

if [ "$b" -ne 0 ]; then
    div=$((a / b))
else
    div="0으로 나눌 수 없습니다"
fi

echo "덧셈: $a + $b = $sum"
echo "뺄셈: $a - $b = $sub"
echo "곱셈: $a * $b = $mul"
echo "나눗셈: $a / $b = $div"