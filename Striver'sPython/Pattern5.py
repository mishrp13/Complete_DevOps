class Solution:
    def Pattern5(self,n):
        for i in range(0,n):
            for j in range(0,n-i):
                print("*", end=" ")
            print()

    
    def main(self):
        N=8
        sol=Solution()
        sol.Pattern5(N)


if __name__=="__main__":
    Solution().main()