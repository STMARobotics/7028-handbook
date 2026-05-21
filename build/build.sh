#!/usr/bin/env bash
# ============================================================
# 7028 Handbook Build Script
# Usage: bash build/build.sh  (from anywhere inside the repo)
# Output: handbook.pdf at repo root
# ============================================================

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG="$REPO_ROOT/config/settings.yaml"
TEMPLATE="$REPO_ROOT/config/template.tex"
OUTPUT="$REPO_ROOT/handbook.pdf"

# CRITICAL: run from repo root so all relative paths resolve
cd "$REPO_ROOT"

# ── Pandoc version check ──────────────────────────────────────
REQUIRED_PANDOC="3.1.9"
if ! command -v pandoc &>/dev/null; then
  echo "ERROR: pandoc not found. Install pandoc $REQUIRED_PANDOC"; exit 1
fi
PANDOC_VERSION=$(pandoc --version | head -1 | awk '{print $2}')
if [ "$PANDOC_VERSION" != "$REQUIRED_PANDOC" ]; then
  echo "WARNING: Expected pandoc $REQUIRED_PANDOC, found $PANDOC_VERSION"
fi

# ── Validate section files ────────────────────────────────────
python3 -c "
import yaml, os, sys
with open('$CONFIG') as f:
    cfg = yaml.safe_load(f)
missing = [s for s in cfg.get('sections', []) if not os.path.exists(s)]
if missing:
    print('ERROR: Missing section files:')
    [print(f'  {m}') for m in missing]
    sys.exit(1)
print(f'All {len(cfg[\"sections\"])} section files found.')
"

# ── Read section order ────────────────────────────────────────
SECTION_FILES=$(python3 -c "
import yaml
with open('$CONFIG') as f:
    cfg = yaml.safe_load(f)
for s in cfg.get('sections', []):
    print(s)
")

# ── Run Pandoc → tex, then xelatex ───────────────────────────
# Two-step build lets us set TEXINPUTS so fonts/ resolves correctly
echo "Building handbook..."

TMP_TEX=$(mktemp /tmp/handbook-XXXXXX.tex)

pandoc \
  --from=markdown+raw_tex \
  --to=latex \
  --template="$TEMPLATE" \
  --metadata-file="$CONFIG" \
  --resource-path="$REPO_ROOT" \
  --variable=graphics \
  --output="$TMP_TEX" \
  $SECTION_FILES

# TEXINPUTS includes repo root so fonts/ and assets/ paths resolve
# First pass — generates .aux and .toc
TEXINPUTS="$REPO_ROOT:$REPO_ROOT/fonts::" \
  xelatex -halt-on-error -interaction=nonstopmode \
  -output-directory="$REPO_ROOT" \
  "$TMP_TEX" 2>&1 | grep -v "^This is\|^Document\|^LaTeX2e\|Underfull\|Overfull\|microtype\|hyperref\|rerunfile" | tail -5

# Second pass — resolves TOC page numbers and cross-references
TEXINPUTS="$REPO_ROOT:$REPO_ROOT/fonts::" \
  xelatex -halt-on-error -interaction=nonstopmode \
  -output-directory="$REPO_ROOT" \
  "$TMP_TEX" 2>&1 | grep -v "^This is\|^Document\|^LaTeX2e\|Underfull\|Overfull\|microtype\|hyperref\|rerunfile" | tail -5

# xelatex names output after the input file basename
BUILT_PDF="$REPO_ROOT/$(basename ${TMP_TEX%.tex}).pdf"
if [ -f "$BUILT_PDF" ]; then
  mv "$BUILT_PDF" "$OUTPUT"
  # Clean up aux files
  rm -f "$REPO_ROOT/$(basename ${TMP_TEX%.tex})".*
  rm -f "$TMP_TEX"
  echo "✓ Built: $OUTPUT ($(du -sh $OUTPUT | cut -f1))"
else
  echo "ERROR: PDF not produced"; exit 1
fi
