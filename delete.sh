set -x
CF_APPS_DOMAIN="cf.vca01.pivotal.io";
NEW_VERSION="4.0";
OLD_VERSION="3.0";
NEW_VERSION="4.0";
OLD_VERSION="3.0";
#Delete the app
cf delete esiAccountsService-4.0 -r
#cf delete-route cf.vca01.pivotal.io -n esiAccountsService-40
#cf delete-route cf.vca01.pivotal.io -n esiAccountsService

# Map the generic route to the old app 3.0
cf map-route esiAccountsService-3.0 $CF_APPS_DOMAIN -n esiAccountsService

cf routes
