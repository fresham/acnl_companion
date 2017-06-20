class YAMLSeed
  MODELS = {
    Fish: [ :name ]
  }

  def initialize( model_name )
    @model_name = model_name.to_s
  end

  def file
    "db/seeds/#{@model_name.downcase.pluralize}.yml"
  end

  def model
    @model_name.constantize
  end

end
