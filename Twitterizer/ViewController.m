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
    NSString * hashtagword = self.twitterTextField.text;
    NSMutableString * resulthashword = [NSMutableString new];
    
/*    for (int i =0; <#condition#>; <#increment#>) {
        <#statements#>
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
