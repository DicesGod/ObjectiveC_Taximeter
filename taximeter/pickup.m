#import <Foundation/Foundation.h>
#import "Pickup.h"

@implementation Pickup

-(id)Menu{
    printf("Please input the start time:" );
    fflush(stdin);
    scanf("%fh%f", &shour, &smin);
    
    printf("Please input the end time:" );
    fflush(stdin);
    scanf("%fh%f", &ehour, &emin);
    
    printf("Please input the initial speed:" );
    fflush(stdin);
    scanf("%f",&inispeed);
    
    //time = [NSDateInterval c];
    
    //printf("%dh%d,%dh%d,%dkm/h",shour,smin,ehour,emin,inispeed);
    return self;
}
-(void)Calculate {
    
    float cost=0;
    float s1 = (60-smin+emin)/60;
    float s2 = (60-smin)/60;
    float e = emin/60;
//    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
//    formatter.dateFormat = @"hh ss";
//    starttime = [formatter dateFromString:@"%d %d",shour,smin];
//    NSDate *starttime2 = [NSDate stim]
    
     if(smin > emin){
        if (shour + 12 < ehour)
         {
             printf("A single trip cannot take more than 12 hours!");
         }
         else if ((shour>ehour) && (24 - shour - 1 +s2 + ehour+s2 > 12) )
         {
             printf("A single trip cannot take more than 12 hours!");
         }
    ///////////////Case1
        else if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour < ehour)
        {
            cost = (ehour-shour-1+s1)*30;
            printf("Cost: $%f",cost);
        }
        else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
        {
            cost = (8 - shour-1+s2)*30 +(ehour-8+e)*20;
            printf("Cost: $%f",cost);
        }
        else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
        {
            cost = (8 - shour-1+s2)*30 +6*20 + (ehour-14+e)*25;
            printf("Cost: $%f",cost);
        }
        
        //////////////Case2
        else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
        {
            cost = (ehour-shour-1+s1)*20;
            printf("Cost: $%f",cost);
        }
        else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
        {
            cost = (14 - shour-1+s2)*20 +(ehour-14+e)*25;
            printf("Cost: $%f",cost);
        }
        else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
        {
            cost = (14 - shour-1+s2)*20 +10*25 + (ehour-0+e)*30;
            printf("Cost: $%f",cost);
        }
        
        //////////////Case3
        else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
        {
            cost = (ehour-shour-1+s1)*25;
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
        {
            cost = (24 - shour-1+s2)*25 +(ehour-0+e)*30;
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
        {
            cost = (24 - shour-1+s2)*25 +8*30 + (ehour-8+e)*25;
            printf("Cost: $%f",cost);
        }
       
        
    }
    else if(smin < emin)
    {
        if (shour + 12 <= ehour)
        {
            printf("A single trip cannot take more than 12 hours!");
        }
        else if ((shour>ehour) && (24 - shour - 1 +s2 + ehour+s2 > 12) )
        {
            printf("A single trip cannot take more than 12 hours!");
        }
        ///////////////Case1
        else if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour <= ehour)
        {
            cost = (ehour-shour+(emin-smin)/60)*30;
            printf("Cost: $%f",cost);
        }
        else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
        {
            cost = (8 - shour-1+s2)*30 +(ehour-8+e)*20;
            printf("Cost: $%f",cost);
        }
        else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
        {
            cost = (8 - shour-1+s2)*30 +6*20 + (ehour-14+e)*25;
            printf("Cost: $%f",cost);
        }
        
        //////////////Case2
        else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
        {
            cost = (ehour-shour+(emin-smin)/60)*20;
            printf("Cost: $%f",cost);
        }
        else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
        {
            cost = (14 - shour-1+s2)*20 +(ehour-14+e)*25;
            printf("Cost: $%f",cost);
        }
        else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
        {
            cost = (14 - shour-1+s2)*20 +10*25 + (ehour-0+e)*30;
            printf("Cost: $%f",cost);
        }
        
        //////////////Case3
        else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
        {
            cost = (ehour-shour+(emin-smin)/60)*25;
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
        {
            cost = (24 - shour-1+s2)*25 +(ehour-0+e)*30;
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
        {
            cost = (24 - shour-1+s2)*25 +8*30 + (ehour-8+e)*25;
            printf("Cost: $%f",cost);
        }
      
    }
   
    
    else
    {
        if (shour + 12 < ehour)
        {
            printf("A single trip cannot take more than 12 hours!");
        }
        else if ((24 - shour + ehour > 12) && (shour>ehour))
        {
            printf("A single trip cannot take more than 12 hours!");
        }
        ///////////////Case1
        else if((0 <= shour) && (shour < 8) && (0 <= ehour) && (ehour < 8) && shour < ehour)
        {
            cost = (ehour-shour)*30;
            printf("Cost: $%f",cost);
        }
        else if ((0 <= shour) && (shour < 8) && (ehour>=8) && (ehour<14))
        {
            cost = (8 - shour)*30 +(ehour-8)*20;
            printf("Cost: $%f",cost);
        }
        else if((0 < shour) && (shour < 8) && (ehour>=14) && (ehour<24))
        {
            cost = (8 - shour)*30 +6*20 + (ehour-14)*25;
            printf("Cost: $%f",cost);
        }
        
        //////////////Case2
        else if((8 <= shour) && (shour < 14) && (8 <= ehour) && (ehour < 14) && shour < ehour)
        {
            cost = (ehour-shour)*20;
            printf("Cost: $%f",cost);
        }
        else if ((8 <= shour) && (shour < 14) && (14 <= ehour) && (ehour < 24))
        {
            cost = (14 - shour)*20 +(ehour-14)*25;
            printf("Cost: $%f",cost);
        }
        else if((8 <= shour) && (shour < 14) && (0 <= ehour) && (ehour < 8))
        {
            cost = (14 - shour)*20 +10*25 + (ehour-0)*30;
            printf("Cost: $%f",cost);
        }
        
        //////////////Case3
        else if((14 <= shour) && (shour < 24) && (14 <= ehour) && (ehour < 24) && shour < ehour)
        {
            cost = (ehour-shour)*25;
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (0 <= ehour) && (ehour < 8))
        {
            cost = (24 - shour)*25 +(ehour-0)*30;
            printf("Cost: $%f",cost);
        }
        else if((14 <= shour) && (shour < 24) && (8 <= ehour) && (ehour < 14))
        {
            cost = (24 - shour)*25 +8*30 + (ehour-8)*25;
            printf("Cost: $%f",cost);
        }
        
    
    }
}


@end
