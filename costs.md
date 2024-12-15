1 Million Requests per day

Lambda
512MB Lambda = Per millisecond $0.0000000083
             = Per 1 Million requests $0.20
API Gateway = Per Million requests $1.20
On-Demand Dynamodb = Per Million Write Request units $0.7625

Assumption 20ms per request
1 Million requests total = $0.166 + $0.20 + $1.20 + $0.7625 = $2.3285

Kubernetes - Alternative
Load Balancer = $0.027 per Application Load Balancer-hour
              = $0.08 per LCU
512MB Fargate container = Per GB per hour $0.00136547
                        = Per vCPU per hour $0.01243517
On-Demand Dynamodb = Per Million Write Request units $0.7625

Assumption 1 Million requests per day
Assuming constant load
Assuming 0.1 vCPU per 512MB
Assuming each request is 512KB
LCUs = 0.46296296296 / 0.01986821492
Per day = $1.53688888889 + $0.046230048 + $0.7625 = $2.34561894

2 Million Requests per day

Lambda
512MB Lambda = Per millisecond $0.0000000083
             = Per 1 Million requests $0.20
API Gateway = Per Million requests $1.20
On-Demand Dynamodb = Per Million Write Request units $0.7625

Assumption 20ms per request
2 Million requests total = 1 Million requests x 2 = $4.6570

Kubernetes - Alternative
Load Balancer = $0.027 per Application Load Balancer-hour
              = $0.08 per LCU
512MB Fargate container = Per GB per hour $0.00136547
                        = Per vCPU per hour $0.01243517
On-Demand Dynamodb = Per Million Write Request units $0.7625

Assumption 2 Million requests per day
Assuming constant load
Assuming 0.1 vCPU per 512MB
Assuming each request is 512KB
LCUs = 0.92592592592 / 0.01986821492
Per day = $1.53688888889 + $0.07407407407 + $1.5250 = $3.13596296