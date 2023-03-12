# frozen_string_literal: true

class Bookmark < ApplicationRecord
  strip_attributes

  belongs_to :user

  validates :url, presence: true
end
