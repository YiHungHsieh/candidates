class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.string :age
      t.string :integer
      t.string :politics
      t.string :text
      t.integer :votes

      t.timestamps
    end
  end
end
