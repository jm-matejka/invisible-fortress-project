VPC: invisible-fortress-project-vpc
VPC id: vpc-03bd61356343d12b5
CIDR: 10.0.0.0/16

Subnets:
ifp-public
Subnet id: subnet-05ad2ae43dcf7c0ac
CIDR: 10.0.1.0/24

ifp-private
Subnet id: subnet-0d64c7be15fd015a9
CIDR: 10.0.2.0/24

Gateways:
Internet Gateway ID: igw-0f02524f1fe1b4089

Route Tables:
ifp-public-rtb
RTB ID: rtb-05a3ce4ba785adfd6
Associated with: ifp-public (subnet-05ad...)
Routes: 0.0.0.0/0 -> Internet Gateway

ifp-private-rtb
RTB ID: rtb-025a2ca28e63a0289
Associated with: ifp-private (subnet-0d64...)
Routes: 10.0.0.0/16 -> Local only

Instances:
ifp-web-server
Instance id: i-0520a5f1efa98e6f2
Public IP: 63.176.173.50
Private IP: 10.0.1.127
OS: Amazon Linux 2023
Role: Entry point & Web Proxy