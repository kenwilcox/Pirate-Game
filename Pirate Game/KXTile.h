//
//  KXTile.h
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KXAttacker.h"
#import "KXWeapon.h"
#import "KXArmor.h"

@interface KXTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *action;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;

// Each Tile "knows" where it is on the map
@property (nonatomic) BOOL canGoNorth;
@property (nonatomic) BOOL canGoEast;
@property (nonatomic) BOOL canGoSouth;
@property (nonatomic) BOOL canGoWest;

// The following can be nil
@property (strong, nonatomic) KXAttacker *attacker;
@property (strong, nonatomic) KXWeapon *weapon;
@property (strong, nonatomic) KXArmor *armor;

@end
