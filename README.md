# 🏰 The Invisible Fortress: Secure 3-Tier Cloud Architecture

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Infrastructure-Manual%20%2F%20IaC-blueviolet)
![Python](https://img.shields.io/badge/Python-Automation-yellow)
![Status](https://img.shields.io/badge/Status-In%20Progress-green)

## 📋 Project Overview
**The Invisible Fortress** is a cloud infrastructure project realised for purpose of my personal learning. Designed to demonstrate secure, scalable, and cost-effective architecture on AWS. The core philosophy is **Security by Design** — critical data and backend services are isolated in private networks, inaccessible from the public internet, while maintaining operational capability through secure routing and automation.

I have implemented enterprise-grade patterns like: **VPC segmentation**, **Bastion Hosts**, **NAT routing**, and **Automated Off-site Backups**.

## 🏗️ Architecture Diagram

```mermaid
graph TD
    User((User / Internet)) -->|HTTPS/80| IGW
    Admin((Admin / SSH)) -->|SSH/22| IGW
    
    subgraph AWS Cloud [AWS Region: eu-central-1]
        subgraph VPC [VPC: Invisible Fortress 10.0.0.0/16]
            IGW[Internet Gateway]
            
            subgraph Public_Zone [Public Subnet 10.0.1.0/24]
                direction TB
                WebServer[🖥️ Web Server / Bastion]
                NAT[🔄 NAT Instance]
                RT_Pub[Route Table: 0.0.0.0/0 -> IGW]
            end
            
            subgraph Private_Zone [Private Subnet 10.0.2.0/24]
                direction TB
                DB[🗄️ Database / App Server]
                RT_Priv[Route Table: 0.0.0.0/0 -> NAT]
            end
        end
        
        S3[☁️ S3 Backup Bucket]
    end

    IGW ==>|Traffic| WebServer
    WebServer <-->|Reverse Proxy / SSH Jump| DB
    DB -.->|Backup Upload| S3
    
    classDef public fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    classDef private fill:#ffebee,stroke:#b71c1c,stroke-width:2px;
    classDef aws fill:#fff9c4,stroke:#fbc02d,stroke-width:2px;
    
    class Public_Zone public;
    class Private_Zone private;
    class IGW,S3 aws;