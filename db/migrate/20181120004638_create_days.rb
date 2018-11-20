class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :month
      t.integer :date
      t.integer :year
      t.integer :user_id
    end
  end
end
