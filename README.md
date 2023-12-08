# template-airflow-deploy-gcp

Terraform to deploy Airflow on GCP

Before executing the code, be sure to be logged in your GCP account on your shell

To do this, run
```console
gcloud auth application-default login
```
To see more: https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login


To install the infrastructure, run
```console
sh terraform_deploy.sh
```

To enter on Airflow web interface, access

{{VM instance's external ip}}:8080