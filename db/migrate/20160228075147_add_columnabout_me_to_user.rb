class AddColumnaboutMeToUser < ActiveRecord::Migration
  def change
    add_column :users, :about_me, :string
  end
end
