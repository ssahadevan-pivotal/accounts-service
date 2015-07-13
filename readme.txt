
This demo can be used to show how a blue green deployment can be done

To Compile:

gradle assemble

Updating the version:

Change StagingController.java in accounts/accounts-service/src/main/java/org/example/accounts/controller ( Added in version 4 , not  there in version 3)


1. ./delete.sh - will delete version 4.0 from PCF - Only needed if you are re-running demo

2. ./deploy.sh - will push 4.0 and map the routes appropriately

3. To Test - See the curl commands in deploy.sh
