//
//  BOXContentClient+Metadata.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/12/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>
#import "BOXMetadataRequest.h"

@class BOXMetadataRequest;
@class BOXMetadataDeleteRequest;
@class BOXMetadataCreateRequest;
@class BOXMetadataUpdateRequest;
@class BOXMetadataTemplateRequest;

@interface BOXContentClient (Metadata)

- (BOXMetadataRequest *)metadataInfoRequestWithFileID:(NSString *)fileID template:(NSString *)template;
- (BOXMetadataRequest *)metadataInfoRequestWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template;
- (BOXMetadataRequest *)metadataAllInfoRequestWithFileID:(NSString *)fileID;

- (BOXMetadataDeleteRequest *)metadataDeleteRequestWithFileID:(NSString *) fileID template:(NSString *)template;
- (BOXMetadataDeleteRequest *)metadataDeleteRequestWithFileID:(NSString *) fileID scope:(NSString *)scope template:(NSString *)template;

- (BOXMetadataCreateRequest *)metadataCreateRequestWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info;
- (BOXMetadataCreateRequest *)metadataCreateRequestWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info;

- (BOXMetadataUpdateRequest *)metadataUpdateRequestWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo;
- (BOXMetadataUpdateRequest *)metadataUpdateRequestWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo;

- (BOXMetadataTemplateRequest *)metadataTemplatesInfoRequestWithScope:(NSString *)scope;
- (BOXMetadataTemplateRequest *)metadataTemplatesInfoRequest;

- (BOXMetadataTemplateRequest *)metadataTemplateInfoRequestWithScope:(NSString *)scope template:(NSString *)template;

@end
