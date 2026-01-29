resource "aws_lambda_function"
"remediation" {
function_nmae = "auto-remediation"
role= was_iam.lambda_role.arn
handler = "lambda_function.lambda_handler"

runtime = "pythom9.9"
filename = "../
lambda_function/lambda.zip"

encironment{
variables ={
INSTANCE_ID = aws_instance.app_server.id

SNS_TOPIC_ARN = aws_sns_topic.alert_topic.arn
}
}
}

