#!/bin/bash
# Switch traffic from blue to green

echo "Switching traffic to green environment."
kubectl patch service login-app-bluegreen -p '{"spec":{"selector":{"version":"green"}}}'
echo "Now on green."

echo ""
echo "Check what version is active:"
kubectl get service login-app-bluegreen -o jsonpath='{.spec.selector.version}'
echo ""
