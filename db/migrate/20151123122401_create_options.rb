class CreateOptions < ActiveRecord::Migration
  def change
  	create_table :options do |t|
  		t.string :option
  		t.integer :question_id
      t.integer :survey_id
  		t.timestamps
  	end
  end
end
