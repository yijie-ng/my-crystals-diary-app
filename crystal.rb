class Crystal
  attr_reader :name, :type, :shop, :price
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @shop = attributes[:shop]
    @price = attributes[:price]
  end
end
