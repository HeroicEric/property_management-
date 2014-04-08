class Building < ActiveRecord::Base
  validates :address, presence: true
  validates :city, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :state, presence: true, inclusion: { in: %w{ NJ MA NY } }
  validates :postal_code, presence: true, length: { is: 5 }, numericality: { only_integer: true }

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'Building'
end
