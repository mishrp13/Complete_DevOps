import subprocess

subprocess.run('ls -ltr', shell=True)
subprocess.run('touch myfile', shell=True)
subprocess.run('echo "hello world">myfile', shell=True)
result= subprocess.run('hostname',shell=True,stdout=subprocess.PIPE)
print(result.stdout)

