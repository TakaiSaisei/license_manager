class CreateLicenses < ActiveRecord::Migration[6.1]
  def change
    create_table :licenses do |t|
      t.string :paid_till, null: false
      t.string :max_version
      t.string :min_version

      t.timestamps
    end
  end
end
