# Challenge_05 Deploy a Hub and Spoke Network

In this challenge we will deploy a Hub and Spoke Network to Azure. We will
design a slightly more sophisticated workflow that provides an ARM Template
already during a PullRequest to a staging environment. When the pull request
is created, the ARM Template is deployed from the main branch and then the
new version of the Template is validated from the pull request branch with
the `--confirm-with-what-if` option. The validation output is inserted as a
comment in the PullRequest to identify in the Pull Request which changes
would be applied.

If you agree with the changes, the current ARM template is rolled out by
assigning a label called "stage" to the PullRequest. After that the staging
environment is ready for quality control. If the PullRequest is accepted into
the Main Branch, the ARM template is rolled out into the Production
environment.

This is going to sound complicated, but we will go through all the necessary
steps one by one.

## Review the provided ARM Template to deploy a Hub and Spoke Network topology

The needed ARM Template can be found under
**challenges/templates/challenge_05/hubspoke.json**. This template creates a
basic hub-and-spoke topology setup. It creates a Hub VNet with subnets DMZ,
Management, Shared and Gateway (optionally), with two Spoke VNets,
development and production, containing a workload subnet each. It also
deploys a Windows Jump-Host on the Management subnet of the HUB, and
establishes VNet peering between the Hub and the two spokes.

:::tip

We won't deploy the VPN Gateway, because it would take up to 45 minutes to
complete.

:::

Following parameters are needed to deploy the template:

| Parameter      | Description                        |
| -------------- | ---------------------------------- |
| winVmUser      | Username for Windows Jump-Host VM  |
| winVmPassword  | Password for Windows Jump-Host VM  |
| winVmDnsPrefix | DNS Label for Windows jump-host VM |
