# To install all necessary dependencies execute: 

	$ sudo ansible-playbook ubuntu_installer.yml

# To generate all input data execute:
	
	$ cd tools
	$ bash generateBinaryData.sh
	$ bash generateTaskData.sh

# To download and install all tasks execute:
	
	$ cd tools
	$ bash downloadAndInstallTasks.sh

# To execute all test cases execute:

	$ cd scripts
	$ bash execute.sh
