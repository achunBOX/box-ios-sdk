//
//  BOXMetadataDeleteRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BOXContentSDK.h>

@interface BOXMetadataDeleteRequest : BOXRequest

@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template;
- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template;

- (void)performRequestWithCompletion:(BOXErrorBlock)completionBlock;

@end
