# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
   {
       :name => "amazoniWp",
       :eth1 => "192.168.50.100",
       :mem => "2048",
       :cpu => "2",
       :os => "gbailey/amzn2",
   },
   {
      :name => "ubuntu",
      :eth1 => "192.168.50.101",
      :mem => "1024",
      :cpu => "1",
      :os => "gusztavvargadr/ubuntu-server",
   },
   {
       :name => "amazonProm",
       :eth1 => "192.168.50.102",
       :mem => "1024",
       :cpu => "1",
       :os => "gbailey/amzn2",
   },
   {
      :name => "ubuntuProm",
      :eth1 => "192.168.50.103",
      :mem => "1024",
      :cpu => "1",
      :os => "gusztavvargadr/ubuntu-server",
   },
]

# Lets check what kind of SSH key you have generated and upload it on vm
rsa_key = File.expand_path('~') + "/.ssh/rsa_key.pub"
dsa_key = File.expand_path('~') + "/.ssh/id_dsa.pub"

if FileTest.exists?(rsa_key)
 key = rsa_key
elsif  FileTest.exists?(dsa_key)
 key = dsa_key
end

Vagrant.configure(2) do |config|
 boxes.each do |opts|
   config.vm.define opts[:name] do |config|
     config.vm.box = opts[:os]

     #config.ssh.insert_key = false
     config.ssh.insert_key = false
     ssh_public_key = File.read("#{key}")

     config.vm.network "private_network", ip: opts[:eth1]
     config.vm.hostname = opts[:name]
     config.vm.provider "virtualbox" do |v|
       v.memory = opts[:mem]
       v.cpus = opts[:cpu]
       v.name = opts[:name]
     end

   config.vm.provision "shell", inline: <<-SHELL
       echo "#{ssh_public_key}" >> /home/vagrant/.ssh/authorized_keys
     SHELL

     #config.vm.provision :ansible do |ansible|
     #    ansible.playbook = "pre_provision.yml"
     #    ansible.inventory_path = "development/hosts"
     #    ansible.verbose = "v"
     #end
   end
 end
end
