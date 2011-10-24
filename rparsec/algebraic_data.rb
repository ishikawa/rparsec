module ADT
  def self.included(base)
    base.extend(ClassMethods)
  end

  attr_accessor :ktype  
      
  def initialize(ktype, hash_arguments)
    self.ktype = ktype
    hash_arguments.each do |key, value|
      self.class.send(:attr_accessor, key)
      self.send("#{key}=", value)
    end
    @adt_instance_variables = [:ktype] + hash_arguments.map(&:first)
  end

  def ktype?(value)
    self.ktype == value
  end
  
  def ==(other)
    @adt_instance_variables.all? do |key|
      self.send(key) == other.send(key)
    end
  end
      
  module ClassMethods  
    def constructor(arg)
      ktype, args = arg.is_a?(Hash) ? arg.first : [arg, []]
      self.send(:attr_accessor, ktype)
             
      # Define constructor in the eigenclass (define_singleton_method
      # in Ruby 1.9)
      (class << self; self; end).send(:define_method, ktype) do
    |*cargs| 
        self.new(ktype, Array(args).zip(cargs))
      end
    end
  end
end
 
class Symbol
  def ===(other)
    other.instance_variable_get("@adt_instance_variables") && 
      other.ktype == self || super 
  end
end
