#!/bin/bash
echo "📡 Watching for changes... (press Ctrl+C to stop)"
fswatch -o . | while read f; do
  echo "🔄 Detected change... pushing to GitHub"
  git add .
  git commit -m "Auto update $(date '+%H:%M:%S')" && \
  git push origin main

  echo "🚀 Deploying to Netlify (prod)..."
  netlify deploy --prod --dir=.
done
