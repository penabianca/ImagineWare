# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# seed the HospitalLink DB with some hostpitals
more_hospitals = [
{:name =>"Hopital de District de Mbanga",
  :city => "Mbanga",
  :creation_date => "12/08/1975"},
{:name =>"Hopital Laquintinie",:city =>"Douala",
  :creation_date => "01/01/1960"},
{:name => "Hopital Central de Yaounde",
 :city =>"Yaounde",
 :creation_date => "05/09/1970"}
]
#Note the following line temporarily allows 
#mass assignment
Hospital.send(:attr_accessible, :name,:city,:creation_date)
more_hospitals.each do |hospital|
  Hospital.create!(hospital)
end
