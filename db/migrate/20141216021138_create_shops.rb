class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string 'name'
      t.string 'floor'
      t.string 'category'
      t.references 'mall'
      t.timestamps
    end
  end
end
