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

- (BOXMetadataRequest *)metadataAllInfoWithFileID:(NSString *)fileID
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:fileID scope:nil template:nil];
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

- (BOXMetadataCreateRequest *)metadataCreateWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info;
{
    BOXMetadataCreateRequest *request = [[BOXMetadataCreateRequest alloc]initWithFileID:fileID template:template info:info];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataCreateRequest *)metadataCreateWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info
{
    BOXMetadataCreateRequest *request = [[BOXMetadataCreateRequest alloc]initWithFileID:fileID scope:scope template:template info:info];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataUpdateRequest *)metadataUpdateWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo
{
    BOXMetadataUpdateRequest *request = [[BOXMetadataUpdateRequest alloc]initWithFileID:fileID template:template updateInfo:updateInfo];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataUpdateRequest *)metadataUpdateWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo
{
    BOXMetadataUpdateRequest *request = [[BOXMetadataUpdateRequest alloc]initWithFileID:fileID scope:scope template:template updateInfo:updateInfo];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataTemplateRequest *)metadataTemplates
{
    BOXMetadataTemplateRequest *request = [[BOXMetadataTemplateRequest alloc]init];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataTemplateRequest *)metadataTemplatesWithScope:(NSString *)scope
{
    BOXMetadataTemplateRequest *request = [[BOXMetadataTemplateRequest alloc]initWithScope:scope];
    [self prepareRequest:request];
    
    return request;
}

- (BOXMetadataTemplateRequest *)metadataTemplateWithScope:(NSString *)scope template:(NSString *)template
{
    BOXMetadataTemplateRequest *request = [[BOXMetadataTemplateRequest alloc]initWithScope:scope template:template];
    [self prepareRequest:request];
    
    return request;
}

@end
