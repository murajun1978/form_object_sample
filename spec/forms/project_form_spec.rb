require 'rails_helper'

RSpec.describe ProjectForm do
  example 'initialize' do
    expect(ProjectForm.new).to be_a Project
    expect(ProjectForm.new(name: 'project')).to be_a Project
  end

  describe 'validations' do
    let(:with_2_tags) { ProjectForm.new(name: 'test', tags: create_list(:tag, 2)) }
    let(:with_3_tags) { ProjectForm.new(name: 'test', tags: create_list(:tag, 3)) }
    let(:project) { ProjectForm.new(name: 'test', tags: [tag, tag]) }
    let(:tag) { create(:tag) }

    example 'tags count' do
      expect(with_2_tags).to be_valid
      expect(with_3_tags).to be_invalid
    end

    example 'tag uniqueness' do
      expect(project).to be_invalid
    end
  end
end
