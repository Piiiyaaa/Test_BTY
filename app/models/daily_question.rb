class DailyQuestion < ApplicationRecord
  belongs_to :post

  validates :body, presence: true
  validates :question_answer, presence: true
end
