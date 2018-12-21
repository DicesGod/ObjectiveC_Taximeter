#import <Foundation/Foundation.h>
#import "Pickup.h"
#import "Gastank.h"

@implementation Pickup

-(id)Menu{
    float smin;
    float emin;
    
    printf("Please input the start time(hh:mm) - 24h must be write as 0h:" );
    fpurge(stdin);
    int checkscan = scanf("%f:%f", &shour, &smin);
    while (checkscan != 2 || (shour < 0 || shour > 23) || (smin < 0 || smin>59))
    {
        printf("Please input the correct format for start time(hh:mm) - 24h must be write as 0:");
        fpurge(stdin);
        checkscan = scanf("%f:%f", &shour, &smin);
    }
    
    NSString *starhour = [NSString stringWithFormat:@"%.0f:%.0f",shour,smin];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    startDate = [dateFormatter dateFromString:starhour];
    
    
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
    endDate = [dateFormatter dateFromString:endhour];
    
    time8 = [dateFormatter dateFromString:@"08:00"];
    time14 = [dateFormatter dateFromString:@"14:00"];
    time24 = [dateFormatter dateFromString:@"00:00"];
    
    //timeDifference = [endDate timeIntervalSinceDate:startDate]/3600;
    if (timeDifference < 0)
        timeDifference = (24+timeDifference);
    //NSLog(@"Time defferences: %.2fh",timeDifference);
    while (timeDifference >12) {
        printf("A TRIP MUST NOT LONGER THAN 12 HOURS!\n");
        [self Menu];
    }
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

-(void)Calculate:(float *)income :(float *)fuel :(float *)mile :(int *)trip
{
    float cost=0;
    
    if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8))
    {
        cost = timeDifference*30;
        printf("Cost: $%f",cost);
    }
    else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
    {
        cost = [time8 timeIntervalSinceDate:startDate]/3600*30 + [endDate timeIntervalSinceDate:time8]/3600*20;
        printf("Cost: $%f",cost);
    }
    else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
    {
        cost = [time8 timeIntervalSinceDate:startDate]/3600*30 +6*20+ [endDate timeIntervalSinceDate:time14]/3600*25;
        printf("Cost: $%f",cost);
    }
    
    
    else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14))
    {
        cost = timeDifference*20;
        printf("Cost: $%f",cost);
    }
    else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
    {
        cost = [time14 timeIntervalSinceDate:startDate]/3600*20 + [endDate timeIntervalSinceDate:time14]/3600*25;
        printf("Cost: $%f",cost);
    }
    else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
    {
        cost = [time14 timeIntervalSinceDate:startDate]/3600*30 +10*25+ [endDate timeIntervalSinceDate:time24]/3600*30;
        printf("Cost: $%f",cost);
        
    }
    
    
    else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24))
    {
        cost = timeDifference*25;
        printf("Cost: $%f",cost);
    }
    else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
    {
        cost = [time24 timeIntervalSinceDate:startDate]/3600*25 + [endDate timeIntervalSinceDate:time24]/3600*30;
        printf("Cost: $%f",cost);
    }
    else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
    {
        cost = [time24 timeIntervalSinceDate:startDate]/3600*25 +8*30+ [endDate timeIntervalSinceDate:time8]/3600*20;
        printf("Cost: $%f",cost);
    }
    
    
    
    
    printf("\n\n");
    *fuel = *fuel - (timeDifference * fabs(tan(inispeed*timeDifference))+fabs(cos(inispeed)));
    if (*fuel <= 0)
    {
        Gastank* gastank = [[Gastank alloc] init];
        [gastank Onsitegas:&*fuel :&*income];
        *mile = *mile + pow(inispeed,(2 * timeDifference)) - ((inispeed) * timeDifference);
        *income = *income+cost;
        //*fuel = b;
        *trip = *trip+1;
        
    }
    else
    {
        *mile = *mile + pow(inispeed,(2 * timeDifference)) - ((inispeed) * timeDifference);
        *income = *income + cost;
        *trip = *trip+1;
    }
    
}


@end


