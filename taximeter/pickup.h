

#ifndef pickup_h
#define pickup_h

@interface Pickup : NSObject {
    float shour;
    float smin;
    float ehour;
    float emin;
    float inispeed;
}

-(id)Menu;
-(void)Calculate;

@end

#endif /* pickup_h */
