class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :csv
      t.string :title

      t.timestamps
    end
  end
end
