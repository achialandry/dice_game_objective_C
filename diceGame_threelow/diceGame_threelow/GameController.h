//
//  GameController.h
//  diceGame_threelow
//
//  Created by Landry Achia Ndong on 2018-04-25.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

# pragma mark - Public properties
@property NSMutableArray <Dice *> *dices;
@property NSMutableArray <Dice*> *holdDices;
@property NSMutableArray <Dice*> *tempArrayHeldDices;
@property NSMutableArray *saveUserIndexes;
@property int printTracking;
@property int rollsTracking;
@property int scoreToBeat;


# pragma mark - Public methods
-(instancetype)init;
- (void) setupGame;
-(void)holdingDice:(int)meNum;
-(void)unholdDice:(int)userUnhold;
-(void)currentScore;
-(void)resetDice;
-(void)newGame;
@end
