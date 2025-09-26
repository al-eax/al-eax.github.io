#!/usr/bin/env bash

# --- Determine blog root (one level up from scripts) ---
BLOG_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# --- Hugo binary ---
HUGO_BIN="$HOME/Apps/hugo"

# --- Run Hugo server ---
cd "$BLOG_DIR" || exit 1
"$HUGO_BIN" server -D

