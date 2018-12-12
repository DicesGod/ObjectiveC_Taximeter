#ifndef pickup_h
#define pickup_h

@interface Pickup : NSObject {
    float shour;
    float smin;
    float ehour;
    float emin;
    float inispeed;
    NSString *starhour;
    NSString *endhour;
    NSDate *startDate;
    NSDate *endDate;
}

-(id)Menu;
-(void)Calculate:(float *)netincome :(float *)fuellevel :(float *)mileage :(int *)totaltrip;


@end

#endif /* pickup_h */
