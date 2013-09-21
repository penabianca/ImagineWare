class CreateHospitals < ActiveRecord::Migration
  def up
    create_table 'hospitals' do |t|
      t.string 'name'
      t.string 'city'
      t.text   'description'
      t.datetime 'creation_date'
      #add field that let rails 
      #keep track of when hospitals 
      #are added or modified:
      t.timestamps
    end
  end


  def down
    drop_table 'hospitals' # delete the whole 
    #table and all data!
  end
end
