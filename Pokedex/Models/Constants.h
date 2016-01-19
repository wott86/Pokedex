//
//  Constants.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDetailsSegueIdentifier @"detailsSegue"

#define kPokemonDetailsDonwloaded @"pokemonDetailsDownloaded"

#define kSpriteDetailsDonwloaded @"spriteDetailsDownloaded"

//The baseURL should be in a settings file, that can be downloaded in case of any changes.
#define kBaseURL @"http://pokeapi.co/"

@interface Constants : NSObject

@end
