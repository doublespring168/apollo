#!/bin/sh

# apollo config db info
apollo_config_db_url=jdbc:mysql://12.29.56.41:3307/ApolloConfigDB?characterEncoding=utf8
apollo_config_db_username=apollo_upay
apollo_config_db_password=rH8k7qDPNam5w3B5

# apollo portal db info
apollo_portal_db_url=jdbc:mysql://10.29.56.41:3307/ApolloPortalDB?characterEncoding=utf8
apollo_portal_db_username=apollo_upay
apollo_portal_db_password=rH8k7qDPNam5w3B5

# meta server url, different environments should have different meta server addresses
# dev,beta,pre,prod
dev_meta=http://dev.daliuliang.com.cn/upay-apollo
beta_meta=http://119.23.163.26:2213
pre_meta=http://119.23.139.89:2213
prod_meta=http://upay.aipayss.com/upay-apollo

META_SERVERS_OPTS="-Ddev_meta=$dev_meta -Dbeta_meta=$beta_meta -Dpre_meta=$pre_meta -Dprod_meta=$prod_meta"

# =============== Please do not modify the following content =============== #
# go to script directory
cd "${0%/*}"

cd ..

# package config-service and admin-service
echo "==== starting to build config-service and admin-service ===="

mvn clean package -DskipTests -pl apollo-configservice,apollo-adminservice -am -Dapollo_profile=github -Dspring_datasource_url=$apollo_config_db_url -Dspring_datasource_username=$apollo_config_db_username -Dspring_datasource_password=$apollo_config_db_password

echo "==== building config-service and admin-service finished ===="

echo "==== starting to build portal ===="

mvn clean package -DskipTests -pl apollo-portal -am -Dapollo_profile=github,auth -Dspring_datasource_url=$apollo_portal_db_url -Dspring_datasource_username=$apollo_portal_db_username -Dspring_datasource_password=$apollo_portal_db_password $META_SERVERS_OPTS

echo "==== building portal finished ===="

echo "==== starting to build client ===="

mvn clean install -DskipTests -pl apollo-client -am $META_SERVERS_OPTS

echo "==== building client finished ===="

~
~
~
~
                                                                                                                                                                                                 4,36          All
