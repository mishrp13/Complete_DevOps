class Solution:
    def Pattern4(self,n):
        for i in range(1,n+1):
            for j in range(1,i+1):
                print(i, end=" ")
            print()

    def main(self):
        N=7
        sol=Solution()
        sol.Pattern4(N)


if __name__=="__main__":
    Solution().main()