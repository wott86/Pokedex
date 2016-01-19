//
//  Sprite.m
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "Sprite.h"
#import "NetworkManager.h"
#import "AppDelegate.h"
#import "Constants.h"

@implementation Sprite

+(void)getSprite:(Sprites *)sprite {
    if (!sprite.resource_uri) return;
    [[NetworkManager sharedManager] GET:sprite.resource_uri parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [sprite editSpriteWithSpriteInfo:responseObject];
        sprite.downloaded = @YES;
        [[AppDelegate getAppDelegate] saveContext];
        [[NSNotificationCenter defaultCenter] postNotificationName:kSpriteDetailsDonwloaded object:sprite.objectID];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
