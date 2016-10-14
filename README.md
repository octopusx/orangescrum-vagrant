# Vagrant Environment for Orangescrum

Vagrant development and evaluation environment for Orangescrum Community Edition.

Orangescrum Community Edition is a free, open-sorce project management web application,
available here: https://github.com/Orangescrum/orangescrum

This is a self-contained Vagrant environment
with very crude but functional Salt provisioning.

# Usage
To use the test environment one must have Vagrant configured with the vagrant-libvirt plugin and all associated dependencies (libvirt, qemu-kvm, etc.).

To start using the vagrant environment, go to the project directory and:
```shell
vagrant up --provider libvirt
```
Once the VM finishes provisioning, a clean installation of Orangescrum Community Edition should be available on the host machine under: `http://localhost:8080`.

To stop the VM:
```shell
vagrant halt
```

To destroy it:
```shell
vagrant destroy
```

For more information on how to use [Vagrant](https://www.vagrantup.com/), refer to the [official guides](https://www.vagrantup.com/docs/getting-started/).

vagrant-libvirt plugin code and documentation can be found on the [plugin github page](https://github.com/vagrant-libvirt/vagrant-libvirt).


# Contributions

Pull requests are welcome with any improvements to the Salt formula or the Vagrantfile.
