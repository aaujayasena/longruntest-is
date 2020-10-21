# longruntest-is
This repository contains the wso2 identity server long run test scripts

Test steps:

Step 01:

 Deploy the k8s cluster with wso2is-deployment.sh file.
 - configurations available
   - database configurations (default: postgres)
   - User store configurations (default: Unique id JDBC)
   - IS Pod request and upper limit memory (default 256 Mb and 1GB respectively)
   - IS pod request and upper limit CPU cores (default: 1000 Mi)
   - Disbale Http server (toml configurations)
   - Tomcat thread count reduced (toml configurations)

Step 02:

 Data creation
  - Execute jmeter scripts TestData_Add_OAuth_Apps.jmx to create auth apps
  - Execute jmeter scripts TestData_Add_Super_Tenant_Users.jmx to create users
  - Test data configurations
    - Number of total users in the system: 10
    - Number of Auth applications: 10

** Jmter scripts support jmeter version 3.3

Step 03:

 Test execution
  - Execute run-long-running-tests.sh file for test execution. 
  - Test configurations,
    - Concurrency: 2
    - Constant TPS: 4 #Constant throughput (per minute)
    - Test duration: 5 days

Step 04:

 Test results and performance monitoring

  - To check the performance, configure k8s web ui dashboard and please refer blog [1] or simple command,
  kubectl top pods -n <name_sapace>

[1] https://medium.com/@aaujayasena/how-to-monitor-kubernets-deployments-from-web-ui-221f4dff8b42
