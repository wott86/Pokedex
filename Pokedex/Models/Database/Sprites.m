//
//  Sprites.m
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "Sprites.h"
#import "Pokemons.h"

@implementation Sprites

+(Sprites *)spriteWithSpriteInfo:(NSDictionary *)spriteInfo inManagedObjectContext:(NSManagedObjectContext *)context {
    Sprites *sprite = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kSpritesEntityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"resource_uri == %@", spriteInfo[kSpritesResourceURI]];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"resource_uri"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if ([fetchedObjects count] > 1 || error) {
        NSLog(@"Error fetching Sprite from database: %@",error);
    }else if ([fetchedObjects count] == 0) {
        sprite = [NSEntityDescription insertNewObjectForEntityForName:kSpritesEntityName inManagedObjectContext:context];
    }else {
        sprite = [fetchedObjects firstObject];
    }
    
    return [sprite editSpriteWithSpriteInfo:spriteInfo];
}

-(Sprites *)editSpriteWithSpriteInfo:(NSDictionary *)spriteInfo {
    self.resource_uri = spriteInfo[kSpritesResourceURI];
    self.image = spriteInfo[kSpritesImageKey];
    return self;
}

@end
