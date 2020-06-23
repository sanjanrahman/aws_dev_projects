terraform {
  backend "s3" {
    bucket = "nsra-aws-sandboxbuilds" // Bucket name in aws
    key    = "cmdb_wb.tfstate"          // Inside bucket file will be calld terraform.tfstate
    region = "us-east-1"                  // Bucket region

    //dynamodb_table = "sanjan-tf"         // state lock configured in dynamodb_table
  }
}
