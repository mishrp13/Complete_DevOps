# dictionary = {
#     "cat": "a small animal",
#     "table": ["A piece of furniture", "facts and figures"]
# }

# print(dictionary)


# subjects = {
#       "python", "java", "c++", "python", "javascript", "java", 
#       "python", "java", "c++", "c"
# }

# print(len(subjects))


marks ={}

x = int(input("enter the marks of Phy: "))
marks.update({"phy": x})

y = int(input("enter the marks of Maths: "))
marks.update({"Math": y})

z = int(input("enter the marks of chemitry: "))
marks.update({"chemistry": z})

print(marks)