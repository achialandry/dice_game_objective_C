//
//  Dice.m
//  diceGame_threelow
//
//  Created by Landry Achia Ndong on 2018-04-23.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import "Dice.h"
#import <GameplayKit/GKRandomSource.h>

@implementation Dice
static NSUInteger const upperBoundValue = 6;

-(void)randomizeValue{
     self.currentValue = [[GKRandomSource sharedRandom]nextIntWithUpperBound:upperBoundValue] + 1;
}
@end
