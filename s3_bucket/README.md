## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | (Optional) The canned ACL to apply. Defaults to private. Conflicts with grant. | `string` | `"private"` | no |
| bucket\_prefix | (required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. | `string` | `""` | yes |
| kms\_master\_key\_id | (optional) The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse\_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse\_algorithm is aws:kms. | `string` | `"aws/s3"` | no |
| sse\_algorithm | (required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms | `string` | `"aws:kms"` | no |
| tags | (Optional) A mapping of tags to assign to the bucket. | `map` | <pre>{<br>  "environment": "prod",<br>  "terraform": "true"<br>}</pre> | no |
| target\_bucket | (Required) The name of the bucket that will receive the log objects. | `string` | `""` | yes |
| target\_prefix | (Optional) To specify a key prefix for log objects. | `string` | `"log/"` | no |
| versioning | (Optional) A state of versioning. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_arn | display bucket arn |
| s3\_bucket\_domain\_name | display bucket domain |
| s3\_bucket\_id | display the bucket id |
| s3\_bucket\_region | display bucket region |
| s3\_hosted\_zone\_id | display bucket zone id |
