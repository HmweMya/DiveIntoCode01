class AddColumnsToQs < ActiveRecord::Migration
  def change
    add_column :qs, :title, :string
    add_column :qs, :content, :text
    add_column :qs, :user_id, :integer
    add_column :qs, :category, :string
    add_column :qs, :language, :string
  end
end
