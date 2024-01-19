**How to Contribute?**
For Development purposes.
Pick an Issue
Create a branch for the issue, make it from the main branch.
Clone the branch to local.
Create a Scratch Org and deploy the project to this Org.
Work on the issue on your scratch Org along with **required** Test Suites.
After completing the work on the issue, Pull changes from your Org.
Publish the modified issue branch and create a Pull Request for QA.

**For QA purposes.**
Review the Pull Request.
Clone the issue branch to local.
Create a Scratch Org and deploy the project to this Org.
Conduct required tests.
Upon satisfactory result, merge the Pull Request to the QA branch.
Lastly create a Pull Request to merge the QA Branch to UAT branch.

**For Production purposes.**
Review the Pull Request for the UAT branch.
Clone the UAT Branch to your local.
Create a scratch Org and deploy the metadata and data-sets.
Open the Org and conduct an end-to-end testing with data in the Org.
Upon satisfactory result, create a Pull Request to merge the UAT branch to the main branch.
Upon review, clone the main branch to local.
Create a package and deploy the package to the Production Org.

# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
