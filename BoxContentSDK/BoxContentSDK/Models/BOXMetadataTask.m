//
//  BOXMetadataTask.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataTask.h"
#import "BOXLog.h"

@implementation BOXMetadataTask

- (instancetype)initWithPath:(NSString *)path value:(NSString *)value
{
    return [self initWithPath:path value:value validation:YES];
}

- (instancetype)initWithPath:(NSString *)path value:(NSString *)value validation:(BOOL)validate
{
    if (self = [self init]) {
        self.path = path;
        self.value = value;
        
        if (validate) {
            [self validate];
        }
    }
    
    return self;
}

- (void)validate
{
    BOXAssert(self.path, @"Key cannot be nil when initializing an instance of BOXMetadataTask");
    BOXAssert(self.value, @"Value cannot be nil when initializing an instance of BOXMetadataTask");
}

@end