require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many :tag_projects }
  it { should have_many(:tags).through(:tag_projects) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should accept_nested_attributes_for(:tags).allow_destroy(true) }
end
