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

@interface BOXContentClient (Metadata)

- (BOXMetadataRequest *)metadataInfoWithFileID:(NSString *)fileID template:(NSString *)template;
- (BOXMetadataRequest *)metadataInfoWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template;

- (BOXMetadataDeleteRequest *)metadataDeleteWithFileID:(NSString *) fileID template:(NSString *)template;
- (BOXMetadataDeleteRequest *)metadataDeleteWithFileID:(NSString *) fileID scope:(NSString *)scope template:(NSString *)template;

- (BOXMetadataCreateRequest *)metadataCreateWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSDictionary *)info;

@end
