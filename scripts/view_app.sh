#!/usr/bin/env bash

##  Просмотр приложения в терминале
## Вспомним, что поды работают в изолированной, частной сети,
## поэтому нам нужен прокси для доступа к ним — так мы сможем производить отладку и взаимодействовать с ними.
## Для этого мы во втором терминале воспользуемся командой `kubectl proxy`, чтобы запустить прокси.
## Откройте новое окно терминала и выполните:
##          `kubectl proxy`
## Теперь мы снова получим имя пода и обратимся к нему через прокси.
## Чтобы получить имя пода и записать его в переменную окружения `POD_NAME`, выполним:

export POD_NAME="$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')";

echo Name of the Pod: $POD_NAME;

## Чтобы увидеть вывод приложения, выполним запрос через curl:
echo "Здесь URL указывает на маршрут к pod API: ";
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME:8080/proxy/;

kubectl logs "$POD_NAME";

kubectl exec "$POD_NAME" -- env;