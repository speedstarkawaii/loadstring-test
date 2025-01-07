# loadstring-test

tests your exploit for loadstring() and starts to brutetest and expirement on it.
if you fail; you dont have a proper loadstring. this document shows what u should do

# how you should be doing loadstring

typically, you should register it in luac but some "folks" (skids) paste external module editing exploits; where loadstring can be a challenge.

a loadstring override in lua would look something like this:

```lua
local loadstring = newcclosure(function(source)

end)
```

you should always return, not just execute. ive **seen** exploits just push the script without scanning for errors. that WILL work in some cases, but if i were to load a say a website for example, it wont work. because you need to load the compiled, if it was a function, compiled function then.

in luac however, you would use `luau_load` to attempt to load the script from the first argument, second argument SHOULD be accepted as a chunk however not much scripts do that so its optional
