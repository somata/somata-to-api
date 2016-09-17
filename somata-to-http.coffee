[SERVICE, PORT] = process.argv.slice(2)
if !SERVICE or !PORT
    console.log "Usage: somata-to-http.coffee [service name] [http port]"
    process.exit()

somata = require 'somata'
polar = require 'polar'

client = new somata.Client
Service = client.bindRemote SERVICE

cors_middleware = (req, res, next) ->
    res.setHeader 'Access-Control-Allow-Origin', '*'
    res.setHeader 'Access-Control-Allow-Headers', 'Content-Type, token'
    next()

app = polar {port: PORT, middleware: [cors_middleware]}

app.post '/:method', (req, res) ->
    method = req.params.method
    args = req.body
    Service method, args..., (err, got) ->
        if err
            res.send 500, err
        else
            res.json got

app.start()
