user_list= ["raju","shyam","baburao","Kachra","Narendra","kamlesh"]
print(user_list[0])
print(user_list[1])

user_list.append('Paul')
print(user_list)

user_list.remove('raju')
print(user_list)

user_list[2]= "BabuRao"
print(user_list)

user_list.insert(1, "shanu")
print(user_list)

del user_list[3]
print(user_list)

print(len(user_list))

# sorting of List Items

#user_list.sort(reverse=True)
user_list.reverse()
print(user_list)

removed=user_list.pop()
print(removed)

print(user_list[0:6])
print(user_list[1:4])
print(user_list[-2:])

marks= [23,44,33,77,81]
print(min(marks))
print(max(marks))
print(sum(marks))

mix_list=['Paul',33,19,89.9, True]