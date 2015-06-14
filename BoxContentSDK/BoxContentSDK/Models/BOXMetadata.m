//
//  BOXMetadata.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadata.h"

@implementation BOXMetadata

- (instancetype)initWithJSON:(NSDictionary *)JSONData
{
    if (self = [super initWithJSON:JSONData]) {
        self.JSONData = JSONData;
        
        self.modelID = [NSJSONSerialization box_ensureObjectForKey:@"$id"
                                                      inDictionary:JSONData
                                                   hasExpectedType:[NSString class]
                                                       nullAllowed:NO
                                                 suppressNullAsNil:NO];
        
        self.type = [NSJSONSerialization box_ensureObjectForKey:@"$type"
                                                   inDictionary:JSONData
                                                hasExpectedType:[NSString class]
                                                    nullAllowed:NO
                                              suppressNullAsNil:NO];
        
        self.scope = [NSJSONSerialization box_ensureObjectForKey:@"$scope"
                                                    inDictionary:JSONData
                                                 hasExpectedType:[NSString class]
                                                     nullAllowed:NO];
        
        self.template = [NSJSONSerialization box_ensureObjectForKey:@"$template"
                                                       inDictionary:JSONData
                                                    hasExpectedType:[NSString class]
                                                        nullAllowed:NO];
        
        self.parent = [NSJSONSerialization box_ensureObjectForKey:@"$parent"
                                                     inDictionary:JSONData
                                                  hasExpectedType:[NSString class]
                                                      nullAllowed:NO];
        self.type = [NSJSONSerialization box_ensureObjectForKey:@"$type"
                                                   inDictionary:JSONData
                                                hasExpectedType:[NSString class]
                                                    nullAllowed:NO];
        
        NSMutableDictionary *info = [[NSMutableDictionary alloc]init];
        for (NSString *key in JSONData) {
            NSString *value = [NSJSONSerialization box_ensureObjectForKey:key
                                                             inDictionary:JSONData
                                                          hasExpectedType:[NSString class]
                                                              nullAllowed:NO];
            if ([key characterAtIndex:0] != '$') {
                [info setObject:value forKey:key];
            }
        }
        self.info = info;
    }
    
    return self;
}

@end
