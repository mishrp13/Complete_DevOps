class Employees:

    COMPANY= "ABC.pvt.ltd"
    # contructor
    def __init__(self,name,email, dept, salary):
        self.name=name
        self.email=email
        self.dept=dept
        self.salary=salary

    def emp_info(self):
        print(f"Name is {self.name}")
        print(f"Email is {self.email}")
        print(f"Department is {self.dept}")
        print(f"Salary is {self.salary}")

    def change_department(self,new_department):
        self.dept=new_department
        print(f"Department changed to {new_department}")



# object creation    
emp1= Employees('Raju', 'raju@email.com', 'sales', 50000)
emp2= Employees('sham', 'sham@email.com', "Accounts", 60000)

emp1.emp_info()
emp2.emp_info()
emp1.change_department('DevOps')
emp1.emp_info()

print(emp1.COMPANY)
print(emp2.COMPANY)
