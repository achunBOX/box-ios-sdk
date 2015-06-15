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

- (BOXMetadataRequest *)metadataInfoWithFileID:(NSString *)fileID template:(NSString *)template;
- (BOXMetadataRequest *)metadataInfoWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template;
- (BOXMetadataRequest *)metadataAllInfoWithFileID:(NSString *)fileID;

- (BOXMetadataDeleteRequest *)metadataDeleteWithFileID:(NSString *) fileID template:(NSString *)template;
- (BOXMetadataDeleteRequest *)metadataDeleteWithFileID:(NSString *) fileID scope:(NSString *)scope template:(NSString *)template;

- (BOXMetadataCreateRequest *)metadataCreateWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info;
- (BOXMetadataCreateRequest *)metadataCreateWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info;

- (BOXMetadataUpdateRequest *)metadataUpdateWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo;
- (BOXMetadataUpdateRequest *)metadataUpdateWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo;

- (BOXMetadataTemplateRequest *)metadataTemplatesWithScope:(NSString *)scope;
- (BOXMetadataTemplateRequest *)metadataTemplates;

- (BOXMetadataTemplateRequest *)metadataTemplateWithScope:(NSString *)scope template:(NSString *)template;

@end
