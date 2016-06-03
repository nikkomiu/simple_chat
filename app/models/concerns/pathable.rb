module Pathable
  extend ActiveSupport::Concern

  included do
    validates_presence_of   :path
    validates_uniqueness_of :path

    before_validation :parameterize_path

    def self.parameterize path
      path.downcase.strip.gsub(' ', '-')
    end
  end

  def parameterize_path
    if self.path == nil && self.has_attribute?(:name)
      self.path = self.name
    end

    self.path = self.class.parameterize(self.path)
  end
end
