#import <Foundation/Foundation.h>
#import "Pickup.h"
#import "Gastank.h"

@implementation Pickup

-(id)Menu{
    
    printf("Please input the start time(hh:mm) - 24h must be write as 0:" );
    fpurge(stdin);
    int checkscan = scanf("%f:%f", &shour, &smin);
    while (checkscan != 2 || (shour < 0 || shour > 23) || (smin < 0 || smin>59))
    {
        printf("Please input the correct format for start time(hh:mm) - 24h must be write as 0:");
        fpurge(stdin);
        checkscan = scanf("%f:%f", &shour, &smin);
    }
    // For learning purpose only,for using NSTimeInterval user must input date values so I decided to use another algorithm (long but more convience for users.
    NSString *starhour = [NSString stringWithFormat:@"%.0f:%.0f",shour,smin];
    //printf("%s", [starhour UTF8String]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *startDate = [[NSDate alloc] init];
    startDate = [dateFormatter dateFromString:starhour];
   // NSLog(@"Start date is %@",[dateFormatter stringFromDate:startDate]);
    
    printf("Please input the end time(hh:mm) - 24h must be write as 0:" );
    fpurge(stdin);
    checkscan = scanf("%f:%f", &ehour, &emin);
    while (checkscan != 2 || (ehour < 0 || ehour > 23) || (emin < 0 || emin>59))
    {
        printf("Please input the correct format for start time(hh:mm) - 24h must be write as 0:");
        fpurge(stdin);
        checkscan = scanf("%f:%f", &ehour, &emin);
    }
    
    NSString *endhour = [NSString stringWithFormat:@"%.0f:%.0f",ehour,emin];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *endDate = [dateFormatter dateFromString:endhour];
    //endDate = [dateFormatter dateFromString:endhour];
    
    NSTimeInterval timeDifference = [endDate timeIntervalSinceDate:startDate];
  //  NSLog(@"End date is %@",[dateFormatter stringFromDate:endDate]);
    NSLog(@"Time defferences: %.2fh",timeDifference/60-15);
   // NSLog(@"Time defferences2: %.2fh",timeDifference/36);
    printf("Please input the initial speed:" );
    fpurge(stdin);
    checkscan = scanf("%f",&inispeed);
    while (checkscan == 0)
    {
        printf("Please input the valid intial speed:");
        fpurge(stdin);
        checkscan = scanf("%f",&emin);
    }
    return self;
}

