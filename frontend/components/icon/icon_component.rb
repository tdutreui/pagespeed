# frozen_string_literal: true

module IconComponent
  extend ComponentHelper


  def inline_svg
    path="frontend/base/icons/#{@icon}.svg"
    file = File.open(Rails.root.join(path), "rb")
    raw file.read
  end
end
