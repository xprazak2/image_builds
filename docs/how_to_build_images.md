# How to build images

Use appropriate playbook inside `playbooks` directory to build the images you need.

To build localhost/foreman:2.1-42 image:

```
ansible-playbook playbooks/build-foreman-image.yml -e version=2.1 -e version_build=42
```

To build awesome-repo/foreman:2.1-1 and push into the registry:

```
ansible-playbook playbooks/build-foreman-image.yml -e version=2.1 -e registry=awesome-repo -e registry_user=admin -e registry_token=changeme -e push=true
```

It is possible to use additional snippets to modify an image build which is useful when you need to copy additional files into an image:

```
touch roles/foreman-dockerfile/files/container-assets/foo.yml

cat <<'EOF' >> roles/foreman-dockerfile/templates/my-snippet.j2
COPY container-assets/foo.yml /usr/share/foreman/foo.yml
EOF

ansible-playbook playbooks/build-foreman-image.yml -e "{ 'version': '2.1', 'snippets': ['my-snippet.j2'] }"

```

To install additional plugins, specify the rpm packages you wish to install. Do not forget to add your configs (smart-proxy plugins only).
If your plugin needs anything more, use the snippets as described above.

```
ansible-playbook playbooks/build-foreman-proxy-image.yml -e '{ "rpms_to_install": ["tfm-rubygem-smart_proxy_remote_execution", "tfm-rubygem-smart_proxy_remote_execution_ssh"], "configs_to_copy": ["remote_execution_ssh.yml"]}'

```
