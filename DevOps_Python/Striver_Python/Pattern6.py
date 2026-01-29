class Solution:
    def Pattern6(self,n):
        for i in range(0,n):
            for j in range(n-i):
                print(j+1, end=" ")
            print()

    
    def main(self):
        N=7
        sol=Solution()
        sol.Pattern6(N)


if __name__=="__main__":
    Solution().main()