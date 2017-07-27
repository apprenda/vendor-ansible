VERSION = $(shell cat ansible-version.txt)

all:
	@echo "Making vendored Ansible package for $(VERSION)"
	pip install --install-option="--prefix=/ansible" ansible==$(VERSION) netaddr
	tar -zcf ansible.tar.gz /ansible

.PHONY: clean
clean:
	rm -f ansible.tar.gz
	rm -rf /ansible
