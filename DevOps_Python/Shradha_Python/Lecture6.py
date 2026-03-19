# def cal_sum(a,b):
#     sum=a+b
#     print(sum)
#     return sum

# cal_sum(23,34)
# cal_sum(19,20)
# cal_sum(90,21)

#----------------------------------
#function definition 
# def cal_sum(a,b): #parameters
#     return a+b

# sum =cal_sum(23,43) #function call; argument
# print(sum)

# def print_hello():
#     print("hello")
# print_hello()
# print_hello()
# print_hello()

#-------------------------------------------------

# def cal_avg(a,b,c):
#     sum = a+b+c
#     avg = sum/3
#     print(avg)
    
# cal_avg(23,43,54)

# default Parameters

# def cal_sum(a=2,b=6):
#     sum = a+b
#     print(sum)

# cal_sum()

#-------------------------------------------

# cities= ["Bangalore","Pune","chennai","Delhi","noida"]
# heroes= ["Thor","superman","spiderman","Batman"]

# def print_len(list):
#     print(len(list))

# print_len(cities)
# print_len(heroes)


#-------------------------------------------

# heroes= ["thor","spiderman","shaktiman","Ironman"]

# def print_list(list):
#     for item in list:
#         print(item, end= " ")

# print_list(heroes)

#----------------------------------------------------

# def cal_fact(n):
#     fact=1
#     for i in range(1,n+1):
#         fact *= i

#     print(fact)

# cal_fact(5)

#------------------------------------------------------------

# def converter(usd_value):
#     inr_value= usd_value*83
#     print(usd_value, "USD=", inr_value, "INR")

# converter(73)

#------------------------------------------------
#recursive function
# def show(n):
#     if n==0:
#         return
#     print(n)
#     show(n-1)

# show(7)

#-------------

# def fact(n):
#     if (n==1 or n==0):
#         return 1
#     return fact(n-1)*n

# print(fact(16))

#----------------------------

# def cal_sum(n):
#     if (n==0):
#         return 0
#     return cal_sum(n-1) + n

# sum=cal_sum(6)
# print(sum)   

#---------------------------

def print_list(list,idx=0):
    if (idx == len(list)):
        return 
    print(list[idx])
    print_list(list,idx+1)

fruits = ["mango","guava","coconut","orange"]
print_list(fruits)

