class MovieComment < ApplicationRecord
  validates :user_id,  presence: {:message => "需要登陆" }
  belongs_to :movie
  belongs_to :user

end
