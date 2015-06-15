//
//  BOXMetadataCreateRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

@interface BOXMetadataCreateRequest : BOXRequest

@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info;
- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info;

- (void)performRequestWithCompletion:(BOXMetadataBlock)completionBlock;

@end