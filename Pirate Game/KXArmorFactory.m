//
//  KXArmorFactory.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/6/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXArmorFactory.h"

@implementation KXArmorFactory

+(KXArmor *)clothes
{
  KXArmor *armor = [[KXArmor alloc] init];
  armor.protect = 1;
  armor.healthBonus = 0;
  armor.name = @"Clothes";
  return armor;
}

+(KXArmor *)rustyHelmet
{
  KXArmor *armor = [[KXArmor alloc] init];
  armor.protect = 8;
  armor.healthBonus = 2;
  armor.name = @"Rusty Helmet";
  return armor;
}

@end
