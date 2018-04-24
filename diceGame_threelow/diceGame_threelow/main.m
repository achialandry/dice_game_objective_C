//
//  main.m
//  diceGame_threelow
//
//  Created by Landry Achia Ndong on 2018-04-23.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice *diceOne = [[Dice alloc]init];
        [diceOne randomizeValue:5];
        NSLog(@"Output Dice One: %lu", (unsigned long)diceOne.currentValue);
        
        Dice *diceTwo = [[Dice alloc]init];
        [diceTwo randomizeValue:3];
        NSLog(@"Outpute Dice Two: %lu", (unsigned long)diceTwo.currentValue);
        
        Dice *diceThree = [[Dice alloc] init];
        [diceThree randomizeValue:4];
        NSLog(@"Output Dice Three: %lu", (unsigned long)diceThree.currentValue);
        
        Dice *diceFour = [[Dice alloc] init];
        [diceFour randomizeValue:1];
        NSLog(@"Output Dice Four: %lu", (unsigned long)diceFour.currentValue);
        
        Dice *diceFive = [[Dice alloc] init];
        [diceFive randomizeValue:2];
        NSLog(@"Output Dice Five: %lu", (unsigned long)diceFive.currentValue);
    }
    return 0;
}
