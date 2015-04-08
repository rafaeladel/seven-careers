class CreateSevenCareersCandidates < ActiveRecord::Migration
  def change
    create_table :seven_careers_candidates do |t|
      t.belongs_to :job
      t.string     :name
      t.string     :email
      t.string     :phone
      t.string     :resume_path
      t.timestamps null: false
    end
  end
end
