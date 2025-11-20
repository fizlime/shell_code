#!/bin/bash
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

DB_FILE="DB.txt"

# DB 파일 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

add_member() {
    read -p "이름: " name
    read -p "생일 또는 전화번호: " info
    echo "MEMBER|$name|$info" >> "$DB_FILE"
    echo "팀원 정보가 추가되었습니다."
}

add_log() {
    read -p "날짜(예: 2025-11-20): " date
    read -p "팀원 이름: " name
    read -p "함께 한 일(내용): " content
    echo "LOG|$date|$name|$content" >> "$DB_FILE"
    echo "팀원과 한 일이 기록되었습니다."
}

search_member() {
    read -p "검색할 팀원 이름: " name
    echo "=== 팀원 검색 결과 ==="
    grep -a "^MEMBER|$name|" "$DB_FILE" || echo "검색된 정보가 없습니다."
}

search_log() {
    read -p "검색할 날짜(예: 2025-11-20): " date
    echo "=== 날짜별 수행 내용 검색 결과 ==="
    grep -a "^LOG" "$DB_FILE" | grep -a "$date" 
    if [ $? -ne 0 ]; then
        echo "검색된 내용이 없습니다."
    fi
}

while true; do
    echo "===================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "===================="
    read -p "메뉴 선택: " menu

    case "$menu" in
        [1] | "1)" | "1) 팀원 정보 추가") add_member ;;
        [2] | "2)" | "2) 팀원과 한 일 기록") add_log ;;
        [3] | "3)" | "3) 팀원 검색") search_member ;;
        [4] | "4)" | "4) 수행 내용 검색") search_log ;;
        [5] | "5)" | "5) 종료")
            echo "종료합니다."
            break
            ;;
        *)
            echo "1~5 중에서 선택하세요."
            ;;
    esac

done