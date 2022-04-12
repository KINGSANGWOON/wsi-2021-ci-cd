#!/bin/bash


aws configure set aws_access_key_id AKIA4OY2BLCP2NZVLL4B; aws configure set aws_secret_access_key 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; aws configure set default.region ap-northeast-1
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 856363718815.dkr.ecr.ap-northeast-1.amazonaws.com
sudo  docker stop $(docker ps -a -q)
sudo docker rm $(docker ps -a -q)
sudo docker rmi $(docker images -q)



tag=$(aws ecr describe-images --repository-name ecs_test --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' --output text)

sudo docker pull 856363718815.dkr.ecr.ap-northeast-1.amazonaws.com/ecs_test:$tag
sudo docker run -d --name codedeploy -p 80:80 856363718815.dkr.ecr.ap-northeast-1.amazonaws.com/ecs_test:$tag
