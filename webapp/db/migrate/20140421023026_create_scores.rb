class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
			t.string :source
			t.integer :score
			t.integer :stype
			t.references :user

      t.timestamps
    end
  end
end
