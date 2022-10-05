# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :order
  validates :address, presence: true
  def full_name
    "Sr. #{name}"
  end

  def upcase
    name.upcase
  end
end
