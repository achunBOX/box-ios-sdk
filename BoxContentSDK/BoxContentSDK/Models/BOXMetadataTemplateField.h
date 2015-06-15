//
//  BOXMetadataTemplateField.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

@interface BOXMetadataTemplateField : BOXModel

@property (nonatomic, readwrite, strong) NSString *displayName;
@property (nonatomic, readwrite, strong) NSArray *options;

@end
