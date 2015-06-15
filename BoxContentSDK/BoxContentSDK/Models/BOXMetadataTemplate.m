//
//  BOXMetadataTemplate.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataTemplate.h"
#import "BoxISO8601DateFormatter.h"

@implementation BOXMetadataTemplate

- (instancetype)initWithJSON:(NSDictionary *)JSONData
{
    if (self = [super initWithJSON:JSONData]) {
        self.modelID = [NSJSONSerialization box_ensureObjectForKey:@"templateKey"
                                                      inDictionary:JSONData
                                                   hasExpectedType:[NSString class]
                                                       nullAllowed:NO];
        self.scope = [NSJSONSerialization box_ensureObjectForKey:@"scope"
                                                    inDictionary:JSONData
                                                 hasExpectedType:[NSString class]
                                                     nullAllowed:NO];
        self.displayName = [NSJSONSerialization box_ensureObjectForKey:@"displayName"
                                                          inDictionary:JSONData
                                                       hasExpectedType:[NSString class]
                                                           nullAllowed:NO];
        NSMutableArray *fields = [[NSMutableArray alloc]init];
        for (NSDictionary *field in [NSJSONSerialization box_ensureObjectForKey:@"fields"
                                                                   inDictionary:JSONData
                                                                hasExpectedType:[NSArray class]
                                                                    nullAllowed:NO]) {
            BOXMetadataTemplateField *templateField = [[BOXMetadataTemplateField alloc]initWithJSON:field];
            [fields addObject:templateField];
        }
        self.fields = fields;
        self.JSONData = JSONData;
    }
    
    return self;
}

@end
