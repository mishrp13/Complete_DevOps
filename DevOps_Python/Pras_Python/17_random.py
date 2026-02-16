import random

while True:
    print(f'Number is {random.randint(1,6)}')
    user_input=input(f"Do you want to continue y/n: ")
    if user_input== 'n':
        break


# print(random.random())
# print(random.randint(1,21))
# print(random.uniform(3.5,6.5))

# fruits_List= ['apple', 'orange', 'kiwi', 'banana']
# print(random.choice(fruits_List))
# print(fruits_List)
# random.shuffle(fruits_List)
# print(fruits_List)

