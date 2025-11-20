#!/bin/bash

echo "점수를 입력하면 A/B 등급으로 변환합니다."
echo "0~100 사이의 점수를 여러 개 입력하고, 엔터만 치면 종료합니다."

scores=()
sum=0


while true; do
    read -p "점수 입력 (종료: 엔터): " s
    if [ -z "$s" ]; then
        break
    fi

    if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
        echo "점수는 0~100 사이여야 합니다."
        continue
    fi

    scores+=("$s")
done

if [ ${#scores[@]} -eq 0 ]; then
    echo "입력된 점수가 없습니다."
    exit 0
fi

echo
echo "===== 과목별 등급 ====="
for s in "${scores[@]}"; do
    if [ "$s" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi
    echo "점수: $s -> 등급: $grade"
    sum=$((sum + s))
done

avg=$((sum / ${#scores[@]}))

echo
echo "총 과목 수: ${#scores[@]}"
echo "평균 점수: $avg"

if [ "$avg" -ge 90 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 등급: $avg_grade"
