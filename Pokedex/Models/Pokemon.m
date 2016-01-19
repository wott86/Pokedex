//
//  Pokemon.m
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "Pokemon.h"
#import "NetworkManager.h"
#import "AppDelegate.h"
#import "Constants.h"

@implementation Pokemon

+(void)getPokemonList {
    [[NetworkManager sharedManager] GET:@"/api/v1/pokedex/1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [Pokemons listPokemonsWithPokemonsListInfo:responseObject inManagedObjectContext:[[AppDelegate getAppDelegate] managedObjectContext]];
        [[AppDelegate getAppDelegate] saveContext];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getPokemon:(Pokemons *)pokemon {
    if (!pokemon.resource_uri) return;
    [[NetworkManager sharedManager] GET:pokemon.resource_uri parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [pokemon editPokemonWithPokemonInfo:responseObject];
        pokemon.downloaded = @YES;
        [[AppDelegate getAppDelegate] saveContext];
        [[NSNotificationCenter defaultCenter] postNotificationName:kPokemonDetailsDonwloaded object:pokemon.objectID];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(NSFetchedResultsController *)listPokemons {
    return [Pokemons listPokemonsWithPredicate:nil inManagedObjectContext:[[AppDelegate getAppDelegate] managedObjectContext]];
}

@end
