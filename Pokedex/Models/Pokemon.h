//
//  Pokemon.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemons.h"

@interface Pokemon : NSObject

/**
 *  @author César Vilera, 01-18-2016
 *
 *  Download the pokemon list from the server.
 */
+(void)getPokemonList;


/**
 *  @author César Vilera, 01-18-2016
 *
 *  Download the pokemon details from the server.
 *
 *  @param pokemon to be downloaded.
 */
+(void)getPokemon:(Pokemons *)pokemon;


/**
 *  @author César Vilera, 01-18-2016
 *
 *  List the pokemons in the database.
 *
 *  @return and NSFetchedResultsController that contains all the pokemons in the database.
 */
+(NSFetchedResultsController *)listPokemons;

@end
