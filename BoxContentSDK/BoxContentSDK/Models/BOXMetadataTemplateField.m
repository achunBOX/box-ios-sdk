//
//  BOXMetadataTemplateField.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataTemplateField.h"

@implementation BOXMetadataTemplateField

- (instancetype)initWithJSON:(NSDictionary *)JSONData
{
    if (self = [super initWithJSON:JSONData]) {
        self.modelID = [NSJSONSerialization box_ensureObjectForKey:@"key"
                                                      inDictionary:JSONData
                                                   hasExpectedType:[NSString class]
                                                       nullAllowed:NO];
        self.type = [NSJSONSerialization box_ensureObjectForKey:@"type"
                                                   inDictionary:JSONData
                                                hasExpectedType:[NSString class]
                                                    nullAllowed:NO];
        self.displayName = [NSJSONSerialization box_ensureObjectForKey:@"displayName"
                                                          inDictionary:JSONData
                                                       hasExpectedType:[NSString class]
                                                           nullAllowed:NO];
        self.options = [NSJSONSerialization box_ensureObjectForKey:@"options"
                                                      inDictionary:JSONData
                                                   hasExpectedType:[NSArray class]
                                                       nullAllowed:YES];
        self.JSONData = JSONData;
    }
    
    return self;
}

@end
