package test

import (
        "testing"

        "github.com/gruntwork-io/terratest/modules/aws"

        "github.com/gruntwork-io/terratest/modules/terraform"
        "github.com/stretchr/testify/assert"
)


func TestTerraformAwsS3ExampleDemo(t *testing.T) {
        t.Parallel()

       
//      expectedName := fmt.Sprintf("terratest-aws-s3-%s", strings.ToLower(random.UniqueId()))

        
        // Pick a random AWS region to test in. This helps ensure your code works in all regions.
        //awsRegion := aws.GetRandomStableRegion(t, nil, nil)

       const awsRegion = "us-east-1"

      
        terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
                // The path to where our Terraform code is located
                TerraformDir: "../examples/terraform-aws-s3-example",

              
        })

        // At the end of the test, run `terraform destroy` to clean up any resources that were created
        defer terraform.Destroy(t, terraformOptions)

        // This will run `terraform init` and `terraform apply` and fail the test if there are any errors
        terraform.InitAndApply(t, terraformOptions)

        // Run `terraform output` to get the value of an output variable
        bucketID := terraform.Output(t, terraformOptions, "id")

        // Verify that our Bucket has versioning enabled
        actualStatus := aws.GetS3BucketVersioning(t, awsRegion, bucketID)
        expectedStatus := "Enable"
        assert.Equal(t, expectedStatus, actualStatus)

        // Verify that our Bucket has a policy attached
        aws.AssertS3BucketPolicyExists(t, awsRegion, bucketID)

}
