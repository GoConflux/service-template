class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :conflux_id, index: true
      t.string :uuid, index: true
      t.string :plan
      t.string :url

      t.timestamps
    end
  end
end
