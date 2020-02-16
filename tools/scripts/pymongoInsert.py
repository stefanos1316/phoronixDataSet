import time
import pymongo
m = pymongo.MongoClient()

doc = {'a': 1, 'b': 'hat'}

i = 0

start = time.time()
while (i < 200000):
	m.tests.insertTest.insert(doc, manipulate=False, w=1)
	i = i + 1
