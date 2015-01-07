require 'spec_helper'

RSpec.describe Sprockets::Bowerrc do
  before :all do
    Sprockets::Bowerrc.send(:remove_const, "POSSIBLE_BOWER_RCS")
    Sprockets::Bowerrc::POSSIBLE_BOWER_RCS = ["/.bowerrc", "/home/.bowerrc", "/local/.bowerrc"]
  end

  before :each do
    file = class_double("File").as_stubbed_const

    allow(file).to receive(:read).with("/.bowerrc").and_return('{ "directory": "global_dir" }')
    allow(file).to receive(:read).with("/local/.bowerrc").and_return('{ "directory": "local_dir" }')
    allow(file).to receive(:read).with("/home/.bowerrc").and_return('{ "directory": "home_dir" }')
    allow(file).to receive(:absolute_path).with(".bowerrc", "/").and_return("/.bowerrc")
    allow(file).to receive(:absolute_path).with(".bowerrc", "/local").and_return("/local/.bowerrc")
    allow(file).to receive(:absolute_path).with(".bowerrc", "/home").and_return("/home/.bowerrc")
    allow(file).to receive(:absolute_path).with("local_dir").and_return("/local/local_dir")
    allow(file).to receive(:exists?).with("/.bowerrc").and_return true
    allow(file).to receive(:exists?).with("/local/.bowerrc").and_return true
    allow(file).to receive(:exists?).with("/home/.bowerrc").and_return true
  end
  describe "#bower_config" do
    it 'returns bower configurations as a hash' do
      env = Sprockets::Environment.new
      expect(env.bower_config).to be_a Hash
    end

    it 'prefers the most specific bowerrc file' do
      env = Sprockets::Environment.new
      expect(env.bower_config['directory']).to eq 'local_dir'
    end
  end

  describe "#prepend_bowerrc" do
    it "prepends the path" do
      env = Sprockets::Environment.new
      expect(env).to receive(:prepend_path).with("/local/local_dir")
      env.prepend_bowerrc
    end
  end

    describe "#append_bowerrc" do
    it "append the path" do
      env = Sprockets::Environment.new
      expect(env).to receive(:append_path).with("/local/local_dir")
      env.append_bowerrc
    end
  end
end