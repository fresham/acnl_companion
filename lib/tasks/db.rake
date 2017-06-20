require "yaml_seeds"

namespace :db do
  namespace :seed do
    desc "dump important models to YAML files"
    task dump: [ :environment ] do
      YAMLSeeds.dump
    end
  end
end
