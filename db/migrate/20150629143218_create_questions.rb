class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :name
      t.integer :survey_id
      t.string :category

      t.timestamps
    end
  end
end
