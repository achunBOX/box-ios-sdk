//
//  BOXMetadataUpdate.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BOXMetadataTask.h"

/**
 * ENUM that defines all possible operations available to the BOXMetadataUpdateTask class.
 */
typedef enum : NSUInteger {
    
    /**
     * Add Operation
     */
    BOXMetadataUpdateADD,
    
    /**
     * Replace Operation.
     */
    BOXMetadataUpdateREPLACE,
    
    /**
     * Remove Operation.
     */
    BOXMetadataUpdateREMOVE,
    
    /**
     * Test Operation.
     */
    BOXMetadataUpdateTEST
} BOXMetadataUpdateOps;

/**
 * BOXMetadataUpdateTask instances are used for updating metadata with @see BOXMetadataUpdateRequest.
 */
@interface BOXMetadataUpdateTask : BOXMetadataTask

/**
 * Operation that will be applied for this BOXMetadataUpdateTask instance.
 */
@property (nonatomic, readwrite, assign) BOXMetadataUpdateOps operation;

/**
 * Initializes a BOXMetadataUpdateTask with a given operation to apply to a key/value pair.
 *
 * @param operation The operation to apply.
 * @param path The path (aka. key) 
 * @param value The value for the path.
 *
 * @return A BOXMetadataUpdateTask with a given operation to apply to a key/value pair.
 */
- (instancetype)initWithOperation:(BOXMetadataUpdateOps)operation path:(NSString *)path value:(NSString *)value;

/**
 * Initializes a BOXMetadataUpdateTask with a given operation to apply to a key/value pair.
 *
 * @param operation The operation to apply.
 * @param path The path (aka. key).
 * @param value The value for the path.
 * @param validate Checks for invalid parameter values.
 *
 * @return A BOXMetadataUpdateTask with a given operation to apply to a key/value pair.
 */
- (instancetype)initWithOperation:(BOXMetadataUpdateOps)operation path:(NSString *)path value:(NSString *)value validation:(BOOL)validate;

/**
 * Converts a BOXMetadataUpdateOps ENUM value to a string.
 */
- (NSString *)BOXMetadataUpdateOpsToString:(BOXMetadataUpdateOps)operation;

@end