//
//  KXAttackerFactory.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/6/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXAttackerFactory.h"

@implementation KXAttackerFactory

+(KXAttacker *)slimySmee
{
  KXAttacker *attacker = [[KXAttacker alloc] init];
  attacker.name = @"Slimy Smee";
  attacker.health = 10;
  attacker.damage = 5;
  return attacker;
}

+(KXAttacker *)blackBart
{
  KXAttacker *attacker = [[KXAttacker alloc] init];
  attacker.name = @"Black Bart";
  attacker.health = 15;
  attacker.damage = 8;
  return attacker;
}

@end
