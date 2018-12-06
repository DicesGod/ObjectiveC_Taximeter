#import <Foundation/Foundation.h>
#import "Gastank.h"

@implementation Gastank

-(void)Fillup:(float *)fuellevel :(float *)netincome
{
    float refill;
    printf("Please input how much gas you want to litres or press 0 to quit!:\n" );
    scanf("%f",&refill);
    if (refill != 0)
        {
        float randomNum = arc4random_uniform(45-15);
        float price = 1.15+randomNum/100;
        float cost = price * refill;
            
        while(cost > *netincome)
        {
            printf("You do not have enough money, please try again!\n");
            scanf("%f",&refill);
            cost = price * refill;
        }
        
        *netincome = *netincome - cost;
        *fuellevel = *fuellevel +refill;
        }
}

-(void)Onsitegas:(float *)fuellevel :(float *)netincome
{
    float refill;
    printf("Please input how much gas you want to litres or press 0 to quit!:\n" );
    scanf("%f",&refill);
    
        float randomNum = arc4random_uniform(45-15);
        float price = 1.15+randomNum/100;
        float cost = (price * refill)+100;
        
        while(cost > *netincome && refill != 0)
        {
            printf("You do not have enough money, please try again!\n");
            scanf("%f",&refill);
            cost = (price * refill)+100;
        }
        if(refill != 0)
        {
        *netincome = *netincome - cost;
        *fuellevel = *fuellevel +refill;
        }
        else
        {
        *netincome = *netincome;
        *fuellevel = *fuellevel;
        }
    
    
}
@end
