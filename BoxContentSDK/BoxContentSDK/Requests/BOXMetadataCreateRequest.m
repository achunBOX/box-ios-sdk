//
//  BOXMetadataCreateRequest.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataCreateRequest.h"
#import "BOXRequest+Metadata.h"

@interface BOXMetadataCreateRequest ()

@property (nonatomic, readwrite, strong) NSString *fileID;
@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;
@property (nonatomic, readwrite, strong) NSArray *info;

@end

@implementation BOXMetadataCreateRequest

- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info
{
    if (self = [super init]) {
        for (NSInteger i = 0; i < info.count; ++i) {
            BOXAssert([info[i] isKindOfClass:[BOXMetadataTask class]],
                      @"All entries in info must be of type BOXMetadataTask. info[%lu] is not of type BOXMetadataTask.", i);
        }
        
        self.fileID = fileID;
        self.scope = scope;
        self.template = template;
        self.info = info;
    }
    
    return self;
}

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info
{
    return [self initWithFileID:fileID scope:BOXAPIScopeEnterprise template:template info:info];
}

- (BOXAPIOperation *)createOperation
{
    NSURL *URL = [self URLWithResource:BOXAPIResourceFiles
                                    ID:self.fileID
                           subresource:BOXAPISubresourceMetadata
                                 scope:self.scope
                              template:self.template];
    
    NSDictionary *queryParameters = nil;
    
    NSMutableDictionary *bodyDictionary = [[NSMutableDictionary alloc]init];
    for (BOXMetadataTask *task in self.info) {
        NSString *key = task.path;
        NSString *value = task.value;
        
        if (key && value) {
            [bodyDictionary setObject:value forKey:key];
        }
    }
    
    BOXAPIJSONOperation *JSONOperation = [self JSONOperationWithURL:URL
                                                         HTTPMethod:BOXAPIHTTPMethodPOST
                                              queryStringParameters:queryParameters
                                                     bodyDictionary:bodyDictionary
                                                   JSONSuccessBlock:nil
                                                       failureBlock:nil];
    
    if ([self.notMatchingEtags count] > 0) {
        for (NSString *notMatchingEtags in self.notMatchingEtags) {
            [JSONOperation.APIRequest addValue:notMatchingEtags forHTTPHeaderField:BOXAPIHTTPHeaderIfNoneMatch];
        }
    }
    
    return JSONOperation;
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
