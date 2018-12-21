#ifndef pickup_h
#define pickup_h

@interface Pickup : NSObject {
    float shour;
    float ehour;
    float inispeed;
    NSTimeInterval timeDifference;
    NSDate *startDate;
    NSDate *endDate;
    NSDate *time8;
    NSDate *time14;
    NSDate *time24;
}

-(id)Menu;
-(void)Calculate:(float *)income :(float *)fuel :(float *)mile :(int *)trip;


@end

#endif /* pickup_h */
