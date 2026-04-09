#!/bin/bash

# Palitan ang mga ito base sa iyong GCP Project
PROJECT_ID="openvpn_mtk"
SERVICE_NAME="dns-pointer"
REGION="us-central1"

# 1. I-build ang Docker image
docker build -t gcr.io/$PROJECT_ID/$SERVICE_NAME .

# 2. I-push sa Google Container Registry
docker push gcr.io/$PROJECT_ID/$SERVICE_NAME

# 3. I-deploy sa Cloud Run
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --port 8080
