//
//  Dice.h
//  diceGame_threelow
//
//  Created by Landry Achia Ndong on 2018-04-23.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

# pragma mark - Public properties
@property NSUInteger currentValue;

# pragma mark - Public methods
/*method randomizes the current value passed as argument */
-(void)randomizeValue:(NSUInteger)valueToRandomize;
@end
