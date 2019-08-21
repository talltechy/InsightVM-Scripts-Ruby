require 'nexpose'
include Nexpose
# Create a new InsightVM Connection the the default port
nsc = Connection.new('localhost', 'USERNAME-HERE', 'PASSWORD-HERE')
nsc.login # Login to NSC and Establish a session id
# Beginning of rescan assets
asset_group_ids = [1,4,21]
asset_group_ids.each do |id|
  group = AssetGroup.load(nsc, id)
    # 30.downto(0) do |i|
    # =>  puts "00:00:#{'%02d' % i}"
    # =>  sleep 1
    # end
  sleep 60 #sleep 60 seconds to prevent the console from overloading or not finishing the task
  group.rescan_assets(nsc)
  puts "Started Scan..."
end
nsc.logout # log out of session
