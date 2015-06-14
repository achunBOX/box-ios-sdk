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

- (BOXMetadataRequest *)metadataInfoWithFileID:(NSString *)fileID template:(NSString *)template
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:fileID template:template];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataRequest *)metadataInfoWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:fileID scope:scope template:template];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataDeleteRequest *)metadataDeleteWithFileID:(NSString *)fileID template:(NSString *)template
{
    BOXMetadataDeleteRequest *request = [[BOXMetadataDeleteRequest alloc]initWithFileID:fileID template:template];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataDeleteRequest *)metadataDeleteWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template
{
    BOXMetadataDeleteRequest *request = [[BOXMetadataDeleteRequest alloc]initWithFileID:fileID scope:scope template:template];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataCreateRequest *)metadataCreateWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSDictionary *)info
{
    BOXMetadataCreateRequest *request = [[BOXMetadataCreateRequest alloc]initWithFileID:fileID scope:scope template:template info:info];
    [self prepareRequest:request];
    
    return request;
}

@end
