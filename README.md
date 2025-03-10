# gatekeeper
This runs JMeter tests in a Docker container for performance testing and gives artifacts in azure devops pipeline as a api's metrics
run.sh file that launches the Docker image and runs the tests
test.sh file for each JMeter test plan – this just calls run.sh passing in the test plan and any parameters

Test plan:(API-LoadTest.jmx)
   Simulate a users doing various API calls
   
   Tenant Id for various environments:
   a3efb77a-a6e6-e711-bbd3-d05099ac64c3 QAAU
   15f1ad4a-414f-e911-867a-00155d95de7a CI
   0dbfbf88-0870-eb11-8fed-00155d96483a Loadtest
   4a5aeb9f-406a-eb11-8fed-00155d96368c QAUS

   API's being hit in the load test:
   1.)GET /api/v1/Accounts/Login 
   2.)GET /api/v1/Utilities/Configuration 
   3.)GET /api/v1/Utilities/Configuration 
   4.)GET /api/v4/Accounts/Profile 
   5.)GET /api/v1/Organizations/{tenantId}/Cameras 
   6.)GET /api/v5/Organizations/{tenantId}/Locations/? 
   7.)GET /api/v1/Accounts/Users/? 
   8.)GET /api/v3/Accounts/Customers/? 
   9.)GET /api/v2/Organizations/{tenantId}/Clusters/?
   10.)GET /api/v3/ServicePackages/Dealer/{tenantId}
   11.)GET /api/v2/Organizations/{tenantId}/ChangeRequests/
   12.)GET /api/v1/Utilities/Timezones
   13.)POST /api/v1/Organizations/${tenantId}/Callback/ 

   ...
   To run the script:
      1.)Go to pipelines 
      2.)Click Run New
      3.)Enter Variables like:
        host: Domain. [Example :loadtest.acs314159.com/qa-au.acs314159.com/ci.acs314159.com/qa-us.acs314159.com]
        filename: Enter file name here. [Example :API-LoadTest.jmx]
        rampUpPeriod: 1
        timeDuration: 120
        threads: 12
        tenantId: Enter as per the domain. A list for specific domain is given above. [Example :0dbfbf88-0870-eb11-8fed-00155d96483a]
      4.)Click Run
