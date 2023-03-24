# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure('2') do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Vagrant development environments require a box - search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "Microsoft/EdgeOnWindows10"
  # config.vm.box_version = "1.0"

  # See https://github.com/jacqinthebox/packer-templates
  # VirtualBox-ready, packer-built images.
  config.vm.box = 'jacqinthebox/windows10-LTSC'
  config.vm.guest = :windows

  # Share an additional folder to the guest VM.
  config.vm.synced_folder '~/', '/macbook-home'

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3389, host: 3389
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: 'winrm', auto_correct: true

  config.vm.communicator = ENV['communicator'] || 'winrm'
  config.winrm.username = 'vagrant' # "IEUser"
  config.winrm.password = 'vagrant' # "Passw0rd!"
  config.vm.boot_timeout = 180
  config.vm.graceful_halt_timeout = 300
  # Configuring
  config.ssh.username = 'vagrant' # "IEUser"
  config.ssh.password = 'vagrant' # "Passw0rd!"
  config.ssh.insert_key = false
  config.ssh.sudo_command = ''
  config.ssh.shell = 'sh -l'

  # Provider-specific configuration
  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Excel for Windows'
    vb.memory = '4096'

    # If you want to interact via the GUI, uncomment this section
    # vb.gui = true
    # vb.customize ["modifyvm", :id, "--vram", "128"]
    # vb.customize ["modifyvm", :id, "--audio", "coreaudio"]
    # vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  # config.vm.provision :file, source: './provision.sh', destination: '~/provision.sh'
  # config.vm.provision "shell", run: 'always', path: "./provision.sh", privileged: false

  config.vm.provision 'shell', binary: false, privileged: true, inline: <<-SHELL
    choco install -y vscode
    choco install -y git
    choco install -y microsoft-edge
    choco install -y office365business  # Office to get the Excel runtime
		exit
  SHELL
end
