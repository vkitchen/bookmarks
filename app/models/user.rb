# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  has_secure_password
end
