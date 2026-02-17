import smtplib

hostname = 'smtp.gmail.com'
email = 'prabalsonu1997@gmail.com'
password = 'uydniukypevyrluj'

with smtplib.SMTP(host=hostname, port=587) as connection:
    connection.starttls()
    connection.login(user=email,password=password)
    connection.sendmail(
        from_addr=email,
        to_addrs=email,
        msg=f'subject: Test Python Email\n\n Hi Paul, This is test mail'
    )