
# def greeting(user_name,age=None):
#     print('*'*20)
#     print(f'Welcome {user_name}')
#     print(f"Age is {age}")
#     print('Thank you for signing in... ')
#     print('*'*20)

# greeting('Raju', 25)
# greeting('Shyam', 30)
# greeting('Baburao')


# def greeting(user_name,*hobbies):
#     print('*'*20)
#     print(f'Welcome {user_name}')
#     print("Hobbies are: ")
#     for hobby in hobbies:
#         print(f"- {hobby}")
#     print('Thank you for signing in... ')
#     print('*'*20)

# greeting('Raju','singing','dancing','playing')
# greeting('shyam', "Learning", "growing")



# def greeting(user_name, **user_info):
#     print('*'*20)
#     print(f'Welcome {user_name}')
#     for key,value in user_info.items():
#         print(f'{key} is {value}')   
#     print('Thank you for signing in... ')
#     print('*'*20)

# greeting('Raju', age=18,city="delhi",email="raju@gmail.com")
# greeting('Shyam', age=30,city="Bhopal")
# greeting('Baburao')


def add(num1,num2):
    return num1+num2

result=add(10,20)
print(result)


