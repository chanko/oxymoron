require 'spec_helper'

describe Oxymoron::LocalResource do
  let(:uri) { URI.parse 'http://test.dev/file.jpg' }
  let(:resource) { Oxymoron::LocalResource.new(uri) }
  let(:io_file) { StringIO.new }

  before do
    allow_any_instance_of(URI).to receive(:open).and_return(io_file)
  end

  describe '#initialize' do
    it 'initializes uri to passed in param' do
      expect(resource.uri).to eq uri
    end
  end

  describe '#uri' do
    it 'has getter' do
      expect(resource).to respond_to :uri
    end

    it 'does not have setter' do
      expect(resource).to_not respond_to :uri=
    end
  end

  describe '#tmp_folder' do
    it 'returns Configuration tmp_folder_path' do
      expect(Oxymoron).to receive_message_chain(:configuration, :tmp_folder_path)

      resource.tmp_folder
    end
  end

  describe '#tmp_filename' do
    context 'without querystring params' do
      it 'returns correct filename' do
        expect(resource.tmp_filename).to eq ['file', '.jpg']
      end
    end

    context 'with querystring params' do
      let(:uri) { URI.parse 'http://test.dev/params.jpg?param=test' }

      it 'returns correct filename' do
        expect(resource.tmp_filename).to eq ['params', '.jpg']
      end
    end
  end

  describe '#encoding' do
    it 'returns ascii-8 encoding for empty file' do
      expect(resource.encoding).to eq Encoding.find('ascii-8bit')
    end

    it 'returns utf-8 encoding' do
      io_file.write('This is a test') # sets encoding to utf-8

      expect(resource.encoding).to eq Encoding.find('utf-8')
    end
  end

  describe '#io' do
    it 'calls open on uri' do
      expect(resource.uri).to receive(:open)

      resource.io
    end
  end

  describe '#file' do
    it 'returns Tempfile instance' do
      expect(resource.file).to be_a Tempfile
    end

    it 'calls new on Tempfile with correct params' do
      expect(Tempfile).to receive(:new).with(resource.tmp_filename, resource.tmp_folder, encoding: resource.encoding).and_call_original

      resource.file
    end
  end
end