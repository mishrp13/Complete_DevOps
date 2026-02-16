marks={
    'Hindi': 80,
    'English':90,
    'Science':93
    }
print(type(marks))

print(marks["Hindi"])
print(marks.get("Science"))

del marks['Hindi']
print(marks)