//#import <Foundation/Foundation.h>
//
//@interface Test : NSObject
//{
//
//}
//-(void)Calculate:(float *)netincome :(float *)fuellevel :(float *)mileage :(int *)totaltrip;
//
//
//@end
//@implementation Test
//-(void)Calculate:(float *)netincome :(float *)fuellevel :(float *)mileage :(int *)totaltrip
//{
//    [df setDateFormat:@"HH:mm "];
//    NSString *newStart = [df stringFromDate:start];
//    NSString *newEnd = [df stringFromDate:end];
//    NSLog(@"Time : %@  %@",newStart,newEnd);
//    ///////////////////////////////////////////////////////
//
//    NSDate *startDate = [df dateFromString:newStart];
//    NSDate *endDate = [df dateFromString:newEnd];
//
//    NSTimeInterval timeDifference = [endDate timeIntervalSinceDate:startDate];
//
//    printf("\n\t\t\t* Start time trip (hh:mm)  => ");
//    scanf("%s",startTime);
//    NSString *startTimeString = [NSString stringWithUTF8String:startTime];
//}
//
//@end

//    #import <Foundation/Foundation.h>
//    #import "Pickup.h"
//    #import "Gastank.h"
//
//    @implementation Pickup
//
//    -(id)Menu{
//        
//        printf("Please input the start time:" );
//        fpurge(stdin);
//        int checkscan = scanf("%f:%f", &shour, &smin);
//        while (checkscan == 0)
//        {
//            printf("Please input the correct format(HH:MM):");
//            fpurge(stdin);
//            checkscan = scanf("%f:%f", &shour, &smin);
//        }
//        
//        
//        printf("Please input the end time:" );
//        fpurge(stdin);
//        checkscan = scanf("%f:%f", &ehour, &emin);
//        while (checkscan == 0)
//        {
//            printf("Please input the correct format(HH:MM):");
//            fpurge(stdin);
//            checkscan = scanf("%f:%f", &ehour, &emin);
//        }
//        
//        printf("Please input the initial speed:" );
//        fpurge(stdin);
//        checkscan = scanf("%f",&inispeed);
//        while (checkscan == 0)
//        {
//            printf("Please input the valid intial speed:");
//            fpurge(stdin);
//            checkscan = scanf("%f",&emin);
//        }
//        
//        
//        //printf("%dh%d,%dh%d,%dkm/h",shour,smin,ehour,emin,inispeed);
//        return self;
//    }
//
//    -(void)Calculate:(float *)netincome :(float *)fuellevel :(float *)mileage :(int *)totaltrip
//    {
//        float time=0;
//        float cost=0;
//        float s1 = (60-smin+emin)/60;
//        float s2 = (60-smin)/60;
//        float e = emin/60;
//        
//        printf("%f",shour);
//        printf("%f",ehour);
//        printf("%f",smin);
//        printf("%f",emin);
//        
//        
//        if(smin > emin){
//            while (shour + 12 < ehour)
//            {
//                printf("A single trip cannot take more than 12 hours!\n");
//                [self Menu];
//            }
//            while ((shour>ehour) && (24 - shour - 1 +s2 + ehour+s2 > 12))
//            {
//                printf("A single trip cannot take more than 12 hours!\n");
//                [self Menu];
//            }
//            ///////////////Case1
//            if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour < ehour)
//            {
//                cost = (ehour-shour-1+s1)*30;
//                time = ehour-shour-1+s1;
//                printf("Cost: $%f",cost);
//            }
//            else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
//            {
//                cost = (8 - shour-1+s2)*30 +(ehour-8+e)*20;
//                time = (8 - shour-1+s2)+(ehour-8+e);
//                printf("Cost: $%f",cost);
//            }
//            else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
//            {
//                cost = (8 - shour-1+s2)*30 +6*20 + (ehour-14+e)*25;
//                time = (8 - shour-1+s2) +6 + (ehour-14+e);
//                printf("Cost: $%f",cost);
//            }
//            
//            //////////////Case2
//            else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
//            {
//                cost = (ehour-shour-1+s1)*20;
//                time = ehour-shour-1+s1;
//                printf("Cost: $%f",cost);
//            }
//            else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
//            {
//                cost = (14 - shour-1+s2)*20 +(ehour-14+e)*25;
//                time = (14 - shour-1+s2) +(ehour-14+e);
//                printf("Cost: $%f",cost);
//            }
//            else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
//            {
//                cost = (14 - shour-1+s2)*20 +10*25 + (ehour-0+e)*30;
//                time = (14 - shour-1+s2) +10 + (ehour-0+e);
//                printf("Cost: $%f",cost);
//            }
//            
//            //////////////Case3
//            else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
//            {
//                cost = (ehour-shour-1+s1)*25;
//                time = (ehour-shour-1+s1);
//                printf("Cost: $%f",cost);
//            }
//            else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
//            {
//                cost = (24 - shour-1+s2)*25 +(ehour-0+e)*30;
//                time = (24 - shour-1+s2) +(ehour-0+e);
//                printf("Cost: $%f",cost);
//            }
//            else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
//            {
//                cost = (24 - shour-1+s2)*25 +8*30 + (ehour-8+e)*25;
//                time = (24 - shour-1+s2) +8 + (ehour-8+e);
//                printf("Cost: $%f",cost);
//            }
//            
//            
//        }
//        else if(smin < emin)
//        {
//            while (shour + 12 <= ehour)
//            {
//                printf("A single trip cannot take more than 12 hours!\n");
//                [self Menu];
//            }
//            while ((shour>ehour) && (24 - shour - 1 +s2 + ehour+s2 > 12) )
//            {
//                printf("A single trip cannot take more than 12 hours!\n");
//                [self Menu];
//            }
//            ///////////////Case1
//            if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour <= ehour)
//            {
//                cost = (ehour-shour+(emin-smin)/60)*30;
//                time = (ehour-shour+(emin-smin)/60);
//                printf("Cost: $%f",cost);
//            }
//            else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
//            {
//                cost = (8 - shour-1+s2)*30 +(ehour-8+e)*20;
//                time = (8 - shour-1+s2) +(ehour-8+e);
//                printf("Cost: $%f",cost);
//            }
//            else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
//            {
//                cost = (8 - shour-1+s2)*30 +6*20 + (ehour-14+e)*25;
//                time = (8 - shour-1+s2) +6 + (ehour-14+e);
//                printf("Cost: $%f",cost);
//            }
//            
//            //////////////Case2
//            else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
//            {
//                cost = (ehour-shour+(emin-smin)/60)*20;
//                time = (ehour-shour+(emin-smin)/60);
//                printf("Cost: $%f",cost);
//            }
//            else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
//            {
//                cost = (14 - shour-1+s2)*20 +(ehour-14+e)*25;
//                time = (14 - shour-1+s2) +(ehour-14+e);
//                printf("Cost: $%f",cost);
//            }
//            else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
//            {
//                cost = (14 - shour-1+s2)*20 +10*25 + (ehour-0+e)*30;
//                time = (14 - shour-1+s2) +10 + (ehour-0+e);
//                printf("Cost: $%f",cost);
//            }
//            
//            //////////////Case3
//            else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
//            {
//                cost = (ehour-shour+(emin-smin)/60)*25;
//                time = (ehour-shour+(emin-smin)/60);
//                printf("Cost: $%f",cost);
//            }
//            else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
//            {
//                cost = (24 - shour-1+s2)*25 +(ehour-0+e)*30;
//                time = (24 - shour-1+s2) +(ehour-0+e);
//                printf("Cost: $%f",cost);
//            }
//            else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
//            {
//                cost = (24 - shour-1+s2)*25 +8*30 + (ehour-8+e)*25;
//                time = (24 - shour-1+s2) +8 + (ehour-8+e);
//                printf("Cost: $%f",cost);
//            }
//            
//        }
//        
//        
//        else
//        {
//            while (shour + 12 < ehour)
//            {
//                printf("A single trip cannot take more than 12 hours!\n");
//                [self Menu];
//            }
//            while ((24 - shour + ehour > 12) && (shour>ehour))
//            {
//                printf("A single trip cannot take more than 12 hours!\n");
//                [self Menu];
//            }
//            while (shour == ehour)
//            {
//                printf("End time should be larger than start time! Please try again!\n");
//                [self Menu];
//            }
//            ///////////////Case1
//            if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour < ehour)
//            {
//                cost = (ehour-shour)*30;
//                time = (ehour-shour);
//                printf("Cost: $%f",cost);
//            }
//            else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
//            {
//                cost = (8 - shour)*30 +(ehour-8)*20;
//                time = (8 - shour) +(ehour-8);
//                printf("Cost: $%f",cost);
//            }
//            else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
//            {
//                cost = (8 - shour)*30 +6*20 + (ehour-14)*25;
//                time = (8 - shour) +6 + (ehour-14);
//                printf("Cost: $%f",cost);
//            }
//            
//            //////////////Case2
//            else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
//            {
//                cost = (ehour-shour)*20;
//                time = (ehour-shour);
//                printf("Cost: $%f",cost);
//            }
//            else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
//            {
//                cost = (14 - shour)*20 +(ehour-14)*25;
//                time = (14 - shour) +(ehour-14);
//                printf("Cost: $%f",cost);
//            }
//            else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
//            {
//                cost = (14 - shour)*20 +10*25 + (ehour-0)*30;
//                time = (14 - shour) +10 + (ehour-0);
//                printf("Cost: $%f",cost);
//            }
//            
//            //////////////Case3
//            else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
//            {
//                cost = (ehour-shour)*25;
//                time = (ehour-shour);
//                printf("Cost: $%f",cost);
//            }
//            else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
//            {
//                cost = (24 - shour)*25 +(ehour-0)*30;
//                time = (24 - shour) +(ehour-0);
//                printf("Cost: $%f",cost);
//            }
//            else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
//            {
//                cost = (24 - shour)*25 +8*30 + (ehour-8)*25;
//                time = (24 - shour) +8 + (ehour-8);
//                printf("Cost: $%f",cost);
//            }
//        }
//        printf("\n\n");
//        *fuellevel = *fuellevel - (time * fabs(tan(inispeed*time))+fabs(cos(inispeed)));
//        if (*fuellevel <= 0)
//        {
//            Gastank* gastank = [[Gastank alloc] init];
//            [gastank Onsitegas:&*fuellevel :&*netincome];
//            *mileage = *mileage + pow(inispeed,(2 * time)) - ((inispeed) * time);
//            *netincome = *netincome+cost;
//            //*fuellevel = b;
//            *totaltrip = *totaltrip+1;
//            
//        }
//        else
//        {
//            *mileage = *mileage + pow(inispeed,(2 * time)) - ((inispeed) * time);
//            *netincome = *netincome + cost;
//            *totaltrip = *totaltrip+1;
//        }
//        
//    }
//
//
//    @end


