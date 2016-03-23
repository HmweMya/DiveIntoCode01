class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :q, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
