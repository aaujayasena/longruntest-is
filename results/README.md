# longruntest-is

This folder contains the wso2 identity server long run test resultsresults-day7.zip folder contains the test results with following configurations.

JVM option for IS server  ="-Xms512m -Xmx512m"
K8s pod upper limit of the memory: 1Gi
Deployment:  Kubernetes cluster
K8s pod upper limit of the CPU core:  1 core
product: IS mini  version with extract web apps
DB: postgres
Test scenarios: Auth code redirection with consent
Number of total users in the system: 10
Number of Auth applications: 10
Concurrency: 2
Constant TPS: 4 per minute
Test duration: 7 days

Result Summery:

  Server start up time		
    - Avg CPU (cores): 6
    - Avg memory (Mb): 800Mb
    - Startup time: 86 sec

   Long run test execution
    - Avg CPU (cores): 11
    - Avg memory (Mb): 935Mb
    - DB growth (Mb) : 71
    - Error count (%) : 0


