#!/bin/bash

show_menu() {
    echo "========================="
    echo "리눅스 시스템 상태 확인"
    echo "========================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "========================="
}

while true; do
    show_menu
    read -p "원하는 메뉴 번호 입력: " menu

    case "$menu" in
        [1] | "1)" | "1) 사용자 정보")
            echo "--- 사용자 정보 ---"
            whoami
            id
            ;;
        [2] | "2)" | "2) GPU 또는 CPU 사용률 확인")
            echo "--- CPU 사용률 (top 사용) ---"
            top -b -n 1 | head -5

            if command -v nvidia-smi > /dev/null 2>&1; then
                echo
                echo "--- GPU 사용률 (nvidia-smi) ---"
                nvidia-smi
            else
                echo
                echo "GPU 정보(nvidia-smi)는 사용할 수 없습니다."
            fi
            ;;
        [3] | "3)" | "3) 메모리 사용량 확인")
            echo "--- 메모리 사용량 (free -h) ---"
            free -h
            ;;
        [4] | "4)" | "4) 디스크 사용량 확인")
            echo "--- 디스크 사용량 (df -h) ---"
            df -h
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
    echo "--------------------------------------------------"
    read -p "엔터 키를 누르면 메뉴로 돌아갑니다..."
    clear

    echo
done
