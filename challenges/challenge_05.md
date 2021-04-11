# Challenge_05 Create a Pull Request validation workflow

In this challenge we will create a GitHub worflow that is used to validate a Pull Request.
If you work on a new feature or if you make changes to your production system, a best practice is to create a branch from your main branch and do all the work in the newly created branch before changes are merged back to the main branch. This strategy keeps your main branch clean and build breaks can be avoided. When you have finished your work you create a Pull Request to collaborate with other team members to review and discuss about the changes.

## The scenario

Let's say we want to roll out an Azure Storage account in a Resource Group using an ARM template. In order to ensure that we do not destroy anything in the production system, it would make sense to get feedback within the pull request which changes the ARM template would cause. Of course, we do not want to run this test against the production system. But since we have mapped the current state of the production system in the main branch, we can use the sources from the main branch to build a temporary environment. Once the temporary environment is created, we can run the test against that environment. To test the effect of an ARM template we use an ARM template deployment with the what-if option. 

```shell
CHANGES=az deployment group what-if -n demo01 -g rg-name --template-file path/to/template --parameters param01=value01
```

For better collaboration, it makes sense to map this procedure in a GitHub workflow and visualize the result of the what-if deployment directly in the pull request. This allows the team to discuss the possible changes.

The GitHub Script action allows us to access GitHub resources like an issue and add a comment. You can find the documentation [here](https://github.com/actions/github-script) on GitHub. 

``` yaml
- uses: actions/github-script@v3
  with: 
    github-token: ${{ github.token }}
    script: |
      github.issues.createComment({
        issue_number: ${{ github.event.number }},
        owner: context.repo.owner,
        repo: context.repo.repo,
        body: `your comment`
        })

```

### The flow to validate an ARM template with a what-if deployment within a Pull Request

The following diagram illustrates the what-if deployment process:

![what-if overview](images/what-if-overview.png)


### Deploy to a staging environment

At this point we can prepare an environment from the main branch and rollout our ARM template with the what-if option to see how the template would affect the environment. 
This is a great way to already check what would happen. But this is not enough, because we also want to know how an environment looks like when we deploy the ARM template. That's why we extend our workflow to build a staging environment. This environment can then be tested and validated and is a copy of the production system with the changes that the ARM template brings. 
Again, the environment is first built from the main branch and then the ARM template is deployed from the branch. The GitHub script action is used to add a comment to the pull request describing the necessary information of the staging environment (e.g. name of the ResourceGroup).

![staging-workflow](images/staging-workfow.png)



