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
-(void)Calculate:(float *)netincome :(float *)fuellevel :(float *)mileage :(int *)totaltrip;
//-(float)getNetincome:(float) netincome;
//-(float)getFuellevel:(float) fuellevel;
//-(float)getMileage:(float) mileage;
//-(float)getTotaltrip:(int) totaltrip;

@end

#endif /* pickup_h */
