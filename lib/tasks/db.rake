require 'yaml_seed'

namespace :db do
  namespace :seed do
    desc "dump important models to YAML files"
    task dump: [ :environment ] do
      models = {
        Fish => [ :name ]
      }

      YAMLSeed::MODELS.each do |model_name, fields|
        seed = YAMLSeed.new( model_name )
        data = seed.model.select( *fields ).map { |object| object.attributes.except('id') }

        File.write( seed.file, data.to_yaml )
      end
    end
  end
end
