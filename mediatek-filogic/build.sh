#!/usr/bin/env bash
set -Eeuo pipefail

: "${IMAGEBUILDER_URL:?IMAGEBUILDER_URL is required}"
: "${IMAGEBUILDER_SHA256:?IMAGEBUILDER_SHA256 is required}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK_DIR="${RUNNER_TEMP:-/tmp}/immortalwrt-mt3000"
ARCHIVE="${WORK_DIR}/imagebuilder.tar.zst"
mkdir -p "$WORK_DIR"

curl --fail --location --retry 5 --retry-delay 3 "$IMAGEBUILDER_URL" -o "$ARCHIVE"
echo "${IMAGEBUILDER_SHA256}  ${ARCHIVE}" | sha256sum --check -
tar --zstd -xf "$ARCHIVE" -C "$WORK_DIR"
IB_DIR="$(find "$WORK_DIR" -maxdepth 1 -type d -name 'immortalwrt-imagebuilder-*' -print -quit)"
test -n "$IB_DIR"
cd "$IB_DIR"

PACKAGES="$(grep -Ev '^[[:space:]]*(#|$)' "$ROOT_DIR/mediatek-filogic/packages.txt" | tr '\n' ' ')"
test -n "$PACKAGES"
make info | tee "$WORK_DIR/imagebuilder-info.txt"
grep -q 'glinet_gl-mt3000' "$WORK_DIR/imagebuilder-info.txt" || {
  echo "ERROR: glinet_gl-mt3000 profile is not present in this ImageBuilder." >&2
  exit 20
}

make image PROFILE="glinet_gl-mt3000" PACKAGES="$PACKAGES" FILES="$ROOT_DIR/files" EXTRA_IMAGE_NAME="custom"

OUT_DIR="$ROOT_DIR/bin/targets/mediatek/filogic"
mkdir -p "$OUT_DIR"
find "$IB_DIR/bin/targets/mediatek/filogic" -maxdepth 1 -type f \( -name '*gl-mt3000*' -o -name 'profiles.json' -o -name 'sha256sums' \) -exec cp -v {} "$OUT_DIR/" \;
if ! compgen -G "$OUT_DIR/*gl-mt3000*sysupgrade*" > /dev/null; then
  echo "ERROR: no GL-MT3000 sysupgrade image was produced." >&2
  exit 21
fi
ls -lh "$OUT_DIR"
