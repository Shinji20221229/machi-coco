class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :last_name, null: false
      t.string :farst_name, null: false
      t.string :email, null: false,default: ""
      t.string :encrypted_password, null: false, defoult: ""

      t.timestamps
    end
  end
end
