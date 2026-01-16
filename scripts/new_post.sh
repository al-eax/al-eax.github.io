#!/usr/bin/env bash

# --- Configuration ---
HUGO_BIN="$HOME/Apps/hugo"
BLOG_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# --- Check argument ---
if [ -z "$1" ]; then
  echo "❌ Please provide a post name."
  echo "Usage: ./new_post.sh my-fancy-post"
  exit 1
fi

NAME="$1"
DATE=$(date +%Y-%m-%d)
POST_DIR="posts/${DATE}_${NAME}"

# --- Create posts using Hugo ---
cd "$BLOG_DIR" || exit 1
for LANG in en de; do
  POST_PATH="${POST_DIR}/${NAME}.${LANG}.md"
  "$HUGO_BIN" new "$POST_PATH"
done
