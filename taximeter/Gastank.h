#ifndef Gastank_h
#define Gastank_h

@interface Gastank : NSObject {
    float shour;
    float smin;
    float ehour;
    float emin;
    float inispeed;
}

-(id)Menu;
-(void)Calculate;

@end

#endif /* Gastank_h */
