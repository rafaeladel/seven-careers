class AddStatusToCandidates < ActiveRecord::Migration
  def change
    add_belongs_to :seven_careers_candidates, :status
  end
end
