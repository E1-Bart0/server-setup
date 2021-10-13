# How to quickly Set Up a new VPS

## Create a new VPS

### Using Digital Ocean

1. You need to know a Digital Ocean Token (Get it from Website)
2. Copy terraform variables:
    ```bash
   cp ./terraform/terraform.tfvars.tamplate ./terraform/terraform.tfvars
    ```
3. Add this token into **terraform.tfvars**.
4. You can change VPS parameters using **main.tf** by default *1cpu-1gb*
5. Initialize terraform using *Makefile*:
   ```bash
   make terraform cmd="init"
   ```
6. Change or create ssh-key for VPS by_default in *Makefile*:
   *~/.ssh/terraform_keys/terraform*
7. Create a VPS:
   ```bash
   make terraform_apply
   ```
8. Do not forget to copy VPS IP-address from output.
9. To connect you can use ssh-config *(~/.ssh/config)*:
   ```bash
   Host digital-ocean
       User root
       Hostname <Your-IP-Address>
       PreferredAuthentications publickey
       IdentityFile /Users/vadim/.ssh/terraform_keys/terraform
   ```

# Can quickly set up your new server using ansible

**Required steps:**

1. You should add you IP-address to *./ansible/hosts*
2. Install ansible (using poetry)
3. ```cd ./ansible```

## Create ansible user:

```bash
ansible-playbook -b ./playbooks/ansible_users.yaml
```

Change *./ansible/hosts*: **ansible_user=ansible**

## Install docker and docker-compose on server:

Also, will install python3

```bash
ansible-playbook -b ./playbooks/ansible_users.yaml
```
