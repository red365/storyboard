json.extract! story, :id, :title, :actor, :action, :objective, :notes, :how_to_test, :definition_of_done, :estimate, :completion_time, :completed, :created_at, :updated_at
json.url story_url(story, format: :json)
