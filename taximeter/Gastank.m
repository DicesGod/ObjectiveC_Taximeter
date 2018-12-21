#import <Foundation/Foundation.h>
#import "Gastank.h"

@implementation Gastank : NSObject 

-(void)Fillup:(float *)fuellevel :(float *)netincome
{
    float refill;
    printf("Please input how much gas you want to litres or press 0 to quit!:\n" );
    
    fpurge(stdin);
    int checkscan = scanf("%f",&refill);
    while (checkscan == 0)
    {
        printf("Please input a valid float number:");
        fpurge(stdin);
        checkscan = scanf("%f",&refill);
    }
    
    if (refill != 0)
        {
        float randomNum = arc4random_uniform(45-15);
        float price = 1.15+randomNum/100;
        float cost = price * refill;
            
            
        while(cost > *netincome)
        {
            printf("You do not have enough money, please try again or press 0 to quit!\n");
            scanf("%f",&refill);
            cost = price * refill;
            
//            printf("%f\n",cost);
//            printf("%f\n",*netincome);
//            printf("%f\n",refill);
        }
        
        *netincome = *netincome - cost;
        *fuellevel = *fuellevel +refill;
        }
}

-(void)Onsitegas:(float *)fuellevel :(float *)netincome
{
    //printf("\nFuel level %f   ----   net income %f\n",*fuellevel,*netincome);
    float refill;
    printf("Please input how much gas you want to litres(service charge is $100):\n" );
    fpurge(stdin);
    int checkscan = scanf("%f",&refill);
    while (checkscan == 0)
    {
        printf("Please input a valid float number:");
        fpurge(stdin);
        checkscan = scanf("%f",&refill);
    }
    
        float randomNum = arc4random_uniform(45-15);
        float price = 1.15+randomNum/100;
        float cost = (price * refill)+100;
    
        *netincome = *netincome - cost;
        *fuellevel = *fuellevel +refill;
   //printf("\nFuel level2 %f   ----   net income2 %f\n",*fuellevel,*netincome);
}
@end
