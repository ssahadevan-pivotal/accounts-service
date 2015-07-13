set -x

cf target

CF_APP="esiAccountsService";
APP_ROUTE="esiaccountsservice";
APP_ROUTE_VER="esiaccountsservice-40";
CF_APPS_DOMAIN="cf.vca01.pivotal.io";
TEMP_TEST_URL=http://$APP_ROUTE_VER.$CF_APPS_DOMAIN/accounts;
TEST_URL=http://$APP_ROUTE.$CF_APPS_DOMAIN/accounts;
VERSION_URL=http://$APP_ROUTE.$CF_APPS_DOMAIN/version;

NEW_VERSION="4.0";
OLD_VERSION="3.0";
# create variables
cf apps | grep -i  $CF_APP

DEPLOYED_VERSION_CMD=$(CF_COLOR=false cf apps | grep "$CF_APP" |  cut -d" " -f1 | cut -d"-" -f2)
DEPLOYED_VERSION="$DEPLOYED_VERSION_CMD"
echo "Deployed Version Cmd: DEPLOYED_VERSION_CMD"
echo "Deployed Version: $DEPLOYED_VERSION"


curl http://esiaccountsservice-30.cf.vca01.pivotal.io/accounts

cf push
echo $TEMP_TEST_URL
curl $TEMP_TEST_URL ;


cf routes | grep -i esiAccountsService

# Map to the latest version
cf map-route esiAccountsService-$NEW_VERSION $CF_APPS_DOMAIN -n esiAccountsService

cf routes | grep -i esiAccountsService

cf unmap-route esiAccountsService-$OLD_VERSION $CF_APPS_DOMAIN -n esiAccountsService

cf routes | grep -i esiAccountsService

curl $TEST_URL ;

curl $VERSION_URL ;

