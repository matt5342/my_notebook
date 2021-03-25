class Chapter < ApplicationRecord
  belongs_to :notebook
  has_many :pages

end
