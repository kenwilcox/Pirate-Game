//
//  KXViewController.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXViewController.h"
#import "KXGameTileFactory.h"

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
  [self findAndSetCurrentTile];
  [self setupCharacter];
  [self updateGameUI];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)findAndSetCurrentTile
{
  NSArray *row = [self.gameTiles objectAtIndex:self.currentPosition.x];
//  NSLog(@"%@", row);
  KXTile *tile = [row objectAtIndex:self.currentPosition.y];
//  NSLog(@"%@", tile.name);
  self.currentTile = tile;
}

-(void)setupCharacter
{
  self.character = [[KXCharacter alloc] init];
  self.character.weapon = [[KXWeapon alloc] init];
  self.character.armor = [[KXArmor alloc] init];
  self.character.health = 20;
  self.character.damage = 5;
  self.character.weapon.name = @"Fists";
  self.character.weapon.damage = 1;
  self.character.weapon.healthBonus = 0;
  self.character.armor.name = @"Clothes";
  self.character.armor.healthBonus = 0;
  self.character.armor.protect = 0;
}

-(void)updateGameUI
{
  self.cordLabel.text = self.currentTile.name;
  
#pragma mark - Update Attacker Info
  if (self.currentTile.attacker != nil) {
    self.attackerNameLabel.text = [NSString stringWithFormat:@"Attacker: %@", self.currentTile.attacker.name];
    if (self.currentTile.attacker.health > 0) {
      self.attackerHealthLabel.text = [NSString stringWithFormat:@"HP: %i", self.currentTile.attacker.health];
    } else if (self.currentTile.attacker.health == -1){
      self.attackerHealthLabel.text = @"";
    } else
      self.attackerHealthLabel.text = @"Dead";
  } else {
    self.attackerNameLabel.text = @"";
    self.attackerHealthLabel.text = @"";
  }
  
#pragma mark - Update Tile and Story
  self.storyLabel.text = self.currentTile.story;
  self.gameImage.image = self.currentTile.image;
  
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
  
  if (self.character.health <= 0)
    [self gameOver:@"You died trying"];
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
  
  [self updateGameUI];
}

-(void)gameOver:(NSString *)message
{
  UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Game Over" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
  [view show];
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
  [self updateGameUI];
}

- (IBAction)eastButtonTouchUpInside:(UIButton *)sender
{
  // we moved right one
  self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
  [self findAndSetCurrentTile];
  [self updateGameUI];
}

- (IBAction)westButtonTouchUpInside:(UIButton *)sender
{
  // we moved left one
  self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
  [self findAndSetCurrentTile];
  [self updateGameUI];
}

- (IBAction)southButtonTouchUpInside:(UIButton *)sender
{
  // we moved down one
  self.currentPosition = CGPointMake(self.currentPosition.x - 1, self.currentPosition.y);
  [self findAndSetCurrentTile];
  [self updateGameUI];
}
@end
