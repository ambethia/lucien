# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Role.find_or_create_by_name(:name => 'member', :title => 'Member')
Role.find_or_create_by_name(:name => 'admin', :title => 'Administrator')

user = User.new
user.signup!({:name => 'Jason L Perry', :email => "jasper@ambethia.com"}, false)
user.activate!({:openid_identifier => 'http://ambethia.com'}, false)
user.roles << Role.find_by_name('admin')

