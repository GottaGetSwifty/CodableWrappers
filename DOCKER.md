
Should be put in a docker.compose when possible

Used to test on Linux. Current only issue appears to be a difference between the default order used for Keys, or possibly some odd behavior around float/double .infinity/.nan

docker build -t swifty .
docker run --rm swifty

