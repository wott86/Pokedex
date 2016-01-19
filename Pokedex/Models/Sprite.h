//
//  Sprite.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprites.h"

@interface Sprite : NSObject

/**
 *  @author César Vilera, 01-18-2016
 *
 *   Download the sprite details from the server.
 *
 *  @param sprite to be downloaded
 */
+(void)getSprite:(Sprites *)sprite;

@end
