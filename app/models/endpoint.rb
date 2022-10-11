class Endpoint < ApplicationRecord
  validates_presence_of :path
  validates :path , format: {with: /\/[a-z0-9]+$/i, :multiline => true}
  
  validates_presence_of :verb
  DEFAULT_VERBS = ["GET", "PUT", "POST", "PATCH", "DELETE", "HEAD", "CONNECT", "OPTIONS", "TRACE"]
  validates_inclusion_of :verb, in: DEFAULT_VERBS

  has_one :response, required: true, dependent: :destroy
  accepts_nested_attributes_for :response
end
