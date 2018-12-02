#import <Foundation/Foundation.h>

@interface pickup : NSObject {
    int number1; // default access modifier for field variables is private
    int number2;
}

@property int everyOneCanAccessMe; // public int in Java

-(void)setNumber1:(int) num; // void setNumber1(int num);
-(void)setNumber2:(int) num;
-(int)addNumbers;

@end

@implementation pickup

@synthesize everyOneCanAccessMe;

-(id)init {
    self = [super init];
    number1 = 10;
    number2 = 20;
    return self;
}

-(void)setNumber1:(int)num {
    number1 = num;
}
-(void)setNumber2:(int)num {
    number2 = num;
}
-(int)addNumbers {
    return number1 + number2;
}

@end
