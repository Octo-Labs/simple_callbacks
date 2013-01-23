require 'spec_helper'


describe 'model validations' do

  let(:klass) { Class.new(AWS::Record::Base) }

  before(:each) do
    klass.string_attr :name
    klass.create_domain
    klass.each{|u| u.destroy }
    sleep(2)
  end

  describe 'validation callbacks' do
    describe 'before_validation' do
      it 'should fire' do
        klass.before_validation :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.valid?
      end
    end

    describe 'after_validation' do
      it 'should fire' do
        klass.after_validation :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.valid?
      end
    end

    describe 'before_create' do
      it 'should fire' do
        klass.before_create :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
      end
    end

    describe 'after_create' do
      it 'should fire' do
        klass.after_create :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
      end
    end

    describe 'before_save' do
      it 'should fire' do
        klass.before_save :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
      end
    end

    describe 'after_save' do
      it 'should fire' do
        klass.after_save :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
      end
    end

    describe 'before_update' do
      it 'should fire' do
        klass.before_update :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
        obj.name = "test2"
        obj.save
      end
    end

    describe 'after_update' do
      it 'should fire' do
        klass.after_update :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
        obj.name = "test2"
        obj.save
      end
    end


    describe 'before_destroy' do
      it 'should fire' do
        klass.before_destroy :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
        obj.destroy
      end
    end

    describe 'after_destroy' do
      it 'should fire' do
        klass.after_destroy :test_callback
        obj = klass.new :name => "test"
        obj.should_receive(:test_callback)
        obj.save
        obj.destroy
      end
    end

  end

end
