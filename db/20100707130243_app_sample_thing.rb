class AppSampleThing < ActiveRecord::Migration
  def self.up
    create_table :app_sample_things do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down

    drop_table :app_sample_things
  end
end
