resource "aws_iam_role"
"lambda_role" {
name= "lambda-remediation-role"
assume_role_policy= jsonencode ({

Version = "2012-10-17"
Statement=[{ 
Effect = "Allow"
Principal = { Service= "lambda.amazonaws.com"}

Action="sts:AssumeRole"
}]

})
}
  


resource "aws_iam_role_policy"
"lambda_policy" {

was_iam_role.lambda_role.id


policy = jsonencode ({
Version="2012-10-17"
Statement = [
{
Effect = "Allow"
Ation= ["ec2:RebootInstances"]

Resource="*"
},
{
Effect="Allow'
Action=[
"sns:Publish"]
Resource="*"
},
{
Effect ="Alloow"
Action=["logs:createLogGroup",
"logs:createLogStreams",
"log:PutLogEvents" ]
Resource="*"
}
]
})
}

