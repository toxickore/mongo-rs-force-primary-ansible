db2 = (new Mongo('localhost:28001')).getDB('test')
config = {
  	"_id" : "rs0",
  	"members" : [
  		{
  			"_id" : 0,
  			"host" : "mongo_instance_001:27017"
  		},
  		{
  			"_id" : 1,
  			"host" : "mongo_instance_002:27017"
  		},
  		{
  			"_id" : 2,
  			"host" : "mongo_instance_003:27017"
  		},
		{
			"_id" : 3,
			"host" : "mongo_instance_004:27017"
		},
	]
}
rs.initiate(config)
