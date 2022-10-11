# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_many :notes
  has_many :replies
end
