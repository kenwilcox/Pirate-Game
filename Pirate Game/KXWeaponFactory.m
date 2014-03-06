//
//  KXWeaponFactory.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/6/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXWeaponFactory.h"

@implementation KXWeaponFactory

+(KXWeapon *)fist
{
  KXWeapon *weapon = [[KXWeapon alloc] init];
  weapon.name = @"Fists";
  weapon.damage = 1;
  weapon.healthBonus = 0;
  return weapon;
}

+(KXWeapon *)claymore
{
  KXWeapon *weapon = [[KXWeapon alloc] init];
  weapon.name = @"Claymore";
  weapon.damage = 15;
  weapon.healthBonus = 0;
  return weapon;
}

@end
