
# if True:
#     print("hey it is true")
# else:
#     print("hey it is false")


# print("enter a number to check if that is even or not")

# num=int(input("enter any number: "))
# if num%2==0:
#     print(f"num is even ")
# else:
#     print(f"num is odd ")


users = ["paul", "raju"]

# if 'pauly' in users:
#     print('user exist')
# else:
#     print("user does not exist")


if users:
    print("List is not empty")
else:
    print("List is empty")


# marks=int(input("enter total marks: "))

# if marks>=80:
#     print("Grade A")
# elif marks>=60:
#     print("Grade B")
# elif marks>=40:
#     print("Grade C")
# else:
#     print("Failed")

age =20
Voter_id=False

# if age>=18:
#     if Voter_id:
#         print("yes you can vote")
#     else:
#         print("Please apply for voter id")
# else:
#     print("You cannot vote")

# Both the conditions needs to be true to get it through
# if age >=18 and Voter_id:
#     print("You can vote")
# else:
#     print("You cannot vote")

if age >=18 or Voter_id:
    print("You can vote")
else:
    print("You cannot vote")

