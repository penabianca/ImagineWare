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

list = ['web', 'android', 'beginner']
list.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
end
@a = Course.create(:title => "Introduction to HTML5", :content => "Javascript without the javascript")
@a.tag_list.add('web')
@a.tag_list.add('beginner')
@a.save
@b = Course.create(:title => "Android Programming", :content => "One million devices and a lot of bad software")
@b.tag_list.add('android')
@b.save
@c = Course.create(:title => "Ruby on Rails", :content => "DHH smells of axe body spray")
@c.tag_list.add('beginner')
@c.save
