import sys

from pushbullet import Pushbullet
pb = Pushbullet("o.eWNRCJhOPJTOnAgJ4BpJUFUemBuPsylv")

#get all your devices
print(pb.devices)

#send to specific device
xiaomi = pb.get_device('Xiaomi Redmi 4X')
push = xiaomi.push_note("[Experiment " + sys.argv[1] + "]", "Please check results on sgeorgiou@195.251.251.22")
