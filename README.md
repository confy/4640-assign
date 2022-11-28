# 4640-assign

Adrian McFarlane 

In this assignment we will be using terraform to provision the following infrastructure on DigitalOcean:

![Untitled_Diagram.drawio.png](images/Untitled_Diagram.drawio.png)

### Prerequisites

You will need:

- Terraform installed
- A digital ocean account and token
- An ssh key - mine is called `4640.pem`
- a terraform.tfvars file created with the following template:
    
    ```
    region = "sfo3"
    token = "dop_v1_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    my_ip = "XXX.XXX.XXX.XXX" # Used only when db testing rule is enabled
    ```

### Creating Infrastructure

With the above prerequisites in place, you can run the following commands to create the infrastructure:

```
terraform init
terraform apply
```

When it completes, you should see the following output:

```
Outputs:

app_private_ips = [
  "10.124.16.3",
  "10.124.16.7",
  "10.124.16.8",
]
bastion_ip = "143.244.180.212"
db_conn_string = <sensitive>
lb_ip = [
  "146.190.12.12",
]
```

### Connecting to the Bastion host

After our infrastructure is created, we can now test sshing into our bastion host using the IP that was output after creation. We can ssh into the root user using our keyfile:

`ssh -i 4640.pem [root@](mailto:root@143.244.180.212)XXX.XXX.XXX.XXX`

![Untitled](images/Untitled.png)

Back on our host machine, lets remote in again with sftp in order to upload our ssh key to our bastion.

![Untitled](images/Untitled%201.png)

### Connecting to our Droplets

Log back into our bastion using ssh, then change the permissions of the key to be more restrictive:

`chmod 600 4640.pem`

Now we can  connect to any of the internal droplets from the bastion:

![Untitled](images/Untitled%202.png)

### Connecting to the Database

Next let’s try connecting to our mongodb database from our local machine. In order for this to work there is a commented db firewall rule that enables connections from my local IP.

Ouput the connection string from terraform:

`terraform output db_conn_string`

It will output a connection string to use (This is sensitive and this database has already been destroyed).

`"mongodb+srv://doadmin:50ImLX7143Mb62jS@mongo-78ef6244.mongo.ondigitalocean.com/admin?tls=true&authSource=admin&replicaSet=mongo"`

This string can then be used to login via mongodb compass:

![Untitled](images/Untitled%203.png)

### Destroying everything

You can destroy everything using:

`terraform destroy`