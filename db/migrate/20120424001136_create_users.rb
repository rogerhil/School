class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 128
      t.string :email, :limit => 128, :unique => true
      t.string :password, :limit => 128
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
