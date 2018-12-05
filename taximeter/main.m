#import <Foundation/Foundation.h>
#import "Pickup.h"

int validation(int userInput)
{
    while (userInput != 1 && userInput != 2)
    {
        printf("Please input invalid value (1 or 2): ");
        fflush(stdin);
        scanf("%d",&userInput);
        
        //printf("Day la userinput %s",&userInput);
    }
    return userInput;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Welcome to Taximeter application! Please choose 1 of the following options:");
        printf("\n1.Pick up passengers");
        printf("\n2.Fill up the gas tank\n");
        printf("\n");
        
        int userInput;
        scanf("%d",&userInput);
        
        
      //  fflush(stdin);
        userInput = validation(userInput);
        //printf("Day la userinput %s",&userInput);
        
        if (userInput == 1)
        {
            
            Pickup* pickup = [[Pickup alloc] init];
            
            fflush(stdin);
            [pickup Menu];
            [pickup Calculate];
        }
        
        if (userInput == '2')
        {
            
        }
    }
    return 0;
}


