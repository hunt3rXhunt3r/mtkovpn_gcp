# Pumasok sa folder
cd ~/mtkovpn_gcp

# I-deploy ulit (Siguraduhin na ang PROJECT_ID ay tama)
PROJECT_ID=$(gcloud config get-value project)
SERVICE_NAME="mtkovpn-dns-new"

gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --port 8080
