import pandas

data= pandas.read_csv('emp_data.csv')
print(data)

print(data.salary.min())
print(data.salary.sum())
print(data[data.emp_id==105])
print(data[data.salary == data.salary.max()])

emp_id_103= data[data.emp_id == 103]
print(emp_id_103.f_name.values[0], emp_id_103.l_name.values[0])


# start from 4:10
