require 'spec_helper'

describe Oxymoron do
  describe '.configuration' do
    it 'returns instance of Configuration' do
      expect(Oxymoron.configuration).to be_a Oxymoron::Configuration
    end

    it 'has getter' do
      expect(Oxymoron).to respond_to :configuration
    end

    it 'has setter' do
      expect(Oxymoron).to respond_to :configuration=
    end
  end

  describe '.configure' do
    it 'yields configuration' do
      yielded_instance = nil

      Oxymoron.configure { |config| yielded_instance = config }

      expect(yielded_instance).to be_a Oxymoron::Configuration
    end
  end
end