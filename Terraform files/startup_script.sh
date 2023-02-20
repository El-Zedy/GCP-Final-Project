#!/bin/bash
sudo apt-get update
sudo apt-get install kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
gcloud container clusters get-credentials privatecluster --zone us-central1-c --project moelzedy
kubectl get node