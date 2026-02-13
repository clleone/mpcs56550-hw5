#!/bin/bash
# Rollback traffic from green to blue

echo "Rolling back to blue."
kubectl patch service login-app-bluegreen -p '{"spec":{"selector":{"version":"blue"}}}'
echo "Traffic rolled back to blue!"

echo ""
echo "Check what version is active:"
kubectl get service login-app-bluegreen -o jsonpath='{.spec.selector.version}'
echo ""