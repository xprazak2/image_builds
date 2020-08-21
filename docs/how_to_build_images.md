# How to build images

Use appropriate playbook inside `playbooks` directory to build the images you need.

To build localhost/foreman:2.1-42 image:

```
ansible-playbook playbooks/build-foreman-image.yml -e version=2.1 -e version_build=42
```

To build awesome-registry.io/awesome-repo/foreman:2.1-1 and push into the registry:

```
ansible-playbook playbooks/build-foreman-image.yml -e version=2.1 -e registry=awesome-registry.io/awesome-repo -e registry_user=admin -e registry_token=changeme
```
