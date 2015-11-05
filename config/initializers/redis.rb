$redis = Redis.new(:host => 'localhost', :port => 6379)

#$redis.sadd("user_#{self.id}_friends", user.id)
