#!/bin/bash
kubectl apply -f k8s/deployments/
kubectl apply -f k8s/services/
kubectl apply -f k8s/configmaps/
kubectl apply -f k8s/secrets/
