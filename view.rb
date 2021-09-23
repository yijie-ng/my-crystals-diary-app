class View
  def display(crystals)
    crystals.each do |crystal|
      puts "#{crystal.id}. #{crystal.name}, Type: #{crystal.type}, Shop: #{crystal.shop}, $#{crystal.price}"
    end
  end
end
