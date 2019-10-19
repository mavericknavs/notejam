#  Set up paths
AWS="/usr/bin/aws --profile $aws_profile"

DOCKER_IMAGE=$1

# Step 1 Get login  snippet from AWS
DOCKER_LOGIN=$($AWS ecr get-login --no-include-email)

# Disable output as we have passwords here
set +x

# Step 2 Execute docker login against AWS.
eval $DOCKER_LOGIN

# Step 3 Tag image with AWS Specifics
docker tag $DOCKER_IMAGE $aws_repository

# Tag with Maven build release so we can track it
docker tag $DOCKER_IMAGE $aws_repository:$JOB_NAME.$BUILD_NUMBER

# Step 4 Push docker image to ECR
docker push $aws_repository
