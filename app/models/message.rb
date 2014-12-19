class Message < ActiveRecord::Base
  validate :content, presence: true
end
