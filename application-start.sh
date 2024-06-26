#!/bin/bash

docker build -t cc-backend-user:1.0 ./user-management
docker build -t cc-backend-product:1.0 ./product-management
docker build -t cc-backend-order:1.0 ./order-management
docker build -t cc-backend-review:1.0 ./review-management
docker build -t cc-frontend:1.0 ./frontend

docker tag cc-backend-user:1.0 abhayjo/cc-backend-user:1.0
docker tag cc-backend-product:1.0 abhayjo/cc-backend-product:1.0
docker tag cc-backend-order:1.0 abhayjo/cc-backend-order:1.0
docker tag cc-backend-review:1.0 abhayjo/cc-backend-review:1.0
docker tag cc-frontend:1.0 abhayjo/cc-frontend:1.0

docker push abhayjo/cc-backend-user:1.0
docker push abhayjo/cc-backend-product:1.0
docker push abhayjo/cc-backend-order:1.0
docker push abhayjo/cc-backend-review:1.0
docker push abhayjo/cc-frontend:1.0


kubectl apply -f ./mongodb/db-deployment.yaml
sleep 2
kubectl apply -f ./user-management/user-deployment.yaml
sleep 2
kubectl apply -f ./product-management/product-deployment.yaml
sleep 2
kubectl apply -f ./order-management/order-deployment.yaml
sleep 2
kubectl apply -f ./review-management/review-deployment.yaml
sleep 2
kubectl apply -f ./frontend/frontend-deployment.yaml

kubectl apply -f ./mongodb/db-service.yaml
sleep 2
kubectl apply -f ./user-management/user-service.yaml
sleep 2
kubectl apply -f ./product-management/product-service.yaml
sleep 2
kubectl apply -f ./order-management/order-service.yaml
sleep 2
kubectl apply -f ./review-management/review-service.yaml
sleep 2
kubectl apply -f ./frontend/frontend-service.yaml