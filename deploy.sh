#!/bin/bash

# 1. Siguraduhin na ang PROJECT_ID ay kukuha sa active account mo sa Cloud Shell
# Para hindi mo na kailangang i-type manually.
PROJECT_ID=$(gcloud config get-value project)

# 2. Ang SERVICE_NAME ay dapat walang underscore (_). Gagamit tayo ng hyphen (-).
SERVICE_NAME="mtkovpn-gcp-dns"
REGION="asia-southeast1"

echo "Deploying to Project: $PROJECT_ID"

# 1. I-build ang Docker image gamit ang Cloud Build (mas mabilis sa GCP)
# Ito ay mas reliable kaysa sa 'docker build' sa loob ng Cloud Shell
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

# 2. I-deploy sa Cloud Run
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --port 8080
