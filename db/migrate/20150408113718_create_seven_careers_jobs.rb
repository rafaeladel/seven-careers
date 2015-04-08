class CreateSevenCareersJobs < ActiveRecord::Migration
  def change
    create_table :seven_careers_jobs do |t|
      t.string      :title
      t.text        :description
      t.timestamps null: false
    end
  end
end
