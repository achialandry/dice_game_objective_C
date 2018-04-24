//
//  main.m
//  diceGame_threelow
//
//  Created by Landry Achia Ndong on 2018-04-23.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //instance for dice one
        Dice *diceOne = [[Dice alloc]init];
        
        
        //instance for dice two
        Dice *diceTwo = [[Dice alloc]init];
       
        
        //instance for dice three
        Dice *diceThree = [[Dice alloc] init];
        
        
        //instance for dice four
        Dice *diceFour = [[Dice alloc] init];
        
        
        //instance for dice five
        Dice *diceFive = [[Dice alloc] init];
        
        
        
        //getting input from user to perfom the roll
        
        NSString *checkIfInputIsRoll = @"roll";
        NSString *quitMessage =@"quit";
        int proceed = 1;
        while (proceed) {
            NSString *userInput = [InputCollector inputForPrompt:@"Type roll to roll dice or quit to quit app: "];
            if ([userInput isEqualToString:checkIfInputIsRoll]) {
                [diceOne randomizeValue:5];
                NSLog(@"Output Dice One: %lu", (unsigned long)diceOne.currentValue);
                
                [diceTwo randomizeValue:3];
                NSLog(@"Outpute Dice Two: %lu", (unsigned long)diceTwo.currentValue);
                
                [diceThree randomizeValue:4];
                NSLog(@"Output Dice Three: %lu", (unsigned long)diceThree.currentValue);
                
                [diceFour randomizeValue:1];
                NSLog(@"Output Dice Four: %lu", (unsigned long)diceFour.currentValue);
                
                [diceFive randomizeValue:2];
                NSLog(@"Output Dice Five: %lu", (unsigned long)diceFive.currentValue);
                proceed = 1;
            }else if([userInput isEqualToString:quitMessage]){
                proceed = 0;
            }
        }
    }
    return 0;
}
