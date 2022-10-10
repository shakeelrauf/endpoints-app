class Endpoint < ApplicationRecord
  validates_presence_of :path
  validates :path , format: {with: /\/[a-z0-9]+$/i, :multiline => true}
  
  validates_presence_of :verb
  DEFAULT_VERBS = ["GET", "PUT", "POST", "PATCH", "DELETE"]
  validates_inclusion_of :verb, in: DEFAULT_VERBS
end
