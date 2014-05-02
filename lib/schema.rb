require 'rom'
require 'axiom-memory-adapter'

env = ROM::Environment.setup(memory: 'memory://test')

env.schema do
  base_relation :emails do
    repository :memory

    attribute :id, Integer
    attribute :payload, Array
    attribute :from, String
    attribute :body, String

    key :id
  end
end
