# Vagrant - TFC Agent

A Vagrant project to provision a VM with TFC Agent installed.

The provisioned VM will have the the TFC Agents binaries installed in `/opt/tfc-agent`

## Prerequisites

* Have [Virutal Box]() installed.
* Have [Vagrant]() installed.

## Use

* Provision the VM depending on the TFC Agent version you need to install
  
  * Bring up a VM with the latest version of the TFC agent

  ```bash
  vagrant up
  ```

  * Bring up a VM with a specific version of the TFC agent e.g. `0.1.2`

  ```
  TFCA_VER=0.1.2 vagrant up
  ```
* Login to the VM

```
vagrant ssh
```

* Set-up the TFC agent environment variables according to the [documentation](). For example

```bash
export TFC_ADDRESS=https://app.terraform.io
export TFC_AGENT_TOKEN=<VALID_TFC_AGENT_POOL_TOKEN>
export TFC_AGENT_LOG_LEVEL=TRACE
export TFC_AGENT_DISABLE_UPDATE=TRUE
export TFC_AGENT_SINGLE=FALSE
```

* Start the TFC Agent

```bash
cd /opt/tfc-agent
./tfc-agent
```

* Remove the VM after logging out

```bash
vagrant destroy
```
