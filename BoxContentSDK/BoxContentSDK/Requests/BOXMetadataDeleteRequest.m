//
//  BOXMetadataDeleteRequest.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXRequest+Metadata.h"
#import "BOXMetadataDeleteRequest.h"

@interface BOXMetadataDeleteRequest ()

@property (nonatomic, readwrite, strong) NSString *fileID;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;

@end

@implementation BOXMetadataDeleteRequest

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template
{
    return [self initWithFileID:fileID scope:BOXAPIScopeEnterprise template:template];
}

- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template
{
    if (self = [super init]) {
        self.fileID = fileID;
        self.scope = scope;
        self.template = template;
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
    
    BOXAPIJSONOperation *JSONOperation = [self JSONOperationWithURL:URL
                                                         HTTPMethod:BOXAPIHTTPMethodDELETE
                                              queryStringParameters:nil
                                                     bodyDictionary:nil
                                                   JSONSuccessBlock:nil
                                                       failureBlock:nil];
    
    if ([self.notMatchingEtags count] > 0) {
        for (NSString *notMatchingEtags in self.notMatchingEtags) {
            [JSONOperation.APIRequest addValue:notMatchingEtags forHTTPHeaderField:BOXAPIHTTPHeaderIfNoneMatch];
        }
    }
    
    return JSONOperation;
}

- (void)performRequestWithCompletion:(BOXErrorBlock)completionBlock
{
    BOOL isMainThread = [NSThread isMainThread];
    BOXAPIJSONOperation *metadataOperation = (BOXAPIJSONOperation *)self.operation;
    
    if (completionBlock) {
        metadataOperation.success = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSONDictionary) {
            [BOXDispatchHelper callCompletionBlock:^{
                completionBlock(nil);
            } onMainThread:isMainThread];
        };
        
        metadataOperation.failure = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSDictionary *JSONDictionary) {
            [BOXDispatchHelper callCompletionBlock:^{
                completionBlock(error);
            } onMainThread:isMainThread];
        };
    }
    
    [self performRequest];
}

@end
