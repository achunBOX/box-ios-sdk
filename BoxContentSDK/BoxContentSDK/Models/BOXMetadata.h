//
//  BOXMetadata.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

@interface BOXMetadata : BOXModel

@property (nonatomic, readwrite, strong) NSString *parent;
@property (nonatomic, readwrite, strong) NSString *template;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSDictionary *info;

- (instancetype)initWithJSON:(NSDictionary *)JSONData;

@end
