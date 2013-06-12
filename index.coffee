if not jsedn? then `jsedn = require("jsedn")`
module.exports =
    _kwParts: (kw) ->
        parts = kw.replace(/\:/g, "").split "/"
        switch parts.length
            when 1 
                namespace: null, value: parts[0]
            when 2
                namespace: parts[0], value: parts[1]
            else
                throw new Error "keyword invalid. expects x/y, a.b.c/d or just x"

    _kwUrl: (kw) -> 
        {namespace, value} = @_kwParts kw
        "http://#{if namespace then "#{namespace}." else ""}edn.io/:#{value}"
            
    get: (key, path) -> 
        $.ajax
            type: "GET"
            url: @_kwUrl key
            data: if path then {path} else {}
            dataFilter: (data) -> jsedn.parse data 
            
    set: (key, value) -> 
        jsedn.parse value
        $.ajax
            type: "POST"
            url: @_kwUrl key
            data: value
            

