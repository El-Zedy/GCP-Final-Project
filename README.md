# GCP-Final-Project
**GCP final project using Terraform, Kubernetes and Docker**
## Overview
This project is designed to deploy a secure infrastructure on **Google Cloud Platform (GCP)** using **Terraform**. The infrastructure includes:
- Virtual Private Cloud (VPC) with two subnets 
    - Management Subnet & Restricted Subnet. 
- The Management Subnet contains:
    - NAT gateway & Private VM 
- The Restricted Subnet contains:
    - **Private standard GKE cluster (private control plan)**.
    
The VM must be private, and the Restricted Subnet must not have access to the internet. All images deployed on GKE comes from GCR or Artifacts registry, and the deployment must be exposed to the public internet with a **public HTTP load balancer**.
## Prerequisites
- Terraform 
- Docker
## Getting Started
- To use this project, you will need to clone the repository to your local machine using the following command:
    
      git clone https://github.com/El-Zedy/GCP-Final-Project
- Then starting by creating infrastructure using terraform

      cd Terraform\ files
      terraform init
      terraform plan
      terrafrom apply
- Dockerizing application frontend and push it to GCR
      
      cd .. 
      cd Python\ app 
      docker build -t <frontend_app_image_name> .
      docker tag <frontend_app_image_name> gcr.io/<project_id>/<gcr_image_name>
      docker push gcr.io/<project_id>/<gcr_image_name>
- Pull redis image as application backend then push it to GCR
      
      docker pull redis
      docker tag redis gcr.io<project_id>/<gcr_image_name>
- Now ssh to private vm from your local

      gcloud compute ssh --zone "<zone_name>" "<privatevm_name>"  --tunnel-through-iap --project "<project_id>"
- prepare private vm to work with GKE
      
      sudo apt-get update
      sudo apt-get install kubectl  
      sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
      gcloud container clusters get-credentials <privatecluster_name> --zone <zone_name> --project <project_id>
 - Creating kubernetes manifests files
      
        kubectl create ns <namespace_name>
      
      - create 2 services and deployments one for backend and other for forntend

      - hint: you can find all manifests files at `kubernetes manifests` directory


      
      
