//
//  BOXMetadataUpdateRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

@interface BOXMetadataUpdateRequest : BOXRequest

@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;
@property (nonatomic, readwrite, strong) NSArray *updateInfo;

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo;
- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo;
- (void)performRequestWithCompletion:(BOXMetadataBlock)completionBlock;

@end
