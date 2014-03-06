//
//  KXViewController.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXViewController.h"

@interface KXViewController ()

@end

@implementation KXViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.actionButton setTitle:@"Nothing To Do Here" forState:UIControlStateDisabled];
  self.currentPosition = CGPointMake(0, 0);
	
  // Do any additional setup after loading the view, typically from a nib.
  [self testView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)testView
{
  self.character = [[KXCharacter alloc] init];
  self.character.weapon = [[KXWeapon alloc] init];
  self.character.armor = [[KXArmor alloc] init];
  self.character.health = 20;
  self.character.damage = 5;
  self.character.weapon.name = @"Fists";
  self.character.weapon.damageBonus = 1;
  self.character.weapon.healthBonus = 0;
  self.character.armor.name = @"Clothes";
  self.character.armor.healthBonus = 0;
  self.character.armor.protectBonus = 0;

  self.currentTile = [[KXTile alloc] init];
  
  [self UpdateGameUI];
}

-(void)UpdateGameUI
{
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
  self.healthLabel.text = [NSString stringWithFormat:@"HP: %i", self.character.health];
  self.damageLabel.text = [NSString stringWithFormat:@"ATK: %i", self.character.damage];
  self.weaponName.text = [NSString stringWithFormat:@"W: %@ (%i/%i)", self.character.weapon.name, self.character.weapon.damageBonus, self.character.weapon.healthBonus];
  self.armorName.text = [NSString stringWithFormat:@"A: %@ (%i/%i)", self.character.armor.name, self.character.armor.protectBonus, self.character.armor.healthBonus];
  
#pragma mark - Update Buttons
  if (self.currentTile.action != nil)
    [self.actionButton setTitle:self.currentTile.action forState:UIControlStateNormal];
  else
    self.actionButton.enabled = NO;
  
  if (self.character.health <= 0)
    [self gameOver:@"You died trying"];
}

-(void)gameOver:(NSString *)message
{
  UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Game Over" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
  [view show];
}

-(void)allowDirectionalNorthButton:(BOOL)north southButton:(BOOL)south eastButton:(BOOL)east westButton:(BOOL)west
{
  self.northButton.enabled = north;
  self.southButton.enabled = south;
  self.eastButton.enabled = east;
  self.westButton.enabled = west;
}

- (IBAction)actionButtonTouchUpInside:(UIButton *)sender
{
//  [self setAttackerName: nil];
//  [self setAttackerHealth: -1];
//  [self setStory: nil];
//  [self allowDirectionalNorthButton:YES southButton:NO eastButton:NO westButton:YES];
//  [self setPlayerHealth:0];
}

- (IBAction)northButtonTouchUpInside:(UIButton *)sender {
}

- (IBAction)eastButtonTouchUpInside:(UIButton *)sender {
}

- (IBAction)westButtonTouchUpInside:(UIButton *)sender {
}

- (IBAction)southButtonTouchUpInside:(UIButton *)sender {
}
@end
