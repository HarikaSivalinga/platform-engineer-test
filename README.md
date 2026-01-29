Platform Engineer Coding Test – PacerPro, Inc.

Hello,

In this project, I demonstrate how I approach monitoring, alerting, and automated
remediation for a web application that is experiencing intermittent performance issues.
The focus of this solution is simplicity, clarity, and production-ready thinking.

--------------------------------------------------
TOOLS AND TECHNOLOGIES USED
--------------------------------------------------

I used the following tools to complete this exercise:

- Sumo Logic for log monitoring and alerting
- AWS Lambda for automated remediation
- Amazon EC2 as the application server
- Amazon SNS for notifications
- Terraform for Infrastructure as Code
- Git and GitHub for version control and submission

--------------------------------------------------
PROJECT STRUCTURE
--------------------------------------------------

The repository is structured in a way that reflects how I would organize a real
production infrastructure repository:

platform-engineer-test/
- sumo_logic_query.txt
- lambda_function/
  - lambda_function.py
- terraform/
  - provider.tf
  - ec2.tf
  - sns.tf
  - iam.tf
  - lambda.tf
- recordings/
  - part1_sumo_logic.txt
  - part2_lambda.txt
  - part3_terraform.txt
- README.txt

--------------------------------------------------
SCENARIO
--------------------------------------------------

I approached this task as a Platform Engineer working at a company where the web
application occasionally experiences slow responses.

The /api/data endpoint sometimes takes longer than expected to respond, and these
latency issues are intermittent rather than constant. My goal was to build a solution
that can automatically detect repeated performance problems and recover without
manual intervention.

--------------------------------------------------
PART 1: SUMO LOGIC QUERY AND ALERT
--------------------------------------------------

In the first part, I created a Sumo Logic query to identify slow API responses.

The query filters production API logs and extracts the endpoint and response time.
It then selects only requests to the /api/data endpoint that take more than 3 seconds
to respond.

To avoid alerting on one-off spikes, I grouped the results into 10-minute windows and
triggered an alert only if more than 5 slow requests occur within that window.

The query is available in:
sumo_logic_query.txt

I recorded my screen and explained my thought process while writing the query and
configuring the alert. The recording link is available in:
recordings/part1_sumo_logic.txt

--------------------------------------------------
PART 2: AWS LAMBDA FUNCTION
--------------------------------------------------

In the second part, I implemented an AWS Lambda function that is triggered when the
Sumo Logic alert fires.

When the function is invoked, it performs three actions:
1. Reboots a specific EC2 instance
2. Logs the action to Amazon CloudWatch
3. Sends a notification to an SNS topic

The goal of this function is to automatically recover from potential stuck or overloaded
application states while keeping the team informed.

The Lambda implementation can be found in:
lambda_function/lambda_function.py

I deployed and tested the function and verified that the EC2 instance rebooted, logs
were created in CloudWatch, and the SNS notification was sent successfully.

A recording of the implementation, deployment, and testing is available in:
recordings/part2_lambda.txt

--------------------------------------------------
PART 3: INFRASTRUCTURE AS CODE (TERRAFORM)
--------------------------------------------------

In the final part, I used Terraform to provision all required AWS resources in a
repeatable and auditable way.

Using Terraform, I created:
- An EC2 instance to represent the application server
- An SNS topic for notifications
- An IAM role and policy for the Lambda function
- The Lambda function itself

I followed the principle of least privilege and granted the Lambda function only the
permissions required to reboot EC2 instances, publish to SNS, and write logs to
CloudWatch.

Terraform files are located in the terraform/ directory.

I recorded my screen while writing, deploying, and verifying the infrastructure. The
recording link is available in:
recordings/part3_terraform.txt

--------------------------------------------------
ASSUMPTIONS AND TRADEOFFS
--------------------------------------------------

To keep the solution focused and easy to evaluate, I made the following assumptions:

- A single EC2 instance is sufficient for demonstration
- Fixed latency thresholds are acceptable for this exercise
- Auto scaling is not implemented

These decisions helped keep the solution simple while still demonstrating
production-oriented platform engineering practices.

--------------------------------------------------
FUTURE IMPROVEMENTS
--------------------------------------------------

If this were extended further, I would consider:
- Using Auto Scaling Groups instead of a single EC2 instance
- Implementing dynamic or SLO-based alert thresholds
- Adding cooldown or locking mechanisms to avoid repeated reboots
- Introducing circuit breaker patterns
- Using health-based or canary deployments

--------------------------------------------------
VERSION CONTROL
--------------------------------------------------

I used Git for version control and committed changes incrementally. The repository
was pushed to GitHub and made publicly accessible for review.

--------------------------------------------------
CONCLUSION
--------------------------------------------------

This project represents my approach to building a simple, reliable, and automated
monitoring and remediation workflow using Sumo Logic, AWS Lambda, and Terraform.

Thank you for taking the time to review my submission.
