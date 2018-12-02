#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Welcome to Taximeter application! Please choose 1 of the following options:");
        printf("\n1.Pick up passengers");
        printf("\n2.Fill up the gas tank\n");
        printf("\n");
        
        char userInput;
        scanf("%s",&userInput);
        //check inputed value
        while (userInput != '1' && userInput !='2')
            {
                printf("Please input invalid value (1 or 2): ");
                scanf("%s",&userInput);
            }
        
        if (userInput == 1)
        {
            
        }
        
        if (userInput == 2)
        {
            
        }
    }
    return 0;
}
