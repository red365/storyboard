class AddReferenceBetweenDomainAndStories < ActiveRecord::Migration[5.1]
  def change
    add_reference :stories, :domain, foreign_key: true
  end
end
