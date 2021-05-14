output "id" {
  value       = aws_s3_bucket.testlog_bucket12_01.id
  description = "Name of the Bucket"
  depends_on = [
    aws_s3_bucket.testlog_bucket12_01
  ]
}


output "s3_bucket_arn" {
    value = aws_s3_bucket.testlog_bucket12_01.arn
	depends_on = [
    aws_s3_bucket.testlog_bucket12_01
  ]
}

output "s3_bucket_domain_name" {
    value = aws_s3_bucket.testlog_bucket12_01.bucket_domain_name
	depends_on = [
    aws_s3_bucket.testlog_bucket12_01
  ]
}

output "s3_hosted_zone_id" {
    value = aws_s3_bucket.testlog_bucket12_01.hosted_zone_id
	depends_on = [
    aws_s3_bucket.testlog_bucket12_01
  ]
}

output "s3_bucket_region" {
    value = aws_s3_bucket.testlog_bucket12_01.region
	depends_on = [
    aws_s3_bucket.testlog_bucket12_01
  ]
}
