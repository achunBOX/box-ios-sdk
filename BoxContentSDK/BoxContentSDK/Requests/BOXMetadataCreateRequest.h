//
//  BOXMetadataCreateRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

/**
 * BOXMetadataCreateRequest is a concrete implementation of BOXRequest that allows users to
 * use the BOXContentSDK to create metadata associated with a given file.
 *
 * Currently the BOXContentSDK only supports the enterprise scope and templates are
 * determined by an enterprise by enterprise basis.
 *
 * More information can be found at the link below:
 * https://box-content.readme.io/#create-metadata
 */
@interface BOXMetadataCreateRequest : BOXRequest

/**
 * Suppliable ETags for the HTTPRequests header.
 */
@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;

/**
 * The scope of the BOXMetadataCreateRequest. Determines which templates are available.
 *
 * Currently only enterprise and global are supported scopes within metadata.
 */
@property (nonatomic, readwrite, strong) NSString *scope;

/**
 * The template for the given scope of the BOXMetadataCreateRequest.
 *
 * Templates are handled on a enterprise by enterprise basis. To see available metadata
 * templates @see BOXMetadataTemplateRequest.
 */
@property (nonatomic, readwrite, strong) NSString *template;

/**
 * The information to populate the initial metadata's template with.
 *
 * **NOTE** Must only contain instances of @see BOXMetadataTask.
 */
@property (nonatomic, readwrite, strong) NSArray *info;

/**
 * Returns a BOXMetadataCreateRequest instance that allows users
 * to create metadata information on a given file.
 *
 * **NOTE** Scope is defaulted to @see BOXAPIScopeEnterprise in this initializer.
 *
 * @param fileID The ID of the desired file.
 * @param template The templateKey of the desired metadata information for the given file.
 *
 * @return A BOXMetadataCreateRequest that allows users to create metadata information on a given file.
 */
- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template info:(NSArray *)info;

/**
 * Designated initializer. Returns a BOXMetadataCreateRequest instance that allows users
 * to create metadata information on a given file.
 *
 * @param fileID The ID of the desired file.
 * @param scope The scope of the templates desired for creating a metadata template instance.
 * @param template The templateKey of the desired metadata information for the given file.
 *
 * @return A BOXMetadataCreateRequest that allows users to create metadata information on a given file.
 */
- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template info:(NSArray *)info;

/**
 * Performs the POST request to create metadata information.
 *
 * @param completionBlock The block of code to be run after the POST request has completed
 *                        regardless of success.
 */
- (void)performRequestWithCompletion:(BOXMetadataBlock)completionBlock;

@end