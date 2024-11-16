# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :continent, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
