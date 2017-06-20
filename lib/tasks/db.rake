namespace :db do
  namespace :seed do
    desc "dump important models to YAML files"
    task dump: [ :environment ] do
      models = {
        Fish => [ :name ]
      }

      models.each do |model, fields|
        seed_file = "db/seeds/#{model.to_s.downcase.pluralize}.yml"
        data = model.select( *fields ).map { |object| object.attributes.except('id') }

        File.write( seed_file, data.to_yaml )
      end
    end
  end
end
