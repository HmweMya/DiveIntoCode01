class CreateQs < ActiveRecord::Migration
  def change
    create_table :qs do |t|
      
      t.timestamps null: false
    end
  end
end
