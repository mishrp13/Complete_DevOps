

# def length_of_string(raj):
#     cnt=0
#     for ele in raj:
#         cnt=cnt+1
#     return cnt

# name="raj"

# print(length_of_string(name))
#print(len(name))


# Built in function

# arr = [1,5,6,7,4]
# print(sorted(arr, reverse=True))
# print(arr)

# arr=[-1,2,5,-6,7,4]
# print(sorted(arr, key=lambda x: abs(x)))
# print(arr)


# fruit_list=["apple","banana","kiwi"]
# print(sorted(fruit_list,reverse=True, key=len))

#arr=[5,6,7,8,-15]
# print(max(arr, key=lambda x : abs(x)))

# fruit_list= ["orange", "kiwi", "pineapple"]
# print(max(fruit_list, key=len))

#print(sum(arr))

# arr = [10,20,30]
# print(sum(arr,start=10))

# import math
# arr= [10,20,30]
# print(math.prod(arr))

# arr = [True, False, True]
# print(any(arr))
# print(all(arr))

# arr = [1,2,3,4,4,5]
# print(arr.count(4))

def count_element_in_list(arr,number):
    cnt=0
    for el in arr:
        if el==number:
            cnt=cnt+1
    return cnt


arr=[1,2,2,3,4]
print(count_element_in_list(arr,3))

#start from 18th minute














