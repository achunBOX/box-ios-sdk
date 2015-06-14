//
//  BOXMetadataRequest.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/12/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXMetadataRequest.h"

@interface BOXMetadataRequest ()

@property (nonatomic, readwrite, strong) NSString *fileID;
@property (nonatomic, readwrite, strong) NSString *template;

@end

@implementation BOXMetadataRequest

- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template
{
    if (self = [super init]) {
        self.fileID = fileID;
    }
    
    return self;
}

- (BOXAPIOperation *)createOperation
{
    NSURL *URL = [self URLWithResource:BOXAPIResourceFiles ID:self.fileID subresource:BOXAPISubresourceMetadata scope:BOXAPIScopeEnterprise template:self.template];
    
//    NSDictionary *queryParameters = nil; //Are there query parameters for metadata?
    
    BOXAPIJSONOperation *JSONOperation = [self JSONOperationWithURL:URL
                                                         HTTPMethod:BOXAPIHTTPMethodGET
                                              queryStringParameters:nil
                                                     bodyDictionary:nil
                                                   JSONSuccessBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSONDictionary) {
                                                        NSLog(@"It worked yay!");
                                                    }
                                                       failureBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSDictionary *JSONDictionary) {
                                                        NSLog(@"It filed no!");
                                                        NSLog(@"ERROR: %@", error.description);
                                                    }];
    
//    if ([self.notMatchingEtags count] > 0) {
//        for (NSString *notMatchingEtags in self.notMatchingEtags) {
//            [JSONOperation.APIRequest addValue:notMatchingEtags forHTTPHeaderField:BOXAPIHTTPHeaderIfNoneMatch];
//        }
//    }
    
    [self addSharedLinkHeaderToRequest:JSONOperation.APIRequest];
    
    return JSONOperation;
}

- (NSURL *)URLWithResource:(NSString *)resource
                        ID:(NSString *)ID
               subresource:(NSString *)subresource
                     scope:(NSString *)scope
                  template:(NSString *)template
{
    return [self URLWithBaseURL:BOXAPIBaseURL
                     APIVersion:BOXAPIVersion
                       resource:resource
                             ID:ID
                    subresource:subresource
                          scope:scope
                       template:template];
}

- (NSURL *)URLWithBaseURL:(NSString *)baseURL
               APIVersion:(NSString *)APIVersion
                 resource:(NSString *)resource
                       ID:(NSString *)ID
              subresource:(NSString *)subresource
                    scope:(NSString *)scope
                 template:(NSString *)template
{
    NSString *formatString = @"/%@";
    if ([baseURL hasSuffix:@"/"]) {
        formatString = @"%@";
    }
    
    NSString *URLString = [baseURL stringByAppendingFormat:formatString, APIVersion];
    if (resource) {
        URLString = [URLString stringByAppendingFormat:@"/%@", resource];
        if (ID) {
            URLString = [URLString stringByAppendingFormat:@"/%@", ID];
        }
        if (subresource) {
            URLString = [URLString stringByAppendingFormat:@"/%@", subresource];
        }
        if (scope) {
            URLString = [URLString stringByAppendingFormat:@"/%@", scope];
            if (template) {
                URLString = [URLString stringByAppendingFormat:@"/%@", template];
            }
        }
    }
    
    return [[NSURL alloc]initWithString:URLString];
}

- (void)performRequestWithCompletion:(BOXFileBlock)completionBlock
{
    BOOL isMainThread = [NSThread isMainThread];
    BOXAPIJSONOperation *metadataOperation = (BOXAPIJSONOperation *)self.operation;
    
    if (completionBlock) {
        metadataOperation.success = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSONDictoinary) {
            NSLog(@"SUCCESS!");
        };
        
        metadataOperation.failure = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSDictionary *JSONDictionary) {
            NSLog(@"FAILURE!");
        };
    }
    
    [self performRequest];
}

@end