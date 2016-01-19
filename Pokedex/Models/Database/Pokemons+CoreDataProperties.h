//
//  Pokemons+CoreDataProperties.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pokemons.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pokemons (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *male_female_ratio;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *national_id;
@property (nullable, nonatomic, retain) NSString *resource_uri;
@property (nullable, nonatomic, retain) NSNumber *downloaded;
@property (nullable, nonatomic, retain) Sprites *pokemons_sprites;

@end

NS_ASSUME_NONNULL_END
