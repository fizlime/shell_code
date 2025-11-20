#!/bin/bash

scores=()
subjects=()

calc_avg() {
    if [ ${#scores[@]} -eq 0 ]; then
        echo 0
        return
    fi

    local sum=0
    for s in "${scores[@]}"; do
        sum=$((sum + s))
    done
    echo $((sum / ${#scores[@]}))
}

convert_gpa() {
    local avg=$1
    local gpa

    # 학점 정보가 없어, 단순 평균 점수를 기준으로 등급 환산
    if   [ "$avg" -ge 90 ]; then gpa=4.0
    elif [ "$avg" -ge 80 ]; then gpa=3.0
    elif [ "$avg" -ge 70 ]; then gpa=2.0
    elif [ "$avg" -ge 60 ]; then gpa=1.0
    else gpa=0.0
    fi

    echo "$gpa"
}

while true; do
    echo "===================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "===================="
    read -p "메뉴 선택: " menu

    case "$menu" in
        [1] | "1)" | "1) 과목 성적 추가")
            read -p "추가할 점수 (0~100): " s
            if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
                echo "0~100 사이로 입력하세요."
            else
                scores+=("$s")
                echo "점수 $s 추가 완료."
                read -p "과목명 입력: " sub
                subjects+=("$sub")
            fi
            ;;
        [2] | "2)" | "2) 입력된 모든 점수 보기")
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                echo "<입력된 과목과 점수들>"
                for ((i=0; i < ${#scores[@]}; i++)); do
                    printf '%s : %s점\n' "${subjects[i]}" "${scores[i]}"
                done
            fi
            ;;
        [3] | "3)" | "3) 평균 점수 확인")
            avg=$(calc_avg)
            echo "평균 점수: $avg"
            ;;
        [4] | "4)" | "4) 평균 등급 (GPA) 변환")
            avg=$(calc_avg)
            gpa=$(convert_gpa "$avg")
            echo "평균 점수: $avg"
            echo "GPA (예시 스케일): $gpa"
            ;;
        [5] | "5)" | "5) 종료")
            echo "종료합니다."
            break
            ;;
        *)
            echo "1~5 중에서 선택하세요."
            ;;
    esac

    echo
done
