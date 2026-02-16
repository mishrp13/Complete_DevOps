
# with open("user_info.txt",'w') as file:
#     file.write("This is my first text file using Python: ")

# with open("user_info.txt",'a') as file:
#     file.write("This is my first text file using Python:\n ")

# with open('user_info.txt','r') as file:
#     content=file.read()
# print(content)

try:
    with open('user_info.txt', 'r') as file:
        content= file.readlines()
except Exception as e:
    print(e, type(e))
else:
    for line in content:
        print(f'Welcome {line.rstrip()}')
finally:
    print("db closed")


