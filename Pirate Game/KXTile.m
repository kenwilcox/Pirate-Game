//
//  KXTile.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXTile.h"

@implementation KXTile

//- (id)init
//{
//  self = [super init];
//  if (self) {
//    self.action = nil;
//    self.story = @"You find yourself shipwrecked. The last thing you remember was being attacked by the dreaded pirate Black Bart. You are alone.";
//    self.image = [UIImage imageNamed:@"PirateStart.jpg"];
//    self.attacker = nil;
//    self.weapon = nil;
//    self.armor = nil;
//  }
//  return self;
//}

-(void)setWeapon:(KXWeapon *)weapon
{
  _weapon = weapon;
  if (weapon != nil)
    self.action = @"Equip weapon";
}

-(void)setArmor:(KXArmor *)armor
{
  _armor = armor;
  if (armor != nil)
    self.action = @"Equip armor";
}

@end
