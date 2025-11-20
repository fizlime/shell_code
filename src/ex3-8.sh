#!/bin/bash

DB_DIR="DB"
TRAIN_DIR="train"

echo "1) DB 폴더 존재 확인 및 생성"
if [ ! -d "$DB_DIR" ]; then
    mkdir "$DB_DIR"
    echo "$DB_DIR 폴더 생성 완료"
else
    echo "$DB_DIR 폴더가 이미 존재합니다."
fi

echo
echo "2) DB 폴더에 임의의 5개 파일 생성"
for i in 1 2 3 4 5; do
    fname="$DB_DIR/file$i.txt"
    echo "This is file$i" > "$fname"
    echo "생성: $fname"
done

echo
echo "3) DB 폴더 파일 압축 (tar.gz)"
tar -czf db_files.tar.gz "$DB_DIR"
echo "압축 파일: db_files.tar.gz 생성 완료"

echo
echo "4) train 폴더 생성 및 링크 생성"
if [ ! -d "$TRAIN_DIR" ]; then
    mkdir "$TRAIN_DIR"
    echo "$TRAIN_DIR 폴더 생성 완료"
fi

for i in 1 2 3 4 5; do
    src="../$DB_DIR/file$i.txt"
    dest="$TRAIN_DIR/file$i.txt"
    # 이미 링크가 있으면 삭제
    [ -e "$dest" ] && rm -f "$dest"
    ln -s "$src" "$dest"
    echo "링크 생성: $dest -> $src"
done

echo
echo "작업 완료."
