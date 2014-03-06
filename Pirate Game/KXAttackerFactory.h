//
//  KXAttackerFactory.h
//  Pirate Game
//
//  Created by Kenneth Wilcox on 3/6/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KXAttacker.h"

@interface KXAttackerFactory : NSObject

+(KXAttacker *)slimySmee;
+(KXAttacker *)blackBart;

@end
