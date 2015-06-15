//
//  BOXMetadataUpdate.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOXMetadataTask.h"

typedef enum : NSUInteger {
    BOXMetadataUpdateADD,
    BOXMetadataUpdateREPLACE,
    BOXMetadataUpdateREMOVE,
    BOXMetadataUpdateTEST
} BOXMetadataUpdateOps;

@interface BOXMetadataUpdateTask : BOXMetadataTask

@property (nonatomic, readwrite, assign) BOXMetadataUpdateOps operation;

- (instancetype)initWithOperation:(BOXMetadataUpdateOps)operation path:(NSString *)path value:(NSString *)value;
- (instancetype)initWithOperation:(BOXMetadataUpdateOps)operation path:(NSString *)path value:(NSString *)value validation:(BOOL)validate;
- (NSString *)BOXMetadataUpdateOpsToString:(BOXMetadataUpdateOps)operation;

@end