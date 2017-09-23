class AddReferenceBetweenProjectsAndDomains < ActiveRecord::Migration[5.1]
  def change
    add_reference :domains, :project, foreign_key: true
  end
end
