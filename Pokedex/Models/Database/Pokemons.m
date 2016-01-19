//
//  Pokemons.m
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "Pokemons.h"
#import "Sprites.h"

@implementation Pokemons

+(Pokemons *)pokemonWithPokemonInfo:(NSDictionary *)pokemonInfo inManagedObjectContext:(NSManagedObjectContext *)context {
    
    Pokemons *pokemon = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kPokemonsEntityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"resource_uri == %@", pokemonInfo[kPokemonsResourceUriKey]];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"resource_uri"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if ([fetchedObjects count] > 1 || error) {
        NSLog(@"Error fetching Pokemon from database: %@",error);
    }else if ([fetchedObjects count] == 0) {
        pokemon = [NSEntityDescription insertNewObjectForEntityForName:kPokemonsEntityName inManagedObjectContext:context];
    }else {
        pokemon = [fetchedObjects firstObject];
    }
    
    return [pokemon editPokemonWithPokemonInfo:pokemonInfo];
}

-(Pokemons *)editPokemonWithPokemonInfo:(NSDictionary *)pokemonInfo {
    
    self.national_id = pokemonInfo[kPokemonsIDKey];
    self.resource_uri = pokemonInfo[kPokemonsResourceUriKey];
    self.name = pokemonInfo[kPokemonsNameKey];
    self.male_female_ratio = pokemonInfo[kPokemonsMaleFemaleRatioKey];
    if ([pokemonInfo valueForKey:kPokemonsSpritesKey]) {
        Sprites *sprite = [Sprites spriteWithSpriteInfo:[pokemonInfo[kPokemonsSpritesKey] firstObject] inManagedObjectContext:[self managedObjectContext]];
        self.pokemons_sprites = sprite;
    }
    
    return self;
    
}

+(NSFetchedResultsController *)listPokemonsWithPredicate:(NSPredicate *)predicate inManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:kPokemonsEntityName];
    [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"resource_uri" ascending:YES]]];
    request.predicate = predicate;
    NSError *error;
    NSFetchedResultsController *matches = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    if (!matches){
        NSLog(@"Matches: %@",matches);
    }else {
        [matches performFetch:&error];
    }
    return matches;

}

+(NSFetchedResultsController *)listPokemonsWithPokemonsListInfo:(NSDictionary *)pokemonsListInfo inManagedObjectContext:(NSManagedObjectContext *)context {
    NSMutableArray *IDList = [[NSMutableArray alloc] init];
    for (NSDictionary *pokemonInfo in pokemonsListInfo[kPokemonsPokemonInfoKey]) {
        [IDList addObject:[Pokemons pokemonWithPokemonInfo:pokemonInfo inManagedObjectContext:context].resource_uri];
    }
    [Pokemons removePokemonsNotInIDList:IDList inManagedObjectContext:context];
    
    
    return [Pokemons listPokemonsWithPredicate:nil inManagedObjectContext:context];
}

+(void)removePokemonsNotInIDList:(NSArray *)IDList inManagedObjectContext:(NSManagedObjectContext *)context {
    NSPredicate *p = [NSPredicate predicateWithFormat:@"NOT resource_uri IN %@",IDList];
    NSArray *pokemonsNotInList = [[Pokemons listPokemonsWithPredicate:p inManagedObjectContext:context] fetchedObjects];
    for (Pokemons *pokemon in pokemonsNotInList) {
        [context deleteObject:pokemon];
    }
}


@end
