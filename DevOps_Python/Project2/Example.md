with LockedFile("data.txt", "w") as f:
    f.write("Production-safe file write\n")
