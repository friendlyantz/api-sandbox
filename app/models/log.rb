class Log < ApplicationRecord
  validates :content, format: { with: /\d+/,  message: "only allows num" }
end
