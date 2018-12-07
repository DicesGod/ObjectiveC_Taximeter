#import <Foundation/Foundation.h>
#import "Information.h"

@implementation Information

-(id)Menu:(float)netincom :(float)fuellevel :(float)mileage :(int)totaltrip;
    {
    printf("   Net Income  |   Car's fuel level    |   Car's mileage   |   Total number of trips" );
    printf("\n     %.2f               %.2f                  %.2f                     %d",netincom,fuellevel,mileage,totaltrip);
    printf("\n****************************************************************************************");
    printf("\n");
    return self;
}


@end
