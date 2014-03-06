//
//  KXGameTileFactory.m
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/5/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXGameTileFactory.h"
#import "KXWeaponFactory.h"
#import "KXArmorFactory.h"
#import "KXAttackerFactory.h"
#import "KXTile.h"

@implementation KXGameTileFactory

/*
 +---+---+---+
 |       |   |
 | S   L | X |
 |       |   |
 +   +   +   +
 |   |   |   |
 |   | B | C |
 |   |   |   |
 +   +---+   +
 |           |
 | q         |
 |           |
 +   +   +   +
 |           |
 | ^       r |
 |           |
 +---+---+---+
 
 Legend:
 ^ = Starting point
 r = Rusty Helmet
 
 q = Hear rumor
 
 B = Black Bart
 C = cliffs
 
 S = Slimy Smee
 L = Claymore
 X = Fall to your death
 
 Blank Squares have nothing important
*/

/*
4: 3,0 | 3,1 | 3,2
3: 2,0 | 2,1 | 2,2
2: 1,0 | 1,1 | 1,2
1: 0,0 | 0,1 | 0,2
*/

-(NSArray *)tiles
{
#pragma mark - Create Tiles
  // Completed
  KXTile *tile00 = [[KXTile alloc] init];
  tile00.story = @"You find yourself shipwrecked. The last thing you remember was being attacked by the dreaded pirate Black Bart. You are alone.";
  tile00.action = nil;
  tile00.image = [UIImage imageNamed:@"PirateStart.jpg"];
  tile00.name = @"0,0";
  tile00.attacker = nil;
  tile00.weapon = nil;
  tile00.armor = nil;
  tile00.canGoNorth = YES;
  tile00.canGoEast = YES;
  tile00.canGoSouth = NO;
  tile00.canGoWest = NO;
  
  KXTile *tile01 = [[KXTile alloc] init];
  tile01.story = @"Moving along the beach you can see a clearing up ahead.";
  tile01.action = nil;
  tile01.image = [UIImage imageNamed:@"PirateStart.jpg"];
  tile01.name = @"0,1";
  tile01.attacker = nil;
  tile01.weapon = nil;
  tile01.armor = nil;
  tile01.canGoNorth = YES;
  tile01.canGoEast = YES;
  tile01.canGoSouth = NO;
  tile01.canGoWest = YES;
  
  KXTile *tile02 = [[KXTile alloc] init];
  tile02.story = @"You find a rusty helmet. If you put it on, you may feel more protected.";
  tile02.action = nil;
  tile02.image = [UIImage imageNamed:@"PirateTreasure.jpg"];
  tile02.name = @"0,2";
  tile02.attacker = nil;
  tile02.weapon = nil;
  tile02.armor = [KXArmorFactory rustyHelmet];
  tile02.canGoNorth = YES;
  tile02.canGoEast = NO;
  tile02.canGoSouth = NO;
  tile02.canGoWest = YES;
  
  // Row 3
  KXTile *tile10 = [[KXTile alloc] init];
  tile10.story = @"You heard rumors of a once magical sword. Maybe you can find it!";
  tile10.action = nil;
  tile10.image = [UIImage imageNamed:@"PirateBlacksmith.jpg"];
  tile10.name = @"1,0";
  tile10.attacker = nil;
  tile10.weapon = nil;
  tile10.armor = nil;
  tile10.canGoNorth = NO;
  tile10.canGoEast = YES;
  tile10.canGoSouth = YES;
  tile10.canGoWest = NO;

  KXTile *tile11 = [[KXTile alloc] init];
  tile11.story = @"You run into Slimy Smee, who is not happy to see you.";
  tile11.action = nil;
  tile11.image = [UIImage imageNamed:@"PirateBoss.jpg"];
  tile11.name = @"1,1";
  tile11.attacker = [KXAttackerFactory slimySmee];
  tile11.weapon = nil;
  tile11.armor = nil;
  tile11.canGoNorth = NO;
  tile11.canGoEast = YES;
  tile11.canGoSouth = YES;
  tile11.canGoWest = YES;

  KXTile *tile12 = [[KXTile alloc] init];
  tile12.story = @"You heard rumors of a once magical sword. Maybe you can find it!";
  tile12.action = nil;
  tile12.image = [UIImage imageNamed:@"PirateTreasure2.jpg"];
  tile12.name = @"1,2";
  tile12.attacker = nil;
  tile12.weapon = nil;
  tile12.armor = nil;
  tile12.canGoNorth = NO;
  tile12.canGoEast = NO;
  tile12.canGoSouth = YES;
  tile12.canGoWest = YES;
  
  // Row 2
  
  // Row 1

  NSArray *row3 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
  NSArray *row4 = [[NSArray alloc] initWithObjects:tile00, tile01, tile02, nil];
  
  NSArray *tiles = [[NSArray alloc] initWithObjects:row4, row3, nil];
  
  return tiles;
}

-(NSArray *)tilesWithWidth:(int)width height:(int)height
{
  KXTile *tile = [[KXTile alloc] init];
  
  NSArray *tiles = [[NSArray alloc] initWithObjects: tile, nil];
  return tiles;
}

@end
