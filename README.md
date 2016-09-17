# somata-to-http

Quickly expose Somata services with an HTTP endpoint.

```
coffee somata-to-http.coffee [http port]
```

POST to `http://localhost:[http port]/[service name]/[method name]` with a JSON array of arguments `["test", 55]`

## Example

Call the `hello` service's `sayHello` method with a single argument `"Test Jones"`:

```
coffee somata-to-http.coffee 5544

curl -X POST -d '["Test Jones"]' -H 'Content-Type: application/json' http://localhost:5544/hello/sayHello
"Hello Test Jones!"
```
