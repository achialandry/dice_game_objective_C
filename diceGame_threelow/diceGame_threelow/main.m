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
#import "GameController.h"

/*method to check type of unicode value*/
BOOL isANumber(NSString *checkInputIsInt){
    NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]+$'"];
    return [numberPredicate evaluateWithObject:checkInputIsInt];
}

//method to output the different special characters to represent dice values.
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
    
        GameController *controller = [[GameController alloc] init];
       
        [controller setupGame];
        //getting input from user to perfom the roll
        
        NSString *checkIfInputIsRoll = @"roll";
        NSString *resetInput = @"reset";
        NSString *newGame = @"newgame";
        NSString *quitMessage =@"quit";
        int proceed = 1;
        while (proceed) {
            NSString *userInput;
            if (controller.rollsTracking < 5) {
                userInput = [InputCollector inputForPrompt:@"Type roll to ROLL dice, reset to RESET , newgame to Start NEW GAME OR. quit to QUIT app: "];
            } else {
                userInput = [InputCollector inputForPrompt:@"You MUST reset to continue.. Type Reset: "];
            }
            
            if ([userInput isEqualToString:checkIfInputIsRoll] && controller.rollsTracking <= 5) {
                
                //displaying number of rolls since last reset
                NSLog(@"Number of rolls:%d", ++controller.rollsTracking);
                NSLog(@"Score to Beat: %d", controller.scoreToBeat);
    
                NSUInteger value;
                
                for (int i=0; i<5; i++) {
                    
                    if ([controller.saveUserIndexes containsObject:@(i)]) {
                        continue;
                    } else {
                        [controller.tempArrayHeldDices[i] randomizeValue];
                        value = controller.tempArrayHeldDices[i].currentValue;
                        sendOutUnicode(value);
                        controller.printTracking ++;
                    }
                    
                    
                }
                NSString *userHoldInputs = [InputCollector inputForPrompt:@"Indexes of Dices to hold: "];
                
                //getting all numbers from userHoldInputs and putt inside an array
                
                NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"\\b\\d+" options:0 error:nil];
                NSArray *matches = [expression matchesInString:userHoldInputs options:0 range:(NSMakeRange(0, userHoldInputs.length))];
                NSMutableArray *result = [[NSMutableArray alloc] init];
                for (NSTextCheckingResult *match in matches) {
                    [result addObject:[userHoldInputs substringWithRange:match.range]];
                }
                
                
                for (int k=0; k<[result count]; k++) {
                    NSNumber *objIdx = result[k];
                    int indx = [objIdx intValue];
                    if (indx > 4) {
                        NSLog(@"Failed to add %d Index must be between 0 - 4", indx);
                    }else{
                        [controller holdingDice:indx];
                    }
                    
                }
                //the user current score
                [controller currentScore];
                proceed = 1;
            }else if([userInput isEqualToString:resetInput]){
                //reset dices
                [controller resetDice];
                proceed = 1;
            }else if([userInput isEqualToString:newGame]){
                //reset dices
                [controller newGame];
                proceed = 1;
            }else if([userInput isEqualToString:quitMessage]){
                proceed = 0;
            }
        }
    }
    return 0;
}
