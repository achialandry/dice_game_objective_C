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
        //instance for dice one
        Dice *diceOne = [[Dice alloc]init];
        [diceOne randomizeValue:5];
        NSLog(@"Output Dice One: %lu", (unsigned long)diceOne.currentValue);
        
        //instance for dice two
        Dice *diceTwo = [[Dice alloc]init];
        [diceTwo randomizeValue:3];
        NSLog(@"Outpute Dice Two: %lu", (unsigned long)diceTwo.currentValue);
        
        //instance for dice three
        Dice *diceThree = [[Dice alloc] init];
        [diceThree randomizeValue:4];
        NSLog(@"Output Dice Three: %lu", (unsigned long)diceThree.currentValue);
        
        //instance for dice four
        Dice *diceFour = [[Dice alloc] init];
        [diceFour randomizeValue:1];
        NSLog(@"Output Dice Four: %lu", (unsigned long)diceFour.currentValue);
        
        //instance for dice five
        Dice *diceFive = [[Dice alloc] init];
        [diceFive randomizeValue:2];
        NSLog(@"Output Dice Five: %lu", (unsigned long)diceFive.currentValue);
    }
    return 0;
}
