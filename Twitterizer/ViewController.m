//
//  ViewController.m
//  Twitterizer
//
//  Created by Andrew Chen on 1/13/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *twitterTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)twitterize:(id)sender {
    NSMutableString *twitterizePhrase = [NSMutableString new];
    //NSUInteger length = self.twitterTextField.text.length;
    NSString *phrase = self.twitterTextField.text;
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUaeiou"];
    NSCharacterSet *invalidVowels = [vowels invertedSet];
    NSRange searchRange = NSMakeRange(0, phrase.length);
    NSRange foundRange = [phrase rangeOfCharacterFromSet:invalidVowels];
    //NSRange range = [phrase rangeOfString:@"a"];
//    //for (int i = 0; i < length; i++)
//    {
//        if ([phrase characterAtIndex:i] = )
//        {
//            [phrase stringByReplacingOccurrencesOfString:@"a"withString:@""];
//        }
//    }
    
}

@end
