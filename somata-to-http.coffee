PORT = process.argv[2]
if !PORT
    console.log "Usage: somata-to-http.coffee [http port]"
    process.exit()

somata = require 'somata'
polar = require 'polar'

client = new somata.Client

cors_middleware = (req, res, next) ->
    res.setHeader 'Access-Control-Allow-Origin', '*'
    res.setHeader 'Access-Control-Allow-Headers', 'Content-Type, token'
    next()

app = polar {port: PORT, middleware: [cors_middleware]}

app.post '/:service/:method', (req, res) ->
    {service, method} = req.params
    args = req.body
    client.remote service, method, args..., (err, got) ->
        if err
            res.send 500, err
        else
            res.json got

app.start()
