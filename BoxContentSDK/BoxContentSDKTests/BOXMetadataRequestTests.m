//
//  BOXMetadataRequestTests.m
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/16/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXRequestTestCase.h"
#import "BOXUserRequest.h"
#import "NSURL+BOXURLHelper.h"
#import "BOXMetadataRequest.h"
#import "BOXRequest+Metadata.h"

@interface BOXMetadataRequestTests : BOXRequestTestCase
@end

@implementation BOXMetadataRequestTests

- (void)test_that_basic_metadata_request_has_expected_URLRequest
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:@"31850566363" scope:BOXAPIScopeEnterprise template:@"productSpecs"];
    NSURLRequest *URLRequest = request.urlRequest;
    
    NSURL *expectedURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/files/31850566363/metadata/enterprise/productSpecs", BOXAPIBaseURL, BOXAPIVersion]];
    
    XCTAssertEqualObjects(expectedURL, URLRequest.URL);
    XCTAssertEqualObjects(@"GET", URLRequest.HTTPMethod);
}

- (void)test_that_multiple_metadatas_requested_is_detected_and_request_has_expected_URLRequest
{
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:@"31850566363" scope:nil template:nil];
    NSURLRequest *URLRequest = request.urlRequest;
    
    NSURL *expectedURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/files/31850566363/metadata", BOXAPIBaseURL, BOXAPIVersion]];
    XCTAssertEqualObjects(expectedURL, URLRequest.URL);
    XCTAssertEqualObjects(@"GET", URLRequest.HTTPMethod);
}

- (void)test_that_multiple_metadata_templates_requested_is_detected_and_request_has_expected_URLRequest
{
    BOXMetadataTemplateRequest *request = [[BOXMetadataTemplateRequest alloc]initWithScope:BOXAPIScopeEnterprise template:@"productSpecs"];
    NSURLRequest *URLRequest = request.urlRequest;
    
    NSURL *expectedURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/metadata_templates/enterprise/productSpecs/schema", BOXAPIBaseURL, BOXAPIVersion]];
    XCTAssertEqualObjects(expectedURL, URLRequest.URL);
    XCTAssertEqualObjects(@"GET", URLRequest.HTTPMethod);
}

- (void)test_that_basic_metadata_template_request_has_expected_URLRequest
{
    BOXMetadataTemplateRequest *request = [[BOXMetadataTemplateRequest alloc]initWithScope:BOXAPIScopeEnterprise];
    NSURLRequest *URLRequest = request.urlRequest;
    
    NSURL *expectedURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/metadata_templates/enterprise", BOXAPIBaseURL, BOXAPIVersion]];
    XCTAssertEqualObjects(expectedURL, URLRequest.URL);
    XCTAssertEqualObjects(@"GET", URLRequest.HTTPMethod);
}

- (void)test_that_expected_metadata_is_returned_when_request_is_performed
{
    NSData *cannedResponseData = [self cannedResponseDataWithName:@"enterprise_metadata"];
    NSHTTPURLResponse *URLResponse = [self cannedURLResponseWithStatusCode:200 responseData:cannedResponseData];
    
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:cannedResponseData options:kNilOptions error:nil];
    NSArray *expectedMetadatas = @[[[BOXMetadata alloc]initWithJSON:JSONDictionary]];
    
    BOXMetadataRequest *request = [[BOXMetadataRequest alloc]initWithFileID:@"6122548033" scope:BOXAPIScopeEnterprise template:@"marketingCollateral"];
    [self setCannedURLResponse:URLResponse cannedResponseData:cannedResponseData forRequest:request];
    XCTestExpectation *expectation = [self expectationWithDescription:@"expectation"];
    [request performRequestWithCompletion:^(NSArray *metadatas, NSError *error) {
        for (NSInteger i = 0; i < expectedMetadatas.count; ++i) {
            [self assertModel:expectedMetadatas[i] isEquivalentTo:metadatas[i]];
        }
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.00 handler:nil];
}

- (void)test_that_metadata_is_created_when_request_is_performed
{
    NSData *cannedResponseData = [self cannedResponseDataWithName:@"enterprise_metadata"];
    NSHTTPURLResponse *URLResponse = [self cannedURLResponseWithStatusCode:200 responseData:cannedResponseData];
    
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:cannedResponseData options:kNilOptions error:nil];
    BOXMetadata *expectedMetadata = [[BOXMetadata alloc]initWithJSON:JSONDictionary];
    
    NSArray *infoArray = @[[[BOXMetadataTask alloc]initWithPath:@"audience" value:@"external"],
                           [[BOXMetadataTask alloc]initWithPath:@"vertical" value:@"healthcare"],
                           [[BOXMetadataTask alloc]initWithPath:@"documentType" value:@"datasheet"],
                           [[BOXMetadataTask alloc]initWithPath:@"status" value:@"active"]];
    BOXMetadataCreateRequest *request = [[BOXMetadataCreateRequest alloc]initWithFileID:@"6122548033" scope:BOXAPIScopeEnterprise template:@"marketingCollateral" info:infoArray];
    [self setCannedURLResponse:URLResponse cannedResponseData:cannedResponseData forRequest:request];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"expectation"];
    [request performRequestWithCompletion:^(BOXMetadata *metadata, NSError *error) {
        [self assertModel:expectedMetadata isEquivalentTo:metadata];
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.0 handler:nil];
}

