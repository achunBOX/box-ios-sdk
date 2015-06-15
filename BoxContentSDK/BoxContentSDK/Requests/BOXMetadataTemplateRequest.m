//
//  BOXMetadataTemplateRequest.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/15/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataTemplateRequest.h"
#import "BOXRequest+Metadata.h"

@interface BOXMetadataTemplateRequest ()

@property (nonatomic, readwrite, strong) NSString *scope;
@property (nonatomic, readwrite, strong) NSString *template;

@end

@implementation BOXMetadataTemplateRequest

- (instancetype)init
{
    return [self initWithScope:BOXAPIScopeEnterprise];
}

- (instancetype)initWithScope:(NSString *)scope
{
    if (self = [super init]) {
        self.scope = scope;
    }
    
    return self;
}

- (instancetype)initWithScope:(NSString *)scope template:(NSString *)template
{
    if (self = [self initWithScope:scope]) {
        self.template = template;
    }
    
    return self;
}

- (BOXAPIOperation *)createOperation
{
    NSURL *URL = [self URLWithResource:BOXAPIResourceMetadataTemplates
                                    ID:nil
                           subresource:nil
                                 scope:BOXAPIScopeEnterprise
                              template:self.template];
    
    NSDictionary *queryParameters = nil;
    
    BOXAPIJSONOperation *JSONOperation = [self JSONOperationWithURL:URL
                                                         HTTPMethod:BOXAPIHTTPMethodGET
                                              queryStringParameters:queryParameters
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

- (void)performRequestWithCompletion:(BOXMetadataTemplateBlock)completionBlock
{
    BOOL isMainThread = [NSThread isMainThread];
    BOXAPIJSONOperation *metadataOperation = (BOXAPIJSONOperation *)self.operation;
    
    if (completionBlock) {
        metadataOperation.success = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSONDictionary) {
            NSLog(@"SUCCESS!");
            [BOXDispatchHelper callCompletionBlock:^{
                NSMutableArray *metadataTemplates = [[NSMutableArray alloc]init];
                NSArray *entries = JSONDictionary[@"entries"];
                if (entries) {
                    for (NSDictionary *currTemplate in entries) {
                        BOXMetadataTemplate *template = [[BOXMetadataTemplate alloc]initWithJSON:currTemplate];
                        [metadataTemplates addObject:template];
                    }
                    completionBlock(metadataTemplates, nil);
                } else {
                    BOXMetadataTemplate *template = [[BOXMetadataTemplate alloc]initWithJSON:JSONDictionary];
                    completionBlock(@[template], nil);
                }
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
