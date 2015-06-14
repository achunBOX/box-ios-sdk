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

@interface BOXContentClient (Metadata)

- (BOXMetadataRequest *)metadataWithFileID:(NSString *)fileID template:(NSString *)template;

@end
