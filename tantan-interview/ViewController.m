//
//  ViewController.m
//  tantan-interview
//
//  Created by rogue on 4/8/18.
//  Copyright © 2018 xy. All rights reserved.
//

#import "ViewController.h"
#import "TTFeedbackViewController.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = @"欢迎使用探探，在使用过程中有疑问请反馈";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString: string];
    NSRange range = [string rangeOfString:@"反馈"];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range];
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [attributedString addAttribute:NSLinkAttributeName value:@"tantanapp://feedback" range:range];
    
    UITextView *textView = [[UITextView alloc] init];
   
    textView.attributedText = attributedString;
    textView.editable = NO;
    textView.selectable = YES;
    textView.delegate = self;
    textView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: textView];
    
    [textView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-50];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300];

    [self.view addConstraints:@[center, bottom]];
    [textView addConstraints:@[height, width]];

}


- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    if ([URL.absoluteString isEqual: @"tantanapp://feedback"]) {
        NSLog(@"New View Controller.");
        TTFeedbackViewController *newTTFeedbackVC = [[TTFeedbackViewController alloc] init];
        [self presentViewController:newTTFeedbackVC animated:YES completion:nil];
    }
    return false;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
