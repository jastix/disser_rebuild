# Example 1 - Uploading a test text file and removing it afterwards.

require 'rubygems'
require 'rscribd'

# Use your API key / secret here
api_key = '4lj2rs4duuv4013y2qbw3'
api_secret = 'sec-twkc39qf22dmplhy3j4flvzet'
 
# Create a scribd object
Scribd::API.instance.key = api_key
Scribd::API.instance.secret = api_secret
Scribd::API.instance.debug = true

begin
  Scribd::User.login 'riscfuture2', 'felicia'
  doc = Scribd::Document.new :file => 'sample/test.txt', :flooza => 'booza'
  doc.save
rescue Scribd::ResponseError => e
  puts "failed code=#{e.code} error='#{e.message}'"
end
