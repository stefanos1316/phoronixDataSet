# To install all necessary dependencies execute: 

	$ sudo ansible-playbook ubuntu_installer.yml

# To generate all input data execute:
	
	$ cd tools
	$ bash generateInputData.sh

# To install watts up pro submodule execute:

	$ git submodule init
  	$ git submodule update

# To download and install all tasks execute:
	
	$ cd tools
	$ bash downloadAndInstallTasks.sh

# To execute all test cases execute:

	$ cd scripts
	$ bash execute.sh