-(void)Calculate:(float *)netincome :(float *)fuellevel :(float *)mileage :(int *)totaltrip 
{
    float time=0;
    float cost=0;
    float s1 = (60-smin+emin)/60;
    float s2 = (60-smin)/60;
    float e = emin/60;

   // printf("This is startDate: %s\n",&startDate);
   // printf("This is endDate: %s\n",&endDate);
    
     if(smin > emin){
         while (shour + 12 < ehour)
         {
             printf("A single trip cannot take more than 12 hours!\n");
             [self Menu];
         }
         while ((shour>ehour) && (24 - shour - 1 +s2 + ehour+s2 > 12))
         {
             printf("A single trip cannot take more than 12 hours!\n");
             [self Menu];
         }
    ///////////////Case1
        if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour < ehour)
        {
            cost = (ehour-shour-1+s1)*30;
            time = ehour-shour-1+s1;
            printf("Cost: $%f",cost);
        }
        else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
        {
            cost = (8 - shour-1+s2)*30 +(ehour-8+e)*20;
            time = (8 - shour-1+s2)+(ehour-8+e);
            printf("Cost: $%f",cost);
        }
        else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
        {
            cost = (8 - shour-1+s2)*30 +6*20 + (ehour-14+e)*25;
            time = (8 - shour-1+s2) +6 + (ehour-14+e);
            printf("Cost: $%f",cost);
        }
        
        //////////////Case2
        else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
        {
            cost = (ehour-shour-1+s1)*20;
            time = ehour-shour-1+s1;
            printf("Cost: $%f",cost);
        }
        else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
        {
            cost = (14 - shour-1+s2)*20 +(ehour-14+e)*25;
            time = (14 - shour-1+s2) +(ehour-14+e);
            printf("Cost: $%f",cost);
        }
        else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
        {
            cost = (14 - shour-1+s2)*20 +10*25 + (ehour-0+e)*30;
            time = (14 - shour-1+s2) +10 + (ehour-0+e);
            printf("Cost: $%f",cost);
        }
        
        //////////////Case3
        else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
        {
            cost = (ehour-shour-1+s1)*25;
            time = (ehour-shour-1+s1);
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
        {
            cost = (24 - shour-1+s2)*25 +(ehour-0+e)*30;
            time = (24 - shour-1+s2) +(ehour-0+e);
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
        {
            cost = (24 - shour-1+s2)*25 +8*30 + (ehour-8+e)*25;
            time = (24 - shour-1+s2) +8 + (ehour-8+e);
            printf("Cost: $%f",cost);
        }
         
        
    }
    else if(smin < emin)
    {
        while (shour + 12 <= ehour)
        {
            printf("A single trip cannot take more than 12 hours!\n");
            [self Menu];
        }
        while ((shour>ehour) && (24 - shour - 1 +s2 + ehour+s2 > 12) )
        {
            printf("A single trip cannot take more than 12 hours!\n");
            [self Menu];
        }
        ///////////////Case1
        if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour <= ehour)
        {
            cost = (ehour-shour+(emin-smin)/60)*30;
            time = (ehour-shour+(emin-smin)/60);
            printf("Cost: $%f",cost);
        }
        else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
        {
            cost = (8 - shour-1+s2)*30 +(ehour-8+e)*20;
            time = (8 - shour-1+s2) +(ehour-8+e);
            printf("Cost: $%f",cost);
        }
        else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
        {
            cost = (8 - shour-1+s2)*30 +6*20 + (ehour-14+e)*25;
            time = (8 - shour-1+s2) +6 + (ehour-14+e);
            printf("Cost: $%f",cost);
        }
        
        //////////////Case2
        else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
        {
            cost = (ehour-shour+(emin-smin)/60)*20;
            time = (ehour-shour+(emin-smin)/60);
            printf("Cost: $%f",cost);
        }
        else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
        {
            cost = (14 - shour-1+s2)*20 +(ehour-14+e)*25;
            time = (14 - shour-1+s2) +(ehour-14+e);
            printf("Cost: $%f",cost);
        }
        else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
        {
            cost = (14 - shour-1+s2)*20 +10*25 + (ehour-0+e)*30;
            time = (14 - shour-1+s2) +10 + (ehour-0+e);
            printf("Cost: $%f",cost);
        }
        
        //////////////Case3
        else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
        {
            cost = (ehour-shour+(emin-smin)/60)*25;
            time = (ehour-shour+(emin-smin)/60);
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
        {
            cost = (24 - shour-1+s2)*25 +(ehour-0+e)*30;
            time = (24 - shour-1+s2) +(ehour-0+e);
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
        {
            cost = (24 - shour-1+s2)*25 +8*30 + (ehour-8+e)*25;
            time = (24 - shour-1+s2) +8 + (ehour-8+e);
            printf("Cost: $%f",cost);
        }
      
    }
   
    
    else
    {
        while (shour + 12 < ehour)
        {
            printf("A single trip cannot take more than 12 hours!\n");
            [self Menu];
        }
        while ((24 - shour + ehour > 12) && (shour>ehour))
        {
            printf("A single trip cannot take more than 12 hours!\n");
            [self Menu];
        }
        while (shour == ehour)
        {
            printf("End time should be larger than start time! Please try again!\n");
            [self Menu];
        }
        ///////////////Case1
         if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour < ehour)
        {
            cost = (ehour-shour)*30;
            time = (ehour-shour);
            printf("Cost: $%f",cost);
        }
        else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
        {
            cost = (8 - shour)*30 +(ehour-8)*20;
            time = (8 - shour) +(ehour-8);
            printf("Cost: $%f",cost);
        }
        else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
        {
            cost = (8 - shour)*30 +6*20 + (ehour-14)*25;
            time = (8 - shour) +6 + (ehour-14);
            printf("Cost: $%f",cost);
        }
        
        //////////////Case2
        else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
        {
            cost = (ehour-shour)*20;
            time = (ehour-shour);
            printf("Cost: $%f",cost);
        }
        else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
        {
            cost = (14 - shour)*20 +(ehour-14)*25;
            time = (14 - shour) +(ehour-14);
            printf("Cost: $%f",cost);
        }
        else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
        {
            cost = (14 - shour)*20 +10*25 + (ehour-0)*30;
            time = (14 - shour) +10 + (ehour-0);
            printf("Cost: $%f",cost);
        }
        
        //////////////Case3
        else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
        {
            cost = (ehour-shour)*25;
            time = (ehour-shour);
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
        {
            cost = (24 - shour)*25 +(ehour-0)*30;
            time = (24 - shour) +(ehour-0);
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
        {
            cost = (24 - shour)*25 +8*30 + (ehour-8)*25;
            time = (24 - shour) +8 + (ehour-8);
            printf("Cost: $%f",cost);
        }
    }
     printf("\n\n");
    *fuellevel = *fuellevel - (time * fabs(tan(inispeed*time))+fabs(cos(inispeed)));
    if (*fuellevel <= 0)
    {
        Gastank* gastank = [[Gastank alloc] init];
        [gastank Onsitegas:&*fuellevel :&*netincome];
        *mileage = *mileage + pow(inispeed,(2 * time)) - ((inispeed) * time);
        *netincome = *netincome+cost;
        //*fuellevel = b;
        *totaltrip = *totaltrip+1;

    }
    else
    {
    *mileage = *mileage + pow(inispeed,(2 * time)) - ((inispeed) * time);
    *netincome = *netincome + cost;
    *totaltrip = *totaltrip+1;
    }
    
}


@end


