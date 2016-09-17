# somata-to-http

Quickly expose a Somata service as an HTTP endpoint.

```
coffee somata-to-http.coffee [service name] [http port]
```

POST to `http://localhost:[http port]/[method name]` with a JSON array of arguments `["test", 55]`

## Example

```
coffee somata-to-http.coffee hello 5544

curl -X POST -d '["Test Jones"]' -H 'Content-Type: application/json' http://localhost:5544/sayHello
"Hello Test Jones!"
```