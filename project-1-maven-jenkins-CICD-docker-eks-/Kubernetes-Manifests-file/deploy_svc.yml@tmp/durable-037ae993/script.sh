
							
							git config user.email "${GIT_EMAIL}"
							git config user.name "${GIT_USER_NAME}"
							BUILD_NUMBER=${BUILD_NUMBER}
							echo $BUILD_NUMBER
							sed -i "s#image:.*#image: $REPOSITORY_URI$AWS_ECR_REPO_NAME:$BUILD_NUMBER#g" deploy_svc.yml
							git add .
							git commit -m "Update deployment Image to version ${BUILD_NUMBER}"
							git push https://${GIT_HUB_TOKEN}@${GIT_REPO_PATH} HEAD:main
						