#import <Foundation/Foundation.h>
#import "Pickup.h"
#import "Information.h"
#import "Gastank.h"
#import "Test.m"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        float fuellevel = 0;
    
        printf("Welcome to Taximeter application! Please enter your initial fuel level:\n");
        fpurge(stdin);
        int check_scan = scanf("%f",&fuellevel);
        while(fuellevel <= 0 || check_scan==0)
        {
            printf("Your fuel level must be larger than 0 in order to start the first trip! Please try again:\n");
           fpurge(stdin);
           check_scan = scanf("%f",&fuellevel);
            
        }
        
        
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
            fpurge(stdin);
            int userInput;
            check_scan = scanf("%d",&userInput);
            while(check_scan==0 || (userInput != 1 && userInput != 2))
            {
                printf("Please input invalid value (1 or 2): \n");
                fpurge(stdin);
                check_scan = scanf("%d",&userInput);
                
            }


            if (userInput == 1)
            {
                
                Pickup* pickup = [[Pickup alloc] init];
                
                fpurge(stdin);
                [pickup Menu];
                [pickup Calculate:&netincome :&fuellevel :&mileage :&totaltrip];
                [info  Menu:netincome :fuellevel :mileage :totaltrip];
            }
            
            if (userInput == 2)
            {
                if(netincome >=0 && fuellevel >0){
                    Gastank* gastank = [[Gastank alloc] init];
                    [gastank Fillup:&fuellevel :&netincome];
                    [info  Menu:netincome :fuellevel :mileage :totaltrip];
                }
                else
                {
                    printf("YOU DO NOT HAVE ENOUGH MONEY AND FUEL! PLEASE RESTART THE APPLICATION!");
                }
//                Test* test = [[Test alloc] init];
//                [test Calculate:&netincome :&fuellevel :&mileage :&totaltrip];
            }
        }
        while(quit !=0);
    }
    return 0;
}


