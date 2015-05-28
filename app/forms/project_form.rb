class ProjectForm < Project
  validates_with TagsRegistrationValidator, maximum: 2

  def initialize(attributes=nil)
    super
  end
end
