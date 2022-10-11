class Response < ApplicationRecord
  belongs_to :endpoint
  serialize :headers, Hash
  validates_presence_of :code
end
