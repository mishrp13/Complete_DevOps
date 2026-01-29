class Solution:

    def Pattern3(self,n):
        for i in range(1,n+1):
            for j in range(1,i+1):
                print(j, end="")
            print()

    def main(self):
        N=5
        sol=Solution()
        sol.Pattern3(N)


if __name__=="__main__":
    Solution().main()