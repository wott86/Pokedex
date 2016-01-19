//
//  DetailsViewController.m
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Constants.h"
#import "Pokemon.h"
#import "Sprite.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *sprite;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nationalIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *maleFemaleRatioLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updatePokemonDetails:nil];
    if (![_pokemon.downloaded boolValue]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePokemonDetails:) name:kPokemonDetailsDonwloaded object:_pokemon.objectID];
        [Pokemon getPokemon:_pokemon];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updatePokemonDetails:(NSNotification *)notification {
    if (_pokemon.pokemons_sprites && ![_pokemon.pokemons_sprites.downloaded boolValue]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePokemonDetails:) name:kSpriteDetailsDonwloaded object:_pokemon.pokemons_sprites.objectID];
        [Sprite getSprite:_pokemon.pokemons_sprites];
    }else if (_pokemon.pokemons_sprites) {
        [self updateSprite:nil];
    }
    
    _nameLabel.text = [NSString stringWithFormat:@"Name: %@",_pokemon.name];
    
    _nationalIDLabel.text = [NSString stringWithFormat:@"National ID: %@",_pokemon.national_id];
    
    _maleFemaleRatioLabel.text = [NSString stringWithFormat:@"Male Female Ratio: %@",_pokemon.male_female_ratio];
    
}

-(void)updateSprite:(NSNotification *)notification {
    NSURL *spriteURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseURL,_pokemon.pokemons_sprites.image]];
    [_sprite setImageWithURL:spriteURL];
}

@end
