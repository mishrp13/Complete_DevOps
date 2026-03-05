user_List=["Raju","Shyam","Karun","Dark"]
print(user_List[0])
print(user_List[1])

user_List.append("Paul")
print(user_List)

user_List.remove("Paul")
print(user_List)

user_List[2]="BabuRao"
print(user_List)

user_List.insert(1,"Shanu")
print(user_List)

removed= user_List.pop()
print(removed)