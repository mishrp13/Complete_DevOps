import pandas

data= pandas.read_csv('emp_data.csv')


# print(data.salary.min())
# print(data.salary.sum())
# print(data[data.emp_id==105])
# print(data[data.salary == data.salary.max()])

# emp_id_103= data[data.emp_id == 103]
# print(emp_id_103.f_name.values[0], emp_id_103.l_name.values[0])


# print(data.salary.to_list())
# print(data.to_dict())


# data.loc[data.emp_id == 102 , 'salary']=80000
# print(data)

# data=data.drop(1)
# print(data)

# leena_index= data.index[data.emp_id == 102].to_list()[0]
# data=data.drop(leena_index)
# print(data)

# data = data.sort_values(by='salary', ascending=False)
# print(data)

data['bonus']= data.salary*0.1
print(data)


data.to_csv('emp_data_modified')



