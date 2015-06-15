//
//  BOXMetadataUpdateRequest.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataUpdateRequest.h"
#import "BOXRequest+Metadata.h"
#import "BOXMetadataUpdateTask.h"

@interface BOXMetadataUpdateRequest ()

@property (nonatomic, readwrite, strong) NSString *fileID;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;
@property (nonatomic, readwrite, strong) NSArray *updateInfo;

@end

@implementation BOXMetadataUpdateRequest

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo
{
    return [self initWithFileID:fileID scope:BOXAPIScopeEnterprise template:template updateInfo:updateInfo];
}

- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo
{
    if (self = [super init]) {
        for (NSInteger i = 0; i < updateInfo.count; ++i) {
            BOXAssert([updateInfo[i] isKindOfClass:[BOXMetadataUpdateTask class]],
                      @"All entries in updateInfo must be of type BOXMetadataUpdateTask. updateInfo[%lu] is not of type BOXMetadataUpdateTask.", i);
        }
        
        self.fileID = fileID;
        self.scope = scope;
        self.template = template;
        self.updateInfo = updateInfo;
    }
    
    return self;
}

- (BOXAPIOperation *)createOperation
{
    NSURL *URL = [self URLWithResource:BOXAPIResourceFiles
                                    ID:self.fileID
                           subresource:BOXAPISubresourceMetadata
                                 scope:self.scope
                              template:self.template];
    
    NSDictionary *queryParameters = nil;
    
    NSMutableArray *bodyArray = [[NSMutableArray alloc]init];
    for (BOXMetadataUpdateTask *task in self.updateInfo) {
        NSString *instruction = [task BOXMetadataUpdateOpsToString:task.operation];
        NSString *path = task.path;
        NSString *value = task.value;
        NSMutableDictionary *taskDict = [[NSMutableDictionary alloc]init];
        
        if (instruction) {
            [taskDict setObject:instruction forKey:@"op"];
        }
        
        if (path) {
            [taskDict setObject:path forKey:@"path"];
        }
        
        if (value) {
            [taskDict setObject:value forKey:@"value"];
        }
        
        [bodyArray addObject:taskDict];
    }
    
    BOXAPIJSONPatchOperation *JSONPatchOperation = [self JSONPatchOperationWithURL:URL
                                                                        HTTPMethod:BOXAPIHTTPMethodPUT
                                                             queryStringParameters:queryParameters
                                                                         bodyArray:bodyArray
                                                                  JSONSuccessBlock:nil
                                                                      failureBlock:nil];
    
    if ([self.notMatchingEtags count] > 0) {
        for (NSString *notMatchingEtags in self.notMatchingEtags) {
            [JSONPatchOperation.APIRequest addValue:notMatchingEtags forHTTPHeaderField:BOXAPIHTTPHeaderIfNoneMatch];
        }
    }
    
    return JSONPatchOperation;
}

- (void)performRequestWithCompletion:(BOXMetadataBlock)completionBlock
{
    BOOL isMainThread = [NSThread isMainThread];
    BOXAPIJSONOperation *metadataOperation = (BOXAPIJSONOperation *)self.operation;
    
    if (completionBlock) {
        metadataOperation.success = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSONDictionary) {
            NSLog(@"SUCCESS!");
            [BOXDispatchHelper callCompletionBlock:^{
                BOXMetadata *metadata = [[BOXMetadata alloc]initWithJSON:JSONDictionary];
                completionBlock(metadata, nil);
            } onMainThread:isMainThread];
        };
        
        metadataOperation.failure = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSDictionary *JSONDictionary) {
            NSLog(@"FAILURE!");
            [BOXDispatchHelper callCompletionBlock:^{
                completionBlock(nil, error);
            } onMainThread:isMainThread];
        };
    }
    
    [self performRequest];
}

@end