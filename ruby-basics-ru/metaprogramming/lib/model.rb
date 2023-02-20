# # frozen_string_literal: true

# # BEGIN
require 'date'

module Model
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def attribute(name, type:, default: nil)
      define_method "#{name}" do
        instance_variable_get "@#{name}"
      end

      define_method "#{name}=" do |value|
        value = convert(type, value)
        attributes[name.to_sym] = value
        instance_variable_set "@#{name}", value
      end

      @scheme ||= {}
      @scheme[name] = { type: type, default: default }
    end

    def scheme
      @scheme
    end
  end

  def initialize(attributes={})
    @attributes = {}
    self.class.scheme.each do |name, options|
      value = attributes[name] ? attributes[name] : options[:default]
      puts options
      send "#{name}=", value
      @attributes[name.to_sym] = send("#{name}")
    end
  end

  def attributes
    @attributes
  end

  def convert(type, value)
    return nil if value == nil
    if type == :integer
      value.to_i
    elsif type == :datetime
      DateTime.parse(value)
    elsif type == :string
      value.to_s
    else
      value
    end
  end

end
# # END