- (void)test_that_metadata_is_deleted_when_request_is_performed
{
    NSHTTPURLResponse *URLResponse = [self cannedURLResponseWithStatusCode:204 responseData:nil];
    
    BOXMetadataDeleteRequest *request = [[BOXMetadataDeleteRequest alloc]initWithFileID:@"6122548033" scope:BOXAPIScopeEnterprise template:@"marketingCollateral"];
    [self setCannedURLResponse:URLResponse cannedResponseData:nil forRequest:request];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"expectation"];
    [request performRequestWithCompletion:^(NSError *error) {
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.0 handler:nil];
}

- (void)test_that_metadata_is_updated_when_request_is_performed
{
    NSData *cannedResponseData = [self cannedResponseDataWithName:@"updated_enterprise_metadata"];
    NSHTTPURLResponse *URLResponse = [self cannedURLResponseWithStatusCode:200 responseData:cannedResponseData];
    
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:cannedResponseData options:kNilOptions error:nil];
    BOXMetadata *expectedMetadata = [[BOXMetadata alloc]initWithJSON:JSONDictionary];
    
    NSArray *updateInfo = @[[[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateTEST path:@"/audience" value:@"external"],
                            [[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateREPLACE path:@"/audience" value:@"internal"],
                            [[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateTEST path:@"/status" value:@"active"],
                            [[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateREMOVE path:@"/status" value:nil],
                            [[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateADD path:@"competitiveDocument" value:@"yes"]];
    BOXMetadataCreateRequest *request = [[BOXMetadataCreateRequest alloc]initWithFileID:@"6122548033" scope:BOXAPIScopeEnterprise template:@"marketingCollateral" info:updateInfo];
    [self setCannedURLResponse:URLResponse cannedResponseData:cannedResponseData forRequest:request];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"expectation"];
    [request performRequestWithCompletion:^(BOXMetadata *metadata, NSError *error) {
        [self assertModel:expectedMetadata isEquivalentTo:metadata];
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.0 handler:nil];
}

- (void)test_metadata_update_task_value_cannot_be_nil_with_add_ops_when_using_validation
{
    XCTAssertThrows([[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateADD path:@"audience" value:nil validation:YES]);
}

- (void)test_metadata_update_task_value_cannot_be_nil_with_replace_ops_when_using_validation
{
    XCTAssertThrows([[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateREPLACE path:@"audience" value:nil validation:YES]);
}

- (void)test_metadata_task_key_and_value_cannot_be_nil_when_using_validation
{
    XCTAssertThrows([[BOXMetadataTask alloc]initWithPath:nil value:@"developer" validation:YES]);
    XCTAssertThrows([[BOXMetadataTask alloc]initWithPath:@"audience" value:nil validation:YES]);
}

- (void)test_metadata_update_task_ops_path_cannot_be_nil
{
    XCTAssertThrows([[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateREMOVE path:nil value:@"developer" validation:YES]);
}

- (void)test_metadata_create_request_info_must_all_be_of_type_BOXMetadataTask
{
    NSObject *object = [[NSObject alloc]init];
    BOXMetadataTask *task = [[BOXMetadataTask alloc]initWithPath:@"audience" value:@"developer" validation:YES];
    NSArray *info = @[object, task];
    XCTAssertThrows([[BOXMetadataCreateRequest alloc]initWithFileID:@"6122548033" template:@"marketingCollateral" info:info]);
}

- (void)test_metadata_update_request_info_must_be_of_type_BOXMetadataUpdateTask
{
    NSObject *object = [[NSObject alloc]init];
    BOXMetadataUpdateTask *task = [[BOXMetadataUpdateTask alloc]initWithOperation:BOXMetadataUpdateADD path:@"audience" value:@"developer" validation:YES];
    NSArray *info = @[object, task];
    XCTAssertThrows([[BOXMetadataUpdateRequest alloc]initWithFileID:@"6122548033" template:@"marketingCollateral" updateInfo:info]);
}

@end