require 'dry-auto_inject'
require 'dry-container'
require 'active_support'

class DependenciesContainer
  extend Dry::Container::Mixin

  register 'cache', memoize: true do
    ActiveSupport::Cache::MemoryStore.new
  end
end

Dependencies = Dry::AutoInject(DependenciesContainer)
