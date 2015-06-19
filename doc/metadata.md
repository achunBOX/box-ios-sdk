Metadata
=====

Get Specific Box File Metadata Template Instance Information
----------------------
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXFileRequest *metadataInfoRequest = [contentClient metadataInfoRequestWithFileID:@"your_file_id" template: @"your_template"];
[metadataInfoRequest performRequestWithCompletion:^(NSArray *metadatas, NSError *error) {
	// If successful, metadatas will be non-nil; otherwise, error will be non-nil.
}];
```

Get All Box File Metadata Information
-----------------
```objectivec
BOXContentClient *contentClient [BOXContentClient defaultClient];
BOXMetadataRequest *metadataInfoRequest = [contentClient metadataAllInfoRequestWithFileID:@"your_file_id"];
[metadataInfoRequest performRequestWithCompletion:^(NSArray *metadatas, NSError *error){
	// If successful, metadatas will be non-nil; otehrwise, error will be non-nil.
}];
```

Create a Box File Metadata Template Instance
-----------------
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXMetadataTask *task = [[BOXMetadataTask alloc] initWithPath:@"your_path" value:@"your_value"];
BOXMetadataCreateRequest *metadataCreateRequest = [contentClient metadataCreateRequestWithFileID:@"your_file_id" template:@"your_template" info:@[task, ...];
[metadataCreateRequest performRequestWithCompletion:^(BOXMetadata *metadata, NSError *error){
	// If successful, metadata will be non-nil; otherwise, error will be non-nil.
}];
```

Delete a Box File Metadata Template Instance
-----------------
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXMetadataDeleteRequest *metadataDeleteRequest = [contentClient metadataDeleteRequestWithFileID:@"your_file_id" template:@"your_template"];
[fileDeleteRequest performRequestWithCompletion:^(NSError *error) {
	// If successful, error will be nil.
}];
```

Update a Box File Metadata Template Instance
-----------------
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXMetadataUpdateTask *task = [[BOXMetadataUpdateTask alloc]initWithOperation: BOXMetadataUpdateTEST path: @"your_path" value: @"your_value"];
BOXMetadataUpdateRequest *metadataUpdateRequest = [contentClient metadataUpdateWithFileID:@"your_file_id" template:@"marketingCollateral" updateInfo:@[task, ...]];
[metadataUpdateRequest performRequestWithCompletion:^(BOXMetadata *metadata, NSError *error){
	// If successful, metadata will be non-nil; otherwise, error will be non-nil.
}];
```

Get Specific Box Template Information
-----------------
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXMetadataTemplateRequest *metadataTemplateRequest = [contentClient metadataTemplateInfoRequestWithScope:@"your_scope" template:@"your_template"];
[metadataTemplateRequest performRequestWithCompletion:^(BOXMetadataTemplate *template, NSError *error){
	// If successful, template will be non-nil; otherwise, error will be non-nil.
}];
```

Get All Box Template Information
-----------------
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXMetadataTemplateRequest *metadataTemplateRequest = [contentClient metadataTemplatesInforRequest];
metadataTemplateRequest performRequestWithCompletion:^(NSArray *templates, NSError *error) {
	// If successful, templates will be non-nil; otherwise, error will be non-nil.
}];