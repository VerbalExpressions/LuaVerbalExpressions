vex = require("vex")

print("Test Matching\n")

tester = vex():startofline():find("http"):maybe("s"):find("://"):maybe("www."):anythingbut(" "):endofline()
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
hello = vex():begincapture():find("he"):find("l"):exactly(2):find("o, World!"):endcapture():withanycase():anything()
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
tester = vex():begincapture():find("cat"):endcapture():find(" and "):begincapture():find("dog"):endcapture():find(" and "):begincapture():find("fish"):endcapture():find(" and "):begincapture():begingroup():find("buffalo"):maybe(" "):endgroup():nomorethan(3):endcapture():anything()
cat, dog, fish, buffalo = tester:match(str)
print(cat, dog, fish, buffalo)
