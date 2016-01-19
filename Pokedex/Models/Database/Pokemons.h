//
//  Pokemons.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Sprites.h"

#define kPokemonsEntityName @"Pokemons"
#define kPokemonsIDKey @"national_id"
#define kPokemonsResourceUriKey @"resource_uri"
#define kPokemonsNameKey @"name"
#define kPokemonsMaleFemaleRatioKey @"male_female_ratio"
#define kPokemonsSpritesKey @"sprites"
#define kPokemonsSpriteResourceURIKey @"resource_uri"
#define kPokemonsPokemonInfoKey @"pokemon"

NS_ASSUME_NONNULL_BEGIN

@interface Pokemons : NSManagedObject

+(Pokemons *)pokemonWithPokemonInfo:(NSDictionary *)pokemonInfo inManagedObjectContext:(NSManagedObjectContext *)context;
-(Pokemons *)editPokemonWithPokemonInfo:(NSDictionary *)pokemonInfo;

+(NSFetchedResultsController *)listPokemonsWithPredicate:(nullable NSPredicate *)predicate inManagedObjectContext:(NSManagedObjectContext *)context;
+(NSFetchedResultsController *)listPokemonsWithPokemonsListInfo:(NSDictionary *)pokemonsListInfo inManagedObjectContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Pokemons+CoreDataProperties.h"
