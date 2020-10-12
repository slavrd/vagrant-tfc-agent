#!/usr/bin/env bash
# Downloads a the TFC agent binaries

# Check if needed packages are installed and if not install them
PKGS="jq curl unzip"
which $PKGS >>/dev/null || {
  apt-get update
  apt-get install -y $PKGS
} 

# If TFC agent version is not set default to the latest stable version
if [ -z "$TFC_AGENT_VERSION" ]; then
	export TFC_AGENT_VERSION=$(curl -sSf https://releases.hashicorp.com/tfc-agent/index.json | jq -r .versions[].version | grep -E '^v{0,1}[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n 1)
fi

# download the tfc-agent binary
echo "==> Downloading TFC Agent version $TFC_AGENT_VERSION"
TFC_AGENT_URL=$(curl -sSf https://releases.hashicorp.com/tfc-agent/index.json | jq -r --arg v "$TFC_AGENT_VERSION" '.versions[$v].builds[0].url')
curl -sSf -o /tmp/tfc-agent-archive.zip $TFC_AGENT_URL

# extract the binaries
[ -d /opt/tfc-agent ] || mkdir -p /opt/tfc-agent
unzip -o -d /opt/tfc-agent  /tmp/tfc-agent-archive.zip && rm -f /tmp/tfc-agent-archive.zip 
