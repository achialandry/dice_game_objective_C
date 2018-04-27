//
//  GameController.m
//  diceGame_threelow
//
//  Created by Landry Achia Ndong on 2018-04-25.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"


@implementation GameController
-(instancetype)init {
    self = [super init];
    if (self) {
        self.holdDices = [NSMutableArray new];
        self.dices = [NSMutableArray new];
        self.tempArrayHeldDices = [NSMutableArray new];
        self.saveUserIndexes = [NSMutableArray new];
        self.printTracking = 0;
        self.rollsTracking = 0;
        self.scoreToBeat = 0;
    }
    return self;
}

- (void) setupGame{
  
    //instance for dice one
    Dice *diceOne = [[Dice alloc]init];
    [_dices addObject:diceOne];
    
    //instance for dice two
    Dice *diceTwo = [[Dice alloc]init];
    [_dices addObject:diceTwo];
    
    //instance for dice three
    Dice *diceThree = [[Dice alloc] init];
    [_dices addObject:diceThree];
    
    //instance for dice four
    Dice *diceFour = [[Dice alloc] init];
    [_dices addObject:diceFour];
    
    //instance for dice five
    Dice *diceFive = [[Dice alloc] init];
    [_dices addObject:diceFive];
    
    for (int i=0; i<[_dices count]; i++) {
        [_tempArrayHeldDices addObject:_dices[i]];
    }
//    [_tempArrayHeldDices addObjectsFromArray:_dices];
}

//this function handles the user unholding a dice if he/she accidentally held it.
-(void)unholdDice:(int)userUnhold{
    if ([_saveUserIndexes isEqualTo:@(userUnhold)]) {
        [_saveUserIndexes removeObject:@(userUnhold)];
    }
}

//function to hold a dice
-(void)holdingDice:(int)meNum{
   
    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
    
    //copying from dices array to holdDices array..
    [_holdDices addObjectsFromArray:_dices];
    
    //checking if array user indexes is saved in is empty then add new userIndex input (hold a dice) otherwise delete existing(unhold a dice)
    if ([_saveUserIndexes count] > 0) {
            if (!([_saveUserIndexes containsObject:@(meNum)])) {
                [_saveUserIndexes addObject:@(meNum)];
            }
        
    }else{
        [_saveUserIndexes addObject:@(meNum)];
    }
    
    //proving user a view of indexes to chose from that will be printed to the screen between 0 - 4 for available dices
    for (int i=0; i<[self.dices count]; i++) {
        [indexArray addObject:@(i)];
    }
    //making writable form of string for UI to appear separated by ,
    NSString * printIndexes = [indexArray componentsJoinedByString:@","];
    NSLog(@"Indexes: [%@]", printIndexes);
    
    
    //checking if value exists in saveUserIndex before displaying it as held or unheld to user
    if ([_saveUserIndexes count] > 0) {
        NSString * printIndexesHeld = [self.saveUserIndexes componentsJoinedByString:@"]["];
        NSLog(@"Indexes of Held Dices: [%@]", printIndexesHeld);
    } else {
        NSLog(@"No Held Dices");
    }
    
    
    

}
//this function calculates the current score of user per roll
-(void)currentScore{
    NSMutableArray *currScore = [[NSMutableArray alloc] init];
    int scoreTotal = 0;
    NSUInteger diceScore;
    int actualDiceScore;
    int currValForIndex;
    NSNumber *indxVal;
    if ([_saveUserIndexes  count] >0) {
        for (int i=0; i<[_saveUserIndexes count]; i++) {
            indxVal = _saveUserIndexes[i];
            [currScore addObject:indxVal];
            currValForIndex = [indxVal intValue];
            diceScore = self.dices[currValForIndex].currentValue;
            actualDiceScore = (int) diceScore;
            if (actualDiceScore == 3) {
                actualDiceScore = 0;
            }
            scoreTotal += actualDiceScore;
            _scoreToBeat = scoreTotal;
        }
        NSLog(@"Current Score: %d",scoreTotal);
    }else{
        NSLog(@"Current Score: 0");
    }
    
}

//this function resets dice
-(void)resetDice{
    NSLog(@"Resetting Game.. Please wait..");
    [self.holdDices removeAllObjects];
    [self.saveUserIndexes removeAllObjects];
    NSLog(@"Done..");
    _rollsTracking = 0;
}

//this function starts a new game
-(void)newGame{
    NSLog(@"Starting a new Game..");
    [self.holdDices removeAllObjects];
    [self.saveUserIndexes removeAllObjects];
    _scoreToBeat = 0;
}
@end
