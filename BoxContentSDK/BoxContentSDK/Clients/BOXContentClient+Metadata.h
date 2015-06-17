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
@class BOXMetadataDeleteRequest;
@class BOXMetadataCreateRequest;
@class BOXMetadataUpdateRequest;
@class BOXMetadataTemplateRequest;

/**
 * BOXContentClient category that provides convenience methods to setup metadata requests.
 *
 * For more information @see BOXMetadataRequest, BOXMetadataDeleteRequest, BOXMetadataCreateRequest, 
 *                           BOXMetadataUpdateRequest, BOXMetadataTemplateRequest
 */
@interface BOXContentClient (Metadata)

/**
 * Generate a request to retrieve metadata information about a file.
 *
 * **NOTE** Defaults the scope property to @see BOXAPIScopeEnterprise.
 *
 * @param fileID File ID.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataRequest *)metadataInfoRequestWithFileID:(NSString *)fileID template:(NSString *)template;

/**
 * Generate a request to retrieve metadata information about a file.
 *
 * @param fileID File ID.
 * @param scope Scope to see which templates are available.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataRequest *)metadataInfoRequestWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template;

/**
 * Generate a request to retrieve all metadata information about a file.
 *
 * @param fileID File ID.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataRequest *)metadataAllInfoRequestWithFileID:(NSString *)fileID;

/**
 * Generate a request to delete metadata information about a file.
 *
 * **NOTE** Defaults the scope property to @see BOXAPIScopeEnterprise.
 *
 * @param fileID File ID.
 * @param template Template information that should be deleted.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataDeleteRequest *)metadataDeleteRequestWithFileID:(NSString *) fileID template:(NSString *)template;

/**
 * Generate a request to delete metadata information about a file.
 *
 * @param fileID File ID.
 * @param scope Scope to see which templates are available.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataDeleteRequest *)metadataDeleteRequestWithFileID:(NSString *) fileID scope:(NSString *)scope template:(NSString *)template;

/**
 * Generate a request to create metadata information for a file.
 *
 * **NOTE** Defaults the scope property to @see BOXAPIScopeEnterprise.
 *
 * @param fileID File ID.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataCreateRequest *)metadataCreateRequestWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info;

/**
 * Generate a request to create metadata information for a file.
 *
 * @param fileID File ID.
 * @param scope Scope to see which templates are available.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataCreateRequest *)metadataCreateRequestWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info;

/**
 * Generate a request to update metadata information about a file.
 *
 * **NOTE** Defaults the scope property to @see BOXAPIScopeEnterprise.
 *
 * @param fileID File ID.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataUpdateRequest *)metadataUpdateRequestWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo;

/**
 * Generate a request to update metadata information about a file.
 *
 * @param fileID File ID.
 * @param scope Scope to see which templates are available.
 * @param template Template for metadata in file.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataUpdateRequest *)metadataUpdateRequestWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo;

/**
 * Generate a request to retrieve a metadata template schema within a scope.
 *
 * @param scope Scope to see which templates are available.
 * @param template Template whose schema will be returned.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataTemplateRequest *)metadataTemplateInfoRequestWithScope:(NSString *)scope template:(NSString *)template;

/**
 * Generate a request to retrieve all metadata template schemas within a scope.
 *
 * @param scope Scope to see which templates are available.
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataTemplateRequest *)metadataTemplatesInfoRequestWithScope:(NSString *)scope;

/**
 * Generate a request to retrieve all metadata template schemas within the enterprise scope.
 *
 * @see BOXAPIScopeEnterprise
 *
 * @return A request that can be customized and then executed.
 */
- (BOXMetadataTemplateRequest *)metadataTemplatesInfoRequest;

@end
