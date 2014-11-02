//
//  TweetCell.m
//  Twappy Birds
//
//  Created by Vishy Poosala on 10/31/14.
//  Copyright (c) 2014 Vi Po. All rights reserved.
//

#import "TweetCell.h"
#import "TwitterClient.h"

NSString * const PlayOnTweetNotification = @"PlayOnTweetNotification";
@implementation TweetCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onReply:(id)sender {
}

- (IBAction)onRetweet:(id)sender {
}

- (IBAction)onFav:(id)sender {
    
    [[TwitterClient sharedInstance] favToggle:self.tweet.idstr completion:^(NSError *error) {
        if (! error) {
            [self.favButton setImage:[UIImage imageNamed:@"fav-on"] forState:UIControlStateNormal];
        }

    }];
    
}
- (IBAction)onPlay:(id)sender {
    
    NSLog(@"play clicked");
    NSNumber *row = [[NSNumber alloc] initWithInt:self.rownum];
    NSDictionary* userInfo = @{@"rownum": row};
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"eRXReceived" object:self userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:PlayOnTweetNotification object:self userInfo:userInfo];
}
@end
