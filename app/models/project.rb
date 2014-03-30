class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { in: 4..50 }, uniqueness: true
end
