//
//  KXViewController.h
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KXTile.h"
#import "KXCharacter.h"

@interface KXViewController : UIViewController

#pragma mark - Game Elements
@property (strong, nonatomic) KXCharacter *character;
@property (strong, nonatomic) KXTile *currentTile;
@property (nonatomic) CGPoint currentPosition;

#pragma mark - UI Elements
@property (strong, nonatomic) IBOutlet UIImageView *gameImage;
@property (strong, nonatomic) IBOutlet UILabel *attackerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *attackerHealthLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponName;
@property (strong, nonatomic) IBOutlet UILabel *armorName;

#pragma mark - UI Events
- (IBAction)actionButtonTouchUpInside:(UIButton *)sender;
- (IBAction)northButtonTouchUpInside:(UIButton *)sender;
- (IBAction)eastButtonTouchUpInside:(UIButton *)sender;
- (IBAction)westButtonTouchUpInside:(UIButton *)sender;
- (IBAction)southButtonTouchUpInside:(UIButton *)sender;

@end
