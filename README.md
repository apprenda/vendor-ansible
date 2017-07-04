[![CircleCI](https://circleci.com/gh/apprenda/vendor-ansible/tree/master.svg?style=svg)](https://circleci.com/gh/apprenda/vendor-ansible/tree/master)

# Vendoring Ansible

Using python's `pip`, it is possible to install a python package and all it's
dependencies into a specific directory. Taking advantage of this capability, we
can vendor Ansible and it's dependencies. The only caveat is that the `PYTHONPATH`
has to point to the vendored folder.

## Using Docker to create a vendored package

The Dockerfile can be used to create an image that contains all the dependencies
that are necessary to install Ansible using pip.

You can build a Docker image like this:

```
docker build -t apprenda/vendor-ansible .
```

Once the image is built, modify `ansible-version.txt` with your desired Ansible
version and run the following to obtain a vendored Ansible package:

```
docker run --rm -v $(pwd):/vendor-ansible -w /vendor-ansible apprenda/vendor-ansible make
```

A file named `ansible.tar.gz` will be created in the local directory, containing
all the vendored Ansible files.

## Use vendored ansible

In order to use Ansible, the `PYTHONPATH` must include the `lib` and `lib64`
directories. Make sure to use absolute paths.

```
PYTHONPATH=$(pwd)/out/lib/python2.7/site-packages/:$(pwd)/out/lib64/python2.7/site-packages bin/ansible
```
