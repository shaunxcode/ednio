#ednio 
client lib for getting/setting values on edn.io

##API

key is of the form ":namespace.here/value-name-here" 

returns jquery ajax promise thus done, fail, always may be chained

```
ednio.get(":world.animals/cats").done(function(data) {
    #data will be jsedn parsed edn form for key
});
``` 

You can pass a second param to get which is an edn path into the form e.g.
```
ednio.get(":world.animals/cats", ":jungle 2 :name").done(function(data) {
    #data will just be the name of the third jungle cat e.g. puma
});
```

Key is handled as above and returned object is jquery ajax promise.

```
ednio.set(":some-ns.sub-ns/test", value).done(function(){
	console.log("Saved");
});
```

