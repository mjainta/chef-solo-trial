.PHONY:
run:
	sudo chef-solo -c solo.rb -j node.json

.PHONY:
new-cookbook:
	cd cookbooks && chef generate cookbook $(name)
