# frozen_string_literal: true

class Folder < ApplicationRecord
  belongs_to :category
  has_many :articles
end
