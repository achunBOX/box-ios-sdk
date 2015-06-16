//
//  BOXMetadataTemplateRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BoxContentSDK/BOXContentSDK.h>

@interface BOXMetadataTemplateRequest : BOXRequest

@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;

- (instancetype)initWithScope:(NSString *)scope template:(NSString *)template;
- (instancetype)initWithScope:(NSString *)scope;
- (instancetype)init;
- (void)performRequestWithCompletion:(BOXMetadataTemplatesBlock)completionBlock;

@end
