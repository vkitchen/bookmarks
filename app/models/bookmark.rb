# frozen_string_literal: true

class Bookmark < ApplicationRecord
  validates :url, presence: true
end
