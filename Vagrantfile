Vagrant.configure("2") do |config|
  config.vm.define "source", autostart: false do |source|
	source.vm.box = "{{.SourceBox}}"
  end
  config.vm.define "output" do |output|
	output.vm.box = "{{.BoxName}}"
	output.vm.box_url = "file://package.box"
  end
  config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
  end
  {{ if ne .SyncedFolder "" -}}
  		config.vm.synced_folder "{{.SyncedFolder}}", "/vagrant"
  {{- else -}}
  		config.vm.synced_folder ".", "/vagrant", disabled: true
  {{- end}}
end
