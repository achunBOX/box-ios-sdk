//
//  BOXMetadataRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/12/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BOXContentSDK.h>
#import "BOXRequest.h"

@interface BOXMetadataRequest : BOXRequest

@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;
@property (nonatomic, readwrite, strong) NSString *template;
@property (nonatomic, readwrite, strong) NSString *scope;

- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template;
- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template;
- (void)performRequestWithCompletion:(BOXMetadatasBlock)completionBlock;

@end
