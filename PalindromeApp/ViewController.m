//
//  ViewController.m
//  PalindromeApp
//
//  Created by DetroitLabs on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSString *yay = palindromeTF.text;
    NSLog(@"%@", yay);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(IBAction)submitButtonPressed {
    _palindromeWord = palindromeTF.text;
   
    _palindromeWord = [self lowercaseAndRemoveSpaces:_palindromeWord];
    NSString *reversedWord = [self determinePalindrome:_palindromeWord];

    //Words being compared:
    NSLog(@"INPUT: %@", _palindromeWord);
    NSLog(@"Reversed Word: %@", reversedWord);

    if ([_palindromeWord isEqualToString: reversedWord]) {
        [self displayAnswer:@"YAY!" message:@"Palindrome Time!"];
    } else {
        [self displayAnswer:@"Uh Oh!" message:@"No Palindrome!"];
    }
    
    
}

-(NSString *)lowercaseAndRemoveSpaces:(NSString *)word {

    NSString *lowercaseWord = [word lowercaseString];
    NSString *wordWithNoSpaces = [lowercaseWord stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    word = wordWithNoSpaces;
    
    return word;
}

-(NSString *)determinePalindrome:(NSString *)word {
    
    NSMutableArray *characters = [NSMutableArray array];
    
        for (NSInteger charIdx=0; charIdx<word.length; charIdx++) {
            char wordCharacter = (char)[word characterAtIndex: charIdx];
            NSString *charAsString = [NSString stringWithFormat:@"%c", wordCharacter];
            [characters addObject:charAsString];
//            NSLog(@"Array: %@", characters);
        }
    
    NSArray *reversedChars = [[characters reverseObjectEnumerator] allObjects];
//    NSLog(@"REVERSED: %@", reversedChars);
    NSString *reversedWord = [[reversedChars valueForKey:@"description"] componentsJoinedByString:@""];
//    NSLog(@"R: %@", reversedWord);
    return reversedWord;
}

-(void)displayAnswer:(NSString *)messageTitle message:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:messageTitle
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}




@end
