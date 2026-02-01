calculation_to_unit=24
name_of_unit="hours"


def days_to_unit(number_of_days):
    if number_of_days>0:
        return f"{number_of_days} days are {number_of_days*calculation_to_unit} {name_of_unit}"
    elif number_of_days==0:
        return f"You entered wrong value should be greater than 0"
    
def validate_and_execute():
    if user_input.isdigit():
        user_input_number=int(user_input)
        calculate_value=days_to_unit(user_input_number)
        print(calculate_value)
    else:
        print("Invalid number")




user_input=input("Enter the number of days so that i can convert")
validate_and_execute()




