//
//  BOXMetadataRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/12/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

@interface BOXMetadataRequest : BOXRequestWithSharedLinkHeader

@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template;
- (void)performRequestWithCompletion:(BOXFileBlock)completionBlock;

@end
