# print("Enter a number to check if the number is even or not: ")


# user_input=""
# while user_input !='q':
#     user_input= input("Enter a number or q for quit: ")
#     if user_input.isdigit():
#         if int(user_input)%2==0:
#             print("Number is even: ")
#         else:
#             print("Number is odd:")

        
num = [10,20,30,-40,50]
# for n in num:
#     if n==30:
#         continue
#     print(n)

for n in num:
    if n<0:
        continue
    print(n)