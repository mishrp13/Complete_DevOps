# f=open("demo.txt","r")
# data=f.read()
# print(data)
# print(type(data))
# f.close()

#----------------------------

# f= open("demo.txt","w")
# f.write("I love you, Pooja")
# f.close()

#--------------------

# f= open("demo.txt","a")
# f.write("\nThen i will move to react")
# f.close()

#---------------------------------
# with open("demo.txt",'r') as f:
#     data= f.read()
#     print(data)

# with open("demo.txt","w") as f:
#     f.write("new data")

#--------------------------------------

# import os
# os.remove("demo.txt")

#------------------------------

# with open("practise.txt","w") as f:
#     f.write("Hi Everyone \nwe are learning File I/O\n")
#     f.write("Using Java. \nI like programming in Java")

#---------------------------------------

# with open("practise.txt","r") as f:
#     data= f.read()
# new_data=data.replace("Java","python")
# print(new_data)    

# with open("practise.txt","w") as f:
#     f.write(new_data)

#-----------------------------------------

# word="learning"
# with open("practise.txt","r") as f:
#     data=f.read()
#     if(data.find(word) != -1):
#         print("found")
#     else:
#         print("not found")

#---------------------------------------------

# def check_for_word():
#     word="learning"
#     with open("practise.txt","r") as f:
#         data=f.read()
#         if(data.find(word) != -1):
#             print("found")
#         else:
#             print("not found")

# check_for_word()

#--------------------------------

# def check_for_line():
#     word="learning"
#     data= True
#     line_no=1

#     with open("practise.txt","r") as f:
#         while data:
#             data=f.readline()
#             if (word in data):
#                 print(line_no)
#                 return
#             line_no +=1

#     return -1

# check_for_line()

#----------------------------------------

count =0

with open("practise.txt","r") as f:
    data=f.read()

    nums=data.split(",")
    for val in nums:
        if (int(val) %2==0):
            count +=1

print(count)




