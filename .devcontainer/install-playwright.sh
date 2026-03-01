#!/bin/bash
set -e

echo "🧹 Cleaning up broken package sources..."
# Disable problematic third-party repos that cause NO_PUBKEY errors
sudo rm -rf /etc/apt/sources.list.d/*

echo "🔄 Updating core Ubuntu repositories..."
sudo apt-get update

echo "📦 Installing Playwright and dependencies..."
# Install the python library first
pip install playwright

# Install the system libraries and the chromium browser
# Using 'python3 -m' ensures it hits the correct environment
python3 -m playwright install-deps chromium
python3 -m playwright install chromium

echo "✅ ALL DONE! Playwright is ready."
