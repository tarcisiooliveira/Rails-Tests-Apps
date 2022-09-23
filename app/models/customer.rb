# frozen_string_literal: true

class Customer < ApplicationRecord
  def full_name
    "Sr. #{name}"
  end

  def upcase
    name.upcase
  end
end
