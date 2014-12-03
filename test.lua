vex = require("vex")

print("Test Matching\n")

tester = vex():startOfLine():find("http"):maybe("s"):find("://"):maybe("www."):anythingBut(" "):endOfLine()
testURL = "https://github.com"

print("Testing \n\t" .. tester.pattern .. "\nagainst\n\t" .. testURL .. "\n")
res = tester:match(testURL)
print(res and "It works!" or "It's broken!")


print("\n\nTest Replacing\n")
repStr = "Replace a bird with a duck"
print(repStr)

res = vex():find("bird"):gsub(repStr, "duck")
print(res)


print("\n\nTest Quantifiers\n")
hello = vex():beginCapture():find("he"):find("l"):exactly(2):find("o, World!"):endCapture():withAnyCase():anything()
testStr = "Hello, World! This is Verbal Expressions!"
print("With 2 l's")
print("\t" .. hello.pattern)
print("\t" .. testStr)
print("\t" .. (hello:match(testStr) or "No match!"))
testStr = "Helo, World! This is Verbal Expressions!"
print("With 1 l")
print("\t" .. hello.pattern)
print("\t" .. testStr)
print("\t" .. (hello:match(testStr) or "No match!"))

print("\n\nTest Captures\n")
str = "cat and dog and fish and buffalo buffalo buffalo buffalo buffalo buffalo"
tester = vex():beginCapture():find("cat"):endCapture():find(" and "):beginCapture():find("dog"):endCapture():find(" and "):beginCapture():find("fish"):endCapture():find(" and "):beginCapture():beginGroup():find("buffalo"):maybe(" "):endGroup():noMoreThan(3):endCapture():anything()
cat, dog, fish, buffalo = tester:match(str)
print(cat, dog, fish, buffalo)
