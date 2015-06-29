class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :survey_id
      t.string :email
      t.string :employee_id
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
