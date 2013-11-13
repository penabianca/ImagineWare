# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# seed the HospitalLink DB with some hostpitals
#more_courses = [
#{:title => "Introduction to HTML5", :tags => "beginner", :content => "This is and HTML5 course. You must build a website from sratch"},
#{:title => "Advanced Android", :tags => "advanced", :content => "Here you will build a sick android app. Strap up!             "},
#{:title => "Object Oriented Programming", :tags => "intermediate", :content => "Here you must build classes with inheretance in Java          "}
#]
#Note the following line temporarily allows 
#mass assignment
#Course.send(:attr_accessible, :title,:tags,:content)
#more_courses.each do |course|
#  Course.create!(course)
#end




list = ['web', 'android', 'beginner']
list = ['web', 'android','ruby', 'beginner', 'intermediate', 'advanced']

list.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
end
@a = Course.create(:title => "Introduction to HTML5", :content => "Javascript without the javascript")
@a.tag_list.add('web')
@a.tag_list.add('beginner')
@a.save
@b = Course.create(:title => "Android Programming", :content => "One million devices and a lot of bad software")
@b.tag_list.add('android')
@b.tag_list.add('advanced')
@b.save
@c = Course.create(:title => "Ruby on Rails", :content => "DHH smells of axe body spray")
@c.tag_list.add('beginner')
@c.tag_list.add('ruby')
@c.save
