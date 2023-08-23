# Simple demo showing multi AWS region provisioning using TFC:

## Create 2 VCS backed workspaces in TFC linked to this github repo:
-tfeprovidermultiregion-us-west-1

-tfeprovidermultiregion-us-east-1

Create terraform variable aws_region = us-west-1 in workspace tfeprovidermultiregion-us-west-1

Create terraform variable aws_region = us-east-1 in workspace tfeprovidermultiregion-us-east-1

Apply variable set with AWS creds to both workspaces, then commit change to repo to kickoff.

