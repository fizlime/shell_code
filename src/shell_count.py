#!/usr/bin/env python3
import sys


print("=== 프로그램 시작 ===")
print(f"입력 인자 개수: {len(sys.argv) - 1}")

for i, arg in enumerate(sys.argv[1:], start=1):
    print(f"arg{i}: {arg}")

print("=== 프로그램 종료 ===")
