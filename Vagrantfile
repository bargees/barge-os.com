# A dummy plugin for Barge to set hostname and network correctly at the very first `vagrant up`
module VagrantPlugins
  module GuestLinux
    class Plugin < Vagrant.plugin("2")
      guest_capability("linux", "change_host_name") { Cap::ChangeHostName }
      guest_capability("linux", "configure_networks") { Cap::ConfigureNetworks }
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.define "barge-hugo"

  config.vm.box = "ailispaw/barge"

  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 8443, host: 8443

  config.vm.hostname = "hugo.barge-os.com"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :docker do |docker|
    docker.pull_images "ailispaw/barge"
    docker.build_image "/vagrant/Dockerfiles/hugo/", args: "-t hugo"
  end

  config.vm.provision :docker do |docker|
    docker.build_image "/vagrant/Dockerfiles/caddy/", args: "-t caddy"
    docker.run "caddy",
      image: "caddy",
      args: "-p 8080:2015 -p 8443:443 -v /vagrant/public:/var/www/html"
  end
end
