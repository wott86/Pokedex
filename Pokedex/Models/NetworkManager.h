//
//  NetworkManager.h
//  Pokedex
//
//  Created by Cesar Vilera on 1/18/16.
//  Copyright © 2016 Cesar Vilera. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkManager : AFHTTPSessionManager

+(instancetype)sharedManager;

@end
