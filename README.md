# Kubernetes Database Migration
This project provides a Kubernetes manifest and Docker image for running database migrations on a Kubernetes cluster. The manifest creates a Kubernetes Job that runs a Docker container, which executes database migrations.

## Getting Started
To use this project, you need a Kubernetes cluster and the kubectl command-line tool installed on your local machine. You also need to have Terraform installed to create a Kubernetes cluster on Azure.

### Creating a Kubernetes Cluster with Terraform
You can use Terraform to create an AKS cluster on Azure. Follow these steps:

1. Clone this repository.
2. Navigate to the terraform/ directory.
3. Edit the terraform.tfvars file to include your Azure subscription ID, as well as your desired cluster name and location.
4. Run terraform init to initialize the Terraform environment.
5. Run terraform apply to create the Kubernetes cluster.

### Deploying the Database Migration Job
Once you have created the Kubernetes cluster, you can deploy the database migration job using the following steps:

1. Connect to your Kubernetes cluster using kubectl. You can get the connection string from the Azure portal by navigating to your AKS cluster's "Overview" page and clicking the "Connect" button.

2. Run the following command to create a Kubernetes secret with the SA password:



``kubectl create secret generic mssql --from-literal=MSSQL_SA_PASSWORD="MyC0m9l&xP@ssw0rd" `` 
This creates a secret called mssql with the SA password specified in the --from-literal parameter.

3. Apply the database.yaml manifest to create the deployment and service for the database:


``kubectl apply -f manifest\sqldeployment.yaml``
This creates a deployment for the SQL Server database and a service to expose it.

4. Apply the storage.yml manifest to create the job that will run the database migrations:


``kubectl apply -f manifest\storage.yml``
This creates a Kubernetes Job that runs a Docker container to execute database migrations.

### Connecting to the SQL Server Database
Once the database migration job is complete, you can connect to the SQL Server database using SQL Server Management Studio.

1. Download and install SQL Server Management Studio from the Microsoft website.
2. Open SQL Server Management Studio and click "Connect".
3. Enter the external IP address of the SQL Server service in the "Server name" field.
4. Select "SQL Server Authentication" and enter sa as the username and the SA password you specified earlier.
5. Click "Connect" to connect to the SQL Server database.

## Contributing
Contributions to this project are welcome! If you have any suggestions or find any issues, please open an issue or submit a pull request.

## Troubleshooting
If you encounter any issues when deploying the database migration job, here are a few things to check:

- Ensure that you have a Kubernetes cluster running and that you are connected to it with kubectl.
- Check that the mssql secret was created successfully with kubectl get secrets.
- Verify that the manifest\sqldeployment.yaml manifest was applied successfully with kubectl get deployments and kubectl get services.
- Check the logs of the database deployment with kubectl logs to ensure that the SQL Server container is running.
- Verify that the manifest\storage.yml manifest was applied successfully with kubectl get jobs.
- Check the logs of the migration job with kubectl logs to ensure that the database migration script ran successfully.

