Vex - Verbal Expressions for Lua
================================
Vex is a Lua module which implements the [Verbal Expressions](https://github.com/VerbalExpressions/) standard in order to simplify regular expressions to common language.

## Getting Started
First, install the [lrexlib-pcre](https://github.com/rrthomas/lrexlib/) module. This is usually done with LuaRocks.
```
luarocks install lrexlib-pcre
```
Then, require the vex module in your project.
```Lua
vex = require("vex")
```
After that, all you need to do is create a new vex object and you can start working with it!

## Examples
Here are a few examples to show you how it all works.

### Matching against a URL
Here, we test to see if a URL is valid. Note that each method in the vex object returns itself, allowing you to chain methods together.
```Lua
tester = vex():startofline():find("http"):maybe("s"):find("://"):maybe("www."):anythingbut(" "):endofline()
testURL = "https://github.com"

print("Testing \n\t" .. tester.pattern .. "\nagainst\n\t" .. testURL .. "\n")
res = tester:match(testURL)
print(res and "Valid!" or "Invalid!")
```

### Replacing text
Here, we use a vex object's gsub method to replace "bird" with "duck".
```Lua
repStr = "Replace a bird with a duck"
print(repStr)

res = vex():find("bird"):gsub(repStr, "duck")
print(res)
```

### Captures, groups, and quantifiers
Vex also supports captures and has methods to specify how many of an object or group you want.
```Lua
str = "cat and dog and fish and buffalo buffalo buffalo buffalo buffalo buffalo"
tester = vex():begincapture():find("cat"):endcapture():find(" and "):begincapture():find("dog"):endcapture():find(" and "):begincapture():find("fish"):endcapture():find(" and "):begincapture():begingroup():find("buffalo"):maybe(" "):endgroup():nomorethan(3):endcapture():anything()
cat, dog, fish, buffalo = tester:match(str)
print(cat, dog, fish, buffalo)
```

### Notes
Much like the [Ruby implementation](https://github.com/ryan-endacott/verbal_expressions) of Verbal Expressions, the *or* method has been implemented as *alternatively* due to *or* being a keyword in Lua. For the same reason, *then* is not implemented.

### What else?
If you'd like to contribute, please do. Feel free to clone, fork, or send a pull request. This module is here for everyone!
