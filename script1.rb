require 'nexpose'
include Nexpose
# Create a new InsightVM Connection the the default port
nsc = Connection.new('localhost', 'USERNAME-HERE', 'PASSWORD-HERE')
nsc.login # Login to NSC and Establish a session id
# beginning of sites
sites = nsc.list_sites
if sites.length == 0
  # puts = printout
  puts "There are currently no active Sites in this InsightVM instance..."
else
  sites.each do |site|
    puts "=============================" #linebreak
    puts "Site ID:      #{site.id}"
    puts "Site Name:    #{site.name}"
    puts "Risk Score:   #{site.risk_score.round}"
  end # end of groups else
end # end of groups if
nsc.logout # log out of session
