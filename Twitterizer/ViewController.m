//
//  ViewController.m
//  Twitterizer
//
//  Created by Andrew Chen on 1/13/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *twitterTextField;
@property (weak, nonatomic) IBOutlet UILabel *howMany;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.twitterTextField.delegate = self;
}


- (void) textViewDidChange:(UITextView *)textView {
    NSInteger wordcount = self.twitterTextField.text.length;
    self.howMany.text = [NSString stringWithFormat:@"characters: %li",wordcount];
  /*  if (wordcount > 139) {
        NSString * last = [self.twitterTextField.text characterAtIndex:140];
        }*/
    }

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text length] == 0)
    {
        if(self.twitterTextField.text.length != 0)
        {
            return YES;
        }
        else {
            return NO;
        }
    }
    else if(self.twitterTextField.text.length > 139)
    {
        return NO;
    }
    return YES;
    
}

- (IBAction)hashTag:(id)sender {
    NSString * hashTagWord = self.twitterTextField.text;
    NSMutableString * resultHashWord = [NSMutableString new];
    NSInteger length = self.twitterTextField.text.length;
    
    NSMutableArray *newArray = [NSMutableArray new];
    NSArray *hashTagArray = [self.twitterTextField.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    hashTagArray = [hashTagArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    
    for (int i = 0; i < hashTagArray.count; i++) {
        if (i%2==1 && [[hashTagArray objectAtIndex:i] characterAtIndex:0] != '#') {
            //creating a new object with #
            NSString *hashedWord = [NSString stringWithFormat:@"#%@", [hashTagArray objectAtIndex:i]];
            //add object to newArray
            [newArray addObject:hashedWord];
        }
        else {
            [newArray addObject:[hashTagArray objectAtIndex:i]];
        }
    }
    NSString *finalString = [newArray componentsJoinedByString:@" "];
    self.twitterTextField.text = finalString;

    
    
    
    /*NSArray *hashTagArray = [self.twitterTextField.text componentsSeparatedByString:@" "];
    
    int i = 1;
    for (NSArray *word in hashTagArray) {
        if (i == even) {
            
        }
        else if (i == odd) {
            // do stuff here
        }
        i++
    }
   
     
     for (int i = 1; i < length; i++) {
     if (i % 2 == 0) {
     NSString *s = self.twitterTextField.text;
     NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUaeiou"];
     s = [[s componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
     NSLog(@"%@", s);
     self.twitterTextField.text = [NSString stringWithFormat:@"%@", s];

     
    
   for (int i = 0; i <length; i++ ) {
        if ([hashtagword ]) {
            <#statements#>
        }
    }*/
}






- (IBAction)twitterize:(id)sender {

    NSString *s = self.twitterTextField.text;
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUaeiou"];
    s = [[s componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    NSLog(@"%@", s);
    self.twitterTextField.text = [NSString stringWithFormat:@"%@", s];
}
    


@end
