//
//  BOXMetadataTask.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOXMetadataTask : NSObject

@property (nonatomic, readwrite, strong) NSString *path;
@property (nonatomic, readwrite, strong) NSString *value;

- (instancetype)initWithPath:(NSString *)path value:(NSString *)value;
- (instancetype)initWithPath:(NSString *)path value:(NSString *)value validation:(BOOL)validate;

@end
