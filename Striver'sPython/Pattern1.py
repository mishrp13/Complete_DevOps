
class Solution:

    def Pattern1(self,n):

        for i in range(n):
            for j in range(n):
                print("*", end="")
            print()


    def main(self):
        N=8
        sol=Solution()
        sol.Pattern1(N)

if __name__=="__main__":
    Solution().main()