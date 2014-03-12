//
//  KXViewController.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXViewController.h"
#import "KXGameTileFactory.h"
#import "KXWeaponFactory.h"
#import "KXArmorFactory.h"

@interface KXViewController ()

@end

@implementation KXViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.actionButton setTitle:@"Nothing To Do Here" forState:UIControlStateDisabled];
  self.currentPosition = CGPointMake(0, 0);
	
  // Do any additional setup after loading the view, typically from a nib.
  KXGameTileFactory *factory = [[KXGameTileFactory alloc] init];
  self.gameTiles = [factory tiles];
  [self setupCharacter];
  [self findAndSetCurrentTile];
  //[self updateGameUI];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)findAndSetCurrentTile
{
  NSArray *row = [self.gameTiles objectAtIndex:self.currentPosition.x];
  KXTile *tile = [row objectAtIndex:self.currentPosition.y];
  self.currentTile = tile;
  [self updateGameUI];
}

-(void)setupCharacter
{
  self.character = [[KXCharacter alloc] init];
  self.character.weapon = [KXWeaponFactory fist];
  self.character.armor = [KXArmorFactory clothes];
  self.character.health = 20;
  self.character.damage = 5;
}

-(void)updateGameUI
{
  // just to aid in the debugging of the map
  self.cordLabel.text = self.currentTile.name;
  
#pragma mark - Update Attacker Info
  if (self.currentTile.attacker != nil) {
    self.attackerNameLabel.text = [NSString stringWithFormat:@"Attacker: %@", self.currentTile.attacker.name];
    if (self.currentTile.attacker.health > 0) {
      self.attackerHealthLabel.text = [NSString stringWithFormat:@"HP: %i", self.currentTile.attacker.health];
    } else {
      self.attackerHealthLabel.text = @"Dead";
      self.currentTile.story = [NSString stringWithFormat:@"Here lay the remains of %@", self.currentTile.attacker.name];
      self.currentTile.action = nil;
    }
  } else {
    self.attackerNameLabel.text = @"";
    self.attackerHealthLabel.text = @"";
  }
  
#pragma mark - Update Tile and Story
  //self.storyLabel.text = self.currentTile.story;
  //self.gameImage.image = self.currentTile.image;
  [UIView transitionWithView:self.view
                    duration:0.5
                     options:UIViewAnimationOptionTransitionCrossDissolve
                  animations:^{
                    self.gameImage.image = self.currentTile.image;
                    self.storyLabel.text = self.currentTile.story;
                  } completion:^(BOOL finished) {
                    
                  }];
  
#pragma mark - Update Player Info
  int healthBonus = self.character.weapon.healthBonus + self.character.armor.healthBonus;
  self.healthLabel.text = [NSString stringWithFormat:@"HP: %i (+%i)", self.character.health, healthBonus];
  self.damageLabel.text = [NSString stringWithFormat:@"ATK: %i", self.character.damage];
  self.weaponName.text = [NSString stringWithFormat:@"W: %@ (%i)", self.character.weapon.name, self.character.weapon.damage];
  self.armorName.text = [NSString stringWithFormat:@"A: %@ (%i)", self.character.armor.name, self.character.armor.protect];
  
#pragma mark - Update Buttons
  if (self.currentTile.action != nil)
  {
    [self.actionButton setTitle:self.currentTile.action forState:UIControlStateNormal];
    self.actionButton.enabled = YES;
  }
  else
    self.actionButton.enabled = NO;
  
  self.northButton.enabled = self.currentTile.canGoNorth;
  self.eastButton.enabled = self.currentTile.canGoEast;
  self.southButton.enabled = self.currentTile.canGoSouth;
  self.westButton.enabled = self.currentTile.canGoWest;
}

-(void)performAction
{
  if (self.currentTile.weapon != nil) {
    self.character.weapon = self.currentTile.weapon;
    self.currentTile.action = nil;
  }
  
  if (self.currentTile.armor != nil) {
    self.character.armor = self.currentTile.armor;
    self.currentTile.action = nil;
  }
  
  if (self.currentTile.attacker != nil) {
    if (self.currentTile.attacker.health > 0)
    {
      [self calculateBattleResults];
    }
  }
  
  [self updateGameUI];
}

-(int)calculatePlayerHit
{
  int damage = arc4random() % self.character.damage;
  damage += arc4random() % self.character.weapon.damage;
  return damage;
}

-(int) calculateAttackerHit
{
  int damage = arc4random() % self.currentTile.attacker.damage;
  damage -= arc4random() % self.character.armor.protect;
  if (damage < 0) {
    damage = 0;
  }
  return damage;
}

-(void)calculateBattleResults
{
  //Who hit whom
  int playerDamage = [self calculatePlayerHit];
  int attackerDamage = [self calculateAttackerHit];
  
  NSString *playerMessage = [NSString stringWithFormat:@"You did %i points of damage.", playerDamage];
  NSString *attackerMessage = [NSString stringWithFormat:@"%@ did %i points of damage.", self.currentTile.attacker.name, attackerDamage];
  
  // Who goes first
  int coinToss = arc4random() % 2;
  switch (coinToss) {
    case 0:
      //NSLog(@"Attacker Goes First");
      self.character.health -= attackerDamage;
      if (self.character.health <= 0) {
        [self gameOver:@"You died trying"];
        self.currentTile.action = nil;
        playerMessage = @"You died.";
      }
      else
        self.currentTile.attacker.health -= playerDamage;
      self.currentTile.story = [NSString stringWithFormat:@"%@ %@", attackerMessage, playerMessage];
      break;
      
    case 1:
      //NSLog(@"Player Goes First");
      self.currentTile.attacker.health -= playerDamage;
      if (self.currentTile.attacker.health > 0) {
        self.character.health -= attackerDamage;
        if (self.character.health <= 0){
          self.currentTile.action = nil;
          [self gameOver:@"You died trying"];
          playerMessage = @"You died.";
        }
      } else {
        attackerMessage = [NSString stringWithFormat:@"%@ died.", self.currentTile.attacker.name];
        self.currentTile.action = nil;
        [self showMessage:attackerMessage];        
      }
      self.currentTile.story = [NSString stringWithFormat:@"%@ %@", playerMessage, attackerMessage];
      break;
  }
}

-(void)showMessage:(NSString *)message
{
  [self showMessage:message title: nil];
}

-(void)showMessage:(NSString *)message title:(NSString *)title
{
  UIAlertView *view = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
  [view show];
}

-(void)gameOver:(NSString *)message
{
  [self showMessage:message title:@"Game Over"];
}

- (IBAction)actionButtonTouchUpInside:(UIButton *)sender
{
  [self performAction];
}

// Since the tiles "know" where they are, we shouldn't be able
// to be out of bounds
- (IBAction)northButtonTouchUpInside:(UIButton *)sender
{
  // we moved up one
  self.currentPosition = CGPointMake(self.currentPosition.x + 1, self.currentPosition.y);
  [self findAndSetCurrentTile];
//  [self updateGameUI];
}

- (IBAction)eastButtonTouchUpInside:(UIButton *)sender
{
  // we moved right one
  self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
  [self findAndSetCurrentTile];
//  [self updateGameUI];
}

- (IBAction)westButtonTouchUpInside:(UIButton *)sender
{
  // we moved left one
  self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
  [self findAndSetCurrentTile];
//  [self updateGameUI];
}

- (IBAction)southButtonTouchUpInside:(UIButton *)sender
{
  // we moved down one
  self.currentPosition = CGPointMake(self.currentPosition.x - 1, self.currentPosition.y);
  [self findAndSetCurrentTile];
//  [self updateGameUI];
}

@end
