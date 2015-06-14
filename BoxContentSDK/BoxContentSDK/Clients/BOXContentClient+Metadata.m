//
//  BOXContentClient+Metadata.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/12/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXContentClient+Metadata.h"
#import "BOXMetadataRequest.h"

@implementation BOXContentClient (Metadata)

- (BOXMetadataRequest *)metadataWithFileID:(NSString *)fileID template:(NSString *)template
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:fileID template:template];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataRequest *)metadataWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:fileID scope:scope template:template];
    [self prepareRequest:request];
    
    return request;
}

@end
