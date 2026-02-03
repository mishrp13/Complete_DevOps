double = lambda x: x*2
add = lambda x,y: x+y
max_value= lambda x,y: x if x>y else y
min_value= lambda x,y: x if x<y else y
full_name= lambda first,last: first + " " + last
is_even= lambda x: x % 2 == 0
age_check= lambda age: True if age>=18 else False

print(age_check(13))