from datetime import datetime , timedelta

current_date_time=datetime.now()
print(current_date_time.date())

formatted_date= current_date_time.strftime("%Y=%m=%d  %H-%M")
print(formatted_date)

future_date= current_date_time - timedelta(days=10)
print(future_date)

