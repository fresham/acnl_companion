require "rails_helper"
require "yaml_seeds"

RSpec.describe YAMLSeeds do
  let(:rails_attributes) { %w{id created_at updated_at} }
  let(:fish_attributes) { attributes_for_list(:fish, 3) }

  describe ".load" do
    context "with a fish YAML seed" do
      before(:example) do
        allow(YAML).to receive(:load_file).and_return(fish_attributes)
      end

      it "creates the corresponding Fish objects" do
        expect { YAMLSeeds.load }.to change { Fish.count }.by(3)
      end
    end
  end

  describe ".dump" do
    context "with Fish objects in the database" do
      let(:fish_yaml) { fish_attributes.as_json.to_yaml }
      
      before(:example) do
        fish_attributes.each { |attributes| create(:fish, attributes) }
      end

      it "creates the proper YAML file" do
        expect(File).to receive(:write).with("db/seeds/fish.yml", fish_yaml)
        YAMLSeeds.dump
      end
    end
  end
end
