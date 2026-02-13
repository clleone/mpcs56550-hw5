#!/bin/bash
# Gradually increase canary traffic from 20% to 100%

echo "Starting canary promotion..."
echo ""

echo "Initial: 20% canary"
kubectl annotate ingress login-app-canary nginx.ingress.kubernetes.io/canary-weight=20 --overwrite
echo "Current weight: 20%"
echo ""
read -p "Press Enter to increase to 50%..."

echo "Promoted: 50% canary"
kubectl annotate ingress login-app-canary nginx.ingress.kubernetes.io/canary-weight=50 --overwrite
echo "Current weight: 50%"
echo ""
read -p "Press Enter to increase to 80%..."

echo "Final: 100% canary"
kubectl annotate ingress login-app-canary nginx.ingress.kubernetes.io/canary-weight=100 --overwrite
echo "Current weight: 100%"
echo ""
echo "Canary promotion complete!"