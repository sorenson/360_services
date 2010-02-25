# NetRecorder.config do |config|
#   config.cache_file = "fakeweb_cache"   
#   if ENV['RECORD_WEB']
#     config.record_net_calls = true
#   else
#     config.fakeweb = true
#     FakeWeb.allow_net_connect = false
#   end
# end 
# 
# at_exit {NetRecorder.cache! if NetRecorder.recording?}
# 
# Before do |scenario|
#   if NetRecorder.recording?
#     NetRecorder.scope = scenario.name
#   else
#     FakeWeb.clean_registry
#     NetRecorder.register_scope(scenario.name)
#   end
# end