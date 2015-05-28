class Project < ActiveRecord::Base
  has_many :tag_projects
  has_many :tags, through: :tag_projects
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  validates :name,
    presence: true, uniqueness: true
end
