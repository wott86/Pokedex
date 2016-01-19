//
//  NetworkManager.m
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "NetworkManager.h"
#import "Constants.h"

@implementation NetworkManager

+(instancetype)sharedManager {
    
    static NetworkManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *URL = [NSURL URLWithString:kBaseURL];
        
        // Initialize the session
        _sharedInstance = [[NetworkManager alloc] initWithBaseURL:URL];
        
        //Setup response and request serializers.
        [_sharedInstance setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [_sharedInstance setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
    });
    return _sharedInstance;
}

@end
