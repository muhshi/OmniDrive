#!/bin/bash

# OmniDrive One-Click Deployment Script

set -e

echo "🚀 Starting OmniDrive deployment..."

# 1. Pull latest code from main branch
echo "📥 Pulling latest code from GitHub..."
git pull origin main

# 2. Check if backend/.env file exists
if [ ! -f "backend/.env" ]; then
    echo "⚠️ Warning: backend/.env not found! Creating from example..."
    cp backend/.env.example backend/.env
    echo "❗ Please configure your credentials in backend/.env before continuing."
fi

# 3. Stop running containers to clear env cache
echo "🛑 Stopping existing containers..."
docker compose down

# 4. Rebuild and start containers in detached mode
echo "🏗️ Building and starting Docker containers..."
docker compose up -d --build

# 5. Check container status
echo "📊 Checking container status..."
docker compose ps

echo ""
echo "🎉 Deployment completed successfully!"
echo "👉 Access OmniDrive at: http://10.133.21.24.nip.io:8085"
