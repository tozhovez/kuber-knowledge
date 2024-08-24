#!/usr/bin/env bash

kubectl get pods;
kubectl get service;

## Чтобы создать новый сервис и сделать его доступным для внешних пользователей, воспользуемся командой `expose` с указанием типа сервиса `NodePort` в качестве параметра.

kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080;


## Объявим переменную окружения `NODE_PORT`, в которую запишем значение назначенного порта узла:

export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')";
echo "NODE_PORT=$NODE_PORT";

curl http://"$(minikube ip):$NODE_PORT";

export POD_NAME="$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')"
echo "Name of the Pod: $POD_NAME";

kubectl label pods "$POD_NAME" version=v1;

kubectl describe pods "$POD_NAME";