Vagrant.configure("2") do |config|
  config.vm.box = "slavrd/bionic64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
  
  config.vm.provision "shell", path: "./scripts/tfc-agent-download.sh", env: { :TFC_AGENT_VERSION => ENV["TFCA_VER"] } 
end
