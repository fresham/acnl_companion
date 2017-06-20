module YAMLSeeds
  MODELS = {
    Fish: [ :name ]
  }

  def self.load
    each_model do |model, seed_file, fields|
      YAML.load_file(seed_file).each do |attributes|
        model.create(attributes)
      end
    end
  end

  def self.dump
    each_model do |model, seed_file, fields|
      data = model.select(*fields).map { |object| object.attributes.except('id') }
      File.write(seed_file, data.to_yaml)
    end
  end

  private

  def self.each_model
    MODELS.each do |model_name, fields|
      model = model_name.to_s.constantize
      seed_file = "db/seeds/#{model_name.to_s.downcase.pluralize}.yml"

      yield(model, seed_file, fields)
    end
  end
end
