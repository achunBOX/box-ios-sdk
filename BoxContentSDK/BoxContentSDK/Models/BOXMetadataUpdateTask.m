//
//  BOXMetadataUpdate.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataUpdateTask.h"
#import "BOXLog.h"

@implementation BOXMetadataUpdateTask

- (instancetype)initWithOperation:(BOXMetadataUpdateOps)operation path:(NSString *)path value:(NSString *)value
{
    return [self initWithOperation:operation path:path value:value validation:YES];
}

- (instancetype)initWithOperation:(BOXMetadataUpdateOps)operation path:(NSString *)path value:(NSString *)value validation:(BOOL)validate
{
    if (self = [self initWithPath:path value:value validation:NO]) {
        NSString *formatString = @"/%@";
        if ([path characterAtIndex:0] == '/') {
            formatString = @"%@";
        }
        
        self.path = [NSString stringWithFormat:formatString, path];
        self.operation = operation;
        
        if (validate) {
            [self validate];
        }
    }
    
    return self;
}

- (void)validate
{
    BOXAssert([self BOXMetadataUpdateOpsToString:self.operation], @"The operation parameter for BOXMetadataUpdateTask cannot be nil");
    BOXAssert(self.path, @"The path parameter for BOXMetadataUpdateTask cannot be nil");
    BOXAssert(!(self.operation == BOXMetadataUpdateADD || self.operation == BOXMetadataUpdateREPLACE) || self.value, @"The value parameter cannot be nil when using BOXMetadataUpdateADD or BOXMetadataUpdateREPLACE.");
}

- (NSString *)BOXMetadataUpdateOpsToString:(BOXMetadataUpdateOps)operation
{
    switch (operation) {
        case BOXMetadataUpdateADD:
            return @"add";
        case BOXMetadataUpdateREMOVE:
            return @"remove";
        case BOXMetadataUpdateREPLACE:
            return @"replace";
        case BOXMetadataUpdateTEST:
            return @"test";
        default:
            BOXAssertFail(@"Unidentified BOXMetadataUpdateOps received. Please send in a valid BOXMetadataUpdateOps enum value");
    }
}

@end
