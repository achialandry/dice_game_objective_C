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

/*method to check type of unicode value*/
void sendOutUnicode(NSUInteger randomizedValue)
{
    switch (randomizedValue) {
        case 1:
            NSLog(@"1️⃣");
            break;
        case 2:
            NSLog(@"2️⃣");
            break;
        case 3:
            NSLog(@"3️⃣");
            break;
        case 4:
            NSLog(@"4️⃣");
            break;
        case 5:
            NSLog(@"5️⃣");
            break;
        case 6:
            NSLog(@"6️⃣");
            break;
        default:
            break;
    }
}

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
                [diceOne randomizeValue];
                sendOutUnicode(diceOne.currentValue);
//                NSLog(@"Output Dice One: %lu", (unsigned long)diceOne.currentValue);
                
                [diceTwo randomizeValue];
                sendOutUnicode(diceTwo.currentValue);
//                NSLog(@"Outpute Dice Two: %lu", (unsigned long)diceTwo.currentValue);
                
                [diceThree randomizeValue];
                sendOutUnicode(diceThree.currentValue);
//                NSLog(@"Output Dice Three: %lu", (unsigned long)diceThree.currentValue);
                
                [diceFour randomizeValue];
                sendOutUnicode(diceFour.currentValue);
//                NSLog(@"Output Dice Four: %lu", (unsigned long)diceFour.currentValue);
                
                [diceFive randomizeValue];
                sendOutUnicode(diceFive.currentValue);
//                NSLog(@"Output Dice Five: %lu", (unsigned long)diceFive.currentValue);
                proceed = 1;
            }else if([userInput isEqualToString:quitMessage]){
                proceed = 0;
            }
        }
    }
    return 0;
}
