#encoding: utf-8
require 'injectable/initializer'

module Injectable

  class OtherClass
    def initialize(variable)
      @variable = variable
    end

    attr_reader :variable
  end

  class DummyClass
    include Initializer

    def initialize(variable, other_variable, overwrites = {})
      super(overwrites, variable, other_variable)
    end

    def defaults
      {
        other_class: Injectable::OtherClass.new(variable),
        some_class: Injectable::OtherClass.new(other_variable)
      }
    end
  end

  describe Initializer do
    let(:variable) { 'Some string' }
    let(:injected_class) { DummyClass.new(variable, 'somestring')}

    it 'sets variable' do
      expect(injected_class.other_class.variable).to eq(variable)
    end

    context 'when overwrite present' do

      let(:variable) { 'Some string' }
      let(:injected_class) { DummyClass.new(variable, nil, {some_class: OtherClass.new(variable)})}
      it 'sets overwrite variable' do
        expect(injected_class.some_class.variable).to eq(variable)
        expect(injected_class.other_class.variable).to eq(variable)
      end
    end

  end


end
