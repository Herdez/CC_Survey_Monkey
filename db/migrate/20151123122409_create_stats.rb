class CreateStats < ActiveRecord::Migration
  def change
  	create_table :stats do |t|
  		t.integer :responder_id
  		t.integer :survey_id
  		t.integer :choice
  		t.integer :question_id

  		t.timestamps
  	end
  end
end
