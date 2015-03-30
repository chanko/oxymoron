require 'spec_helper'

describe Oxymoron::Configuration do
  describe '#initialize' do
    it 'initializes tmp_folder_path' do
      expect(subject.tmp_folder_path).to eq '/tmp'
    end
  end

  describe '#tmp_folder_path' do
    it 'has getter' do
      expect(subject).to respond_to :tmp_folder_path
    end

    it 'has setter' do
      expect(subject).to respond_to :tmp_folder_path=
    end
  end
end