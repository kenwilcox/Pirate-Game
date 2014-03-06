//
//  KXCharacter.h
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KXWeapon.h"
#import "KXArmor.h"

@interface KXCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) KXWeapon *weapon;
@property (strong, nonatomic) KXArmor *armor;

@end
