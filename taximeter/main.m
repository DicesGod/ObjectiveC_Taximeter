#import <Foundation/Foundation.h>
#import "Pickup.h"
#import "Information.h"
#import "Gastank.h"

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
        float fuellevel = 0;
    
        printf("Welcome to Taximeter application! Please enter your initial fuel level:\n");
        fflush(stdin);
        scanf("%f",&fuellevel);
        
        float netincome = 0;
        float mileage = 0;
        int totaltrip = 0;
        int quit = 1;
        
        Information* info = [[Information alloc] init];
        [info  Menu:netincome :fuellevel :mileage :totaltrip];
        do{
            printf("\nWelcome to Taximeter application! Please choose 1 of the following options:");
            printf("\n1.Pick up passengers");
            printf("\n2.Fill up the gas tank\n");
            printf("\n");
            
            int userInput;
            scanf("%d",&userInput);
            
            
          //  fflush(stdin);
            userInput = validation(userInput);
            
            
            if (userInput == 1)
            {
                
                Pickup* pickup = [[Pickup alloc] init];
                
                fflush(stdin);
                [pickup Menu];
                [pickup Calculate:&netincome :&fuellevel :&mileage :&totaltrip];
                [info  Menu:netincome :fuellevel :mileage :totaltrip];
            }
            
            if (userInput == 2)
            {
                Gastank* gastank = [[Gastank alloc] init];
                [gastank Fillup:&fuellevel :&netincome];
                //[gastank Onsitegas:&fuellevel :&netincome];
                [info  Menu:netincome :fuellevel :mileage :totaltrip];
            }
        }
        while(quit !=0);
    }
    return 0;
}


