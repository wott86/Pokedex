//
//  Sprites.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


#define kSpritesEntityName @"Sprites"
#define kSpritesIDKey @"id"
#define kSpritesImageKey @"image"
#define kSpritesResourceURI @"resource_uri"

@class Pokemons;

NS_ASSUME_NONNULL_BEGIN

@interface Sprites : NSManagedObject

+(Sprites *)spriteWithSpriteInfo:(NSDictionary *)spriteInfo inManagedObjectContext:(NSManagedObjectContext *)context;

-(Sprites *)editSpriteWithSpriteInfo:(NSDictionary *)spriteInfo;

@end

NS_ASSUME_NONNULL_END

#import "Sprites+CoreDataProperties.h"
