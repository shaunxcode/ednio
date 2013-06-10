if not jsedn then jsedn = require "jsedn"
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
        "http://#{namespace or "www"}.edn.io/:#{value}"
            
    get: (key) -> 
        $.ajax
            type: "GET"
            url: @_kwUrl key
            dataFilter: (data) -> jsedn.parse data 
            
    set: (key, value) -> 
        $.ajax
            type: "POST"
            url: @_kwUrl key
            data: value
            

