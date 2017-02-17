class Ingredient < ApplicationRecord
  before_destroy(:present_elsewhere?)
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  private
  def present_elsewhere?
    self.doses.count == 0
  end

end
