def is_prime(n):

    cnt=0

    for i in range(1,n+1):

        if n%i==0:
            cnt=cnt+1

    if cnt==2:
        return True
    
    return False

def isPrimeUpto(n):
    cnt=0

    for i in range(2,n+1):

        if is_prime(i):
            cnt+=1

    return cnt


n=int(input("enter any number: "))
ans=isPrimeUpto(n)

print(f"Prime number upto is : {ans}")


        