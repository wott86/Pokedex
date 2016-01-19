//
//  Sprites+CoreDataProperties.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sprites.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sprites (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *resource_uri;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSNumber *downloaded;
@property (nullable, nonatomic, retain) Pokemons *sprites_pokemons;

@end

NS_ASSUME_NONNULL_END
