class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, presence: true
  validates :body, presence: true

  VALID_STATUSES = ["public", "private", "archived"]

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == "archived"
  end
end
