class Token
  def initialize(type)
    @type = type
  end

  attr_reader :type

  def queen?
    @type == 'Q'
  end
  
  def empty?
    @type == '_'
  end
end