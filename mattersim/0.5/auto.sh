#!/usr/bin/env bash
set -euo pipefail

BASE="$(cd "$(dirname "$0")" && pwd)"

# cif 파일 목록(버전정렬) 만들기
shopt -s nullglob
mapfile -t CIFS < <(ls -1v "$BASE"/*.cif 2>/dev/null || true)

if (( ${#CIFS[@]} == 0 )); then
  echo "ERROR: $BASE 에 .cif 파일이 없음"
  exit 1
fi

# 변환에 쓸 파이썬(=pymatgen) 가능 여부 체크
PY_CONVERTER_OK=0
if command -v python >/dev/null 2>&1; then
  if python - <<'PY' >/dev/null 2>&1
from pymatgen.core import Structure
PY
  then
    PY_CONVERTER_OK=1
  fi
fi

if (( PY_CONVERTER_OK == 0 )); then
  echo "ERROR: CIF -> POSCAR 변환용 pymatgen 이 필요함."
  echo "       예) pip install pymatgen"
  exit 1
fi

echo "BASE = $BASE"
echo "Found ${#CIFS[@]} cif files."

# 0,1,2,... 폴더 만들고 작업
for i in "${!CIFS[@]}"; do
  cif="${CIFS[$i]}"
  d="$BASE/$i"
  mkdir -p "$d"

  echo "=== [$i] $(basename "$cif") -> $d ==="

  # 원본은 남기고, 폴더로 복사
  cp -f "$cif" "$d/"

  cd "$d"

  # cif -> POSCAR (복사된 cif 기준)
  python - <<PY
from pymatgen.core import Structure
from pymatgen.io.vasp import Poscar
import glob

cifs = sorted(glob.glob("*.cif"))
if not cifs:
    raise SystemExit("No .cif in this folder")

s = Structure.from_file(cifs[0])
Poscar(s).write_file("POSCAR")
PY

  # vaspkit: 102 -> 2 -> 0.03
  printf "102\n2\n0.03\n" | vaspkit > vaspkit_auto.log 2>&1

  cd "$BASE"
done

echo "DONE."

