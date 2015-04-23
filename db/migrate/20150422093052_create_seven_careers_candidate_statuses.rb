class CreateSevenCareersCandidateStatuses < ActiveRecord::Migration
  def change
    create_table :seven_careers_candidate_statuses do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
