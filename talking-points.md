Lambda vs. Kubernetes
Generally prefer Kubernetes over Lambdas for APIs, but Kubernetes requires Kubernetes control plane to scale. Can also be used with Fargate to be serverless.

Lambda vs. Fargate
Depends on usage: lambda is best for high loads over short periods, Fargate is better for more constant loads, but is able to scale - Pricing model: usage vs. time

API gateway
Can add IP restriction and auth tokens to the setup for increased security.

API gateway
HTTP vs REST, HTTP is cheaper, but lacks some auth features. API gateway is already in VPC, so doesn't need the additional security features -> Chose HTTP

DynamoDB
Scalable, NoSQL database, best choice for task. Pay as you go model. Both for storage and for reads/writes.

DynamoDB - On-Demand vs Provisioned
Can provision some write units to make the setup cheaper, but without knowing the load, it might not make sense to pay for provisioned write units that aren't needed if the service doesn't need the write units most of the time.

DynamoDB vs S3
Could potentially have used S3 as "database" for a cheaper solution, but it would be harder to read from the database.