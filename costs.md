512MB Lambda = Per millisecond $0.0000000083
             = Per 1 Million requests $0.20
API Gateway = Per Million requests $1.20
On-Demand Dynamodb = Per Million Write Request units $0.7625

Assumption 20ms per request
1 Million requests total = $0.166 + $0.20 + $1.20 + $0.7625 = $2.3285

Kubernetes
512MB Fargate container = Per GB per hour $0.00136547
                        = Per vCPU per hour $0.01243517
On-Demand Dynamodb = Per Million Write Request units $0.7625

Assumption 1 Million requests per day
Assuming constant load
Per day = 