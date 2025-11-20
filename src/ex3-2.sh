#!/bin/bash

echo "y = 1/2 x^2 값을 계산합니다."
echo "x 값 여러 개를 여러 번 입력할 수 있습니다. (그냥 엔터만 치면 종료)"

while true; do
    read -p "x 값 입력 (종료: 엔터): " x
    if [ -z "$x" ]; then
        echo "종료합니다."
        break
    fi

    # bc 를 이용한 실수 계산
    for num in $x; do
    y=$(echo "0.5 * $num * $num" | bc -l)
    echo "$num = $num  ->  y = 1/2 x^2 = $y"
    echo
    done
done
