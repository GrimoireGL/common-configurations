aws s3 cp register/ s3://$S3_BUCKET_URL/js/$CIRCLE_SHA1 --recursive --acl public-read --region ap-northeast-1
pkgJson=`cat ./package.json | base64`
# pkgJson=`node  -e "console.log(encodeURIComponent(process.argv[1]))" -- $pkgJson`
curl -X POST -d "repositoryURL=$CIRCLE_REPOSITORY_URL" -d "currentBranch=$CIRCLE_BRANCH" -d "currentBuildNumber=$CIRCLE_BUILD_NUM" -d "previousBuildNumber=$CIRCLE_PREVIOUS_BUILD_NUM" -d "sha1=$CIRCLE_SHA1" -d "pullRequest=$CI_PULL_REQUEST" -d "pkgJson=$pkgJson" $E2E_TRIGGER
