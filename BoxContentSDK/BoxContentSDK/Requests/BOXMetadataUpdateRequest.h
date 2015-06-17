//
//  BOXMetadataUpdateRequest.h
//  BoxContentSDK
//
//  Created by Andrew Chun on 6/14/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <BoxContentSDK/BoxContentSDK.h>

/**
 * BOXMetadataUpdateRequest is a concrete implementation of BOXRequest that allows users to
 * use the BOXContentSDK to update metadata associated with a given file.
 *
 * Currently the BOXContentSDK only supports the enterprise scope and templates are
 * determined by an enterprise by enterprise basis.
 *
 * More information can be found at the link below:
 * https://box-content.readme.io/#update-metadata
 */
@interface BOXMetadataUpdateRequest : BOXRequest

/**
 * Suppliable ETags for the HTTPRequests header.
 */
@property (nonatomic, readwrite, strong) NSArray *notMatchingEtags;

/**
 * The scope of the BOXMetadataUpdateRequest. Determines which templates are available.
 *
 * Currently only enterprise and global are supported scopes within metadata.
 */
@property (nonatomic, readwrite, strong) NSString *scope;

/**
 * The template for the given scope of the BOXMetadataUpdateRequest.
 *
 * Templates are handled on a enterprise by enterprise basis. To see available metadata
 * templates @see BOXMetadataTemplateRequest.
 */
@property (nonatomic, readwrite, strong) NSString *template;

/**
 * The information to populate the initial metadata's template with.
 *
 * **NOTE** Must only contain instances of @see BOXMetadataUpdateTask.
 */
@property (nonatomic, readwrite, strong) NSArray *updateInfo;

/**
 * Returns a BOXMetadataUpdateRequest instance that allows users
 * to update metadata information on a given file.
 *
 * **NOTE** Scope is defaulted to @see BOXAPIScopeEnterprise in this initializer.
 *
 * @param fileID The ID of the desired file.
 * @param template The templateKey of the desired metadata information for the given file.
 *
 * @return A BOXMetadataUpdateRequest that allows users to update metadata information on a given file.
 */
- (instancetype)initWithFileID:(NSString *)fileID template:(NSString *)template updateInfo:(NSArray *)updateInfo;

/**
 * Designated initializer. Returns a BOXMetadataUpdateRequest instance that allows users
 * to update metadata information on a given file.
 *
 * @param fileID The ID of the desired file.
 * @param scope The scope of the templates desired for creating a metadata template instance.
 * @param template The templateKey of the desired metadata information for the given file.
 *
 * @return A BOXMetadataUpdateRequest that allows users to update metadata information on a given file.
 */
- (instancetype)initWithFileID:(NSString *)fileID scope:(NSString *)scope template:(NSString *)template updateInfo:(NSArray *)updateInfo;

/**
 * Performs the PUT request to update metadata information.
 *
 * @param completionBlock The block of code to be run after the PUT request has completed
 *                        regardless of success.
 */
- (void)performRequestWithCompletion:(BOXMetadataBlock)completionBlock;

@end
