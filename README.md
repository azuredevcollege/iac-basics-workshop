# Welcome to the Infrastructure as Code basics workshop

In this workshop you will learn the basic concepts to provision your Azure resources by writing code. 
**Infrastructure as Code (IaC)** is the process of managing and provisioning Azure resources through source code, rather than interactive configuration like configuring Azure resources by clicking in the Azure Portal. 
IaC enables speed by allowing code to be parameterized and executed whenever it is needed, and it eliminates manual configuration whenever a new environment needs to be deployed. IaC means removing manual configuration of Azure resources and reducing the risk of misconfiguration by human errors. 

In general there are two approaches to describe infrastructure as code:
**Declarative** (functional) and **imperative** (procedural).
The **declarative** approach describes the desired state how the target infrastructure should be.
The **imperative** approach focus on how the infrastructer must be changed to meet the desired configuration.

## Azure Resource Manager

The Azure Resource Manager is the deployment and management service for Azure. It provides a management layer that enables you to create, update and delete resources in Azure. The Azure Resource Manager is a REST Api. 
When a user sends a request from any of the Azure tools, APIs, or SDKs, Resource Manager receives the request. It authenticates and authorizes the request. Resource Manager sends the request to the Azure service, which takes the requested action. Because all requests are handled through the same API, you see consistent results and capabilities in all the different tools.

![Consistent Management Layer](./images/consistent-management-layer.png) 

## Continuous Integration (CI) and Continuous Deployment (CD)

Once we start with IaC we should consider to use a modern source control system to manage code files and establish a modern software development process. Software development? Yes, that's exactly what it is when you use code to describe your infrastructure. You should familiarize yourself with Git and try to integrate and roll out changes to the code in a timely manner to recognize as early as possible when changes fail. This is a brief summary of what is behind **Continuous Integration** (CI) and **Continuous Deployment** (CD).
**CI** is the process to to integrate changes to code in a timely manner and **CD** is the process to deploy changes to environments to recognize as early as possible when changes fail. Of course, we need a platform and the tooling that supports us. Azure DevOps or GitHub helps us to map a modern software process. With Azure Resource Manager we have a consistent management layer for Azure resources. Whether we take a declarative or imperative approach, infrastructure is described as code and code allows us to automate the rollout of Azure resources. Azure Pipelines or GitHub Actions allow us to describe and automate the rollout of code. 


## The goal of the workshop

This workshop focuses on the declarative approach using Azure ARM templates to describe the desired state of Azure resources. GitHub is used both for managing the code and for creating workflows that automatically roll out changes to the infrastructure. Based on challenges, the individual components are described step by step and illustrated with practical exercises.

## Challenges

* [Challenge_00](./challenges/challenge_00.md) Setup your system
* [Challenge_01](./challenges/challenge_01.md) Import the workshop repository into your personal GitHub organization
* [Challenge_02](./challenges/challenge_02.md) Git basics
* [Challenge_03](./challenges/challenge_03.md) Create and deploy your first ARM Template
* [Challenge_04](./challenges/challenge_04.md) Create a GitHub Workflow to deploy an ARM Template



