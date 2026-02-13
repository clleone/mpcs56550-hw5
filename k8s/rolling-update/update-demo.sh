#!/bin/bash
# Demonstrate rolling update from v1 to v2

echo "Rolling Update Demo"
echo "==================="
echo ""

echo "Current deployment state"
kubectl get deployment login-app-rolling
kubectl get pods -l app=login-app
echo ""
read -p "Press Enter to update to v2."

echo "Updating to v2"
kubectl set image deployment/login-app-rolling login-app=flask-login-app:v2
echo ""

echo "Watching rollout progress"
kubectl rollout status deployment/login-app-rolling
echo ""

echo "Deployment after update"
kubectl get pods -l app=login-app
echo ""
read -p "Press Enter to rollback to v1."

echo "Rolling back to v1"
kubectl rollout undo deployment/login-app-rolling
kubectl rollout status deployment/login-app-rolling
echo ""

echo "After rollback"
kubectl get pods -l app=login-app
echo ""
echo "End of demo."