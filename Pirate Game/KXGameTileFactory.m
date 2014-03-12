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
 | L     | X |
 |       |   |
 +   +   +   +
 |   |   |   |
 |   | B | C |
 |   |   |   |
 +   +---+   +
 |           |
 | q   S     |
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
1: 3,0 | 3,1 | 3,2
2: 2,0 | 2,1 | 2,2
3: 1,0 | 1,1 | 1,2
4: 0,0 | 0,1 | 0,2
*/

-(NSArray *)tiles
{
#pragma mark - Create Tiles
  // Row 4 - starting row
  KXTile *tile00 = [[KXTile alloc] init];
  KXTile *tile01 = [[KXTile alloc] init];
  KXTile *tile02 = [[KXTile alloc] init];
  {
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
  }
  
  // Row 3
  KXTile *tile10 = [[KXTile alloc] init];
  KXTile *tile11 = [[KXTile alloc] init];
  KXTile *tile12 = [[KXTile alloc] init];
  {
  tile10.story = @"You heard rumors of a once magical sword. Maybe you can find it!";
  tile10.action = nil;
  tile10.image = [UIImage imageNamed:@"PirateBlacksmith.jpg"];
  tile10.name = @"1,0";
  tile10.attacker = nil;
  tile10.weapon = nil;
  tile10.armor = nil;
  tile10.canGoNorth = YES;
  tile10.canGoEast = YES;
  tile10.canGoSouth = YES;
  tile10.canGoWest = NO;

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

  tile12.story = @"You see cliffs up ahead";
  tile12.action = nil;
  tile12.image = [UIImage imageNamed:@"PirateStart.jpg"];
  tile12.name = @"1,2";
  tile12.attacker = nil;
  tile12.weapon = nil;
  tile12.armor = nil;
  tile12.canGoNorth = YES;
  tile12.canGoEast = NO;
  tile12.canGoSouth = YES;
  tile12.canGoWest = YES;
  }
  
  // Row 2
  KXTile *tile20 = [[KXTile alloc] init];
  KXTile *tile21 = [[KXTile alloc] init];
  KXTile *tile22 = [[KXTile alloc] init];
  {
    tile20.story = @"It's quiet... too quiet";
    tile20.action = nil;
    tile20.image = [UIImage imageNamed:@"PirateStart.jpg"];
    tile20.name = @"2,0";
    tile20.attacker = nil;
    tile20.weapon = nil;
    tile20.armor = nil;
    tile20.canGoNorth = YES;
    tile20.canGoEast = NO;
    tile20.canGoSouth = YES;
    tile20.canGoWest = NO;
    
    tile21.story = @"You finally found Black Bart, who you wish you didn't have to find.";
    tile21.action = nil;
    tile21.image = [UIImage imageNamed:@"PirateBoss.jpg"];
    tile21.name = @"2,1";
    tile21.attacker = [KXAttackerFactory blackBart];
    tile21.weapon = nil;
    tile21.armor = nil;
    tile21.canGoNorth = YES;
    tile21.canGoEast = NO;
    tile21.canGoSouth = NO;
    tile21.canGoWest = NO;
    
    tile22.story = @"You the cliff are getting higher, maybe you should turn around...";
    tile22.action = nil;
    tile22.image = [UIImage imageNamed:@"PirateStart.jpg"];
    tile22.name = @"2,2";
    tile22.attacker = nil;
    tile22.weapon = nil;
    tile22.armor = nil;
    tile22.canGoNorth = YES;
    tile22.canGoEast = NO;
    tile22.canGoSouth = YES;
    tile22.canGoWest = NO;
  }
  
  // Row 1
  KXTile *tile30 = [[KXTile alloc] init];
  KXTile *tile31 = [[KXTile alloc] init];
  KXTile *tile32 = [[KXTile alloc] init];
  {
    tile30.story = @"You found what looks like a sword, should you pick it up?";
    tile30.action = nil;
    tile30.image = [UIImage imageNamed:@"PirateBlacksmith.jpg"];
    tile30.name = @"3,0";
    tile30.attacker = nil;
    tile30.weapon = [KXWeaponFactory claymore];
    tile30.armor = nil;
    tile30.canGoNorth = NO;
    tile30.canGoEast = YES;
    tile30.canGoSouth = YES;
    tile30.canGoWest = NO;
    
    tile31.story = @"You find a cave to the south of you, should you go in?";
    tile31.action = nil;
    tile31.image = [UIImage imageNamed:@"PirateStart.jpg"];
    tile31.name = @"3,1";
    tile31.attacker = nil;
    tile31.weapon = nil;
    tile31.armor = nil;
    tile31.canGoNorth = NO;
    tile31.canGoEast = NO;
    tile31.canGoSouth = YES;
    tile31.canGoWest = YES;
    
    tile32.story = @"You loose your footing, fall into the ocean surrounded by sharks!";
    tile32.action = nil;
    tile32.image = [UIImage imageNamed:@"PirateTreasure2.jpg"];
    tile32.name = @"3,2";
    tile32.attacker = [KXAttackerFactory shark];
    tile32.weapon = nil;
    tile32.armor = nil;
    tile32.canGoNorth = NO;
    tile32.canGoEast = NO;
    tile32.canGoSouth = NO;
    tile32.canGoWest = NO;
  }
  
  NSArray *row1 = [[NSArray alloc] initWithObjects:tile30, tile31, tile32, nil];
  NSArray *row2 = [[NSArray alloc] initWithObjects:tile20, tile21, tile22, nil];
  NSArray *row3 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
  NSArray *row4 = [[NSArray alloc] initWithObjects:tile00, tile01, tile02, nil];
  
  NSArray *tiles = [[NSArray alloc] initWithObjects:row4, row3, row2, row1, nil];
  
  return tiles;
}

-(NSArray *)tilesWithWidth:(int)width height:(int)height
{
  KXTile *tile = [[KXTile alloc] init];
  
  NSArray *tiles = [[NSArray alloc] initWithObjects: tile, nil];
  return tiles;
}

@end
