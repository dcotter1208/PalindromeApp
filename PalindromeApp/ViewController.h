//
//  ViewController.h
//  PalindromeApp
//
//  Created by DetroitLabs on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField *palindromeTF;
}

@property (nonatomic, strong) NSString *palindromeWord;

-(IBAction)submitButtonPressed;


@end

