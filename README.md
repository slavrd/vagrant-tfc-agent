# Vagrant - TFC Agent

A Vagrant project to provision a VM with TFC Agent installed.

The provisioned VM will have the the TFC Agents binaries installed in `/opt/tfc-agent`

## Prerequisites

* Have [Virutal Box](https://www.virtualbox.org/wiki/Downloads) installed.
* Have [Vagrant](https://www.vagrantup.com/downloads) installed.

## Use

* Provision the VM depending on the TFC Agent version you need to install
  
  * Bring up a VM with the latest version of the TFC agent

  ```bash
  vagrant up
  ```

  * Bring up a VM with a specific version of the TFC agent e.g. `0.1.2`

  ```bash
  TFCA_VER=0.1.2 vagrant up
  ```
* Login to the VM

```bash
vagrant ssh
```

* Set-up the TFC agent environment variables according to the [documentation](https://www.terraform.io/docs/cloud/workspaces/agent.html#start-the-agent). For example

```bash
export TFC_AGENT_TOKEN=<VALID_TFC_AGENT_POOL_TOKEN>
export TFC_AGENT_LOG_LEVEL=TRACE
export TFC_AGENT_SINGLE=FALSE
export TFC_ADDRESS=https://app.terraform.io

# For TFC agents >= 1.0
export TFC_AGENT_AUTO_UPDATE=disabled # other options - minor|patch

# For TFC agents < 1.0 
export TFC_AGENT_DISABLE_UPDATE=TRUE
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