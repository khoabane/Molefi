#include <stdio.h>
#include <math.h>
#include <stdbool.h>

using namespace std;

bool isprime(int num);
int revsnum(int);

int main()
{
    int count = 0,
        num = 2,
        revnum,
        sqrnum,
        pwnum;
    int  revprime,
	 pwrevprime ;     
    


    while(count < 10)
    {
        if(isprime(num) == true)
        {
            pwnum = pow(num, 2);
            revnum = revsnum(pwnum);
            revprime = revsnum( num);
            pwrevprime = pow(revprime, 2);

            if(pwrevprime == revnum && pwnum != revnum)
            {
                
	                printf("%d \n", pwnum);
    	            count ++; 
    	    
    	        num++;
            	
            }
            else
            	num++;
        }
        else
        	num++;
    }
}

bool isprime(int n)
{
    bool isprime = true;

    for(int i = 2; i <= n/2; i++)
    {
        if(n % i == 0)
        {
            isprime = false;
            //break;
            return false;
        } 
    }
    return isprime;
}


int revsnum(int m)
{
    int rem,
        rev = 0;

    while(m > 0)
    {
        rem = m % 10;
        m = m / 10;
        rev = (rev * 10) + rem;
    }
    return rev;
}
