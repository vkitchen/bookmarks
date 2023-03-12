# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
end
