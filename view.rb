class View
  def display(crystals)
    crystals.each do |crystal|
      puts "#{crystal.id}. #{crystal.name}, Type: #{crystal.type}, Shop: #{crystal.shop}, $#{crystal.price}"
    end
  end

  def ask_name
    puts "Crystal name?"
    print ">"
    gets.chomp
  end

  def ask_type
    puts "Crystal type?"
    print ">"
    gets.chomp
  end

  def ask_shop
    puts "Claimed from which shop?"
    print ">"
    gets.chomp
  end

  def ask_price
    puts "Price?"
    print ">"
    gets.chomp.to_i
  end

  def ask_id
    puts "ID?"
    print ">"
    gets.chomp.to_i
  end

  def ask_edit
    puts "What do you want to edit? (name/type/shop/price)"
    print ">"
    gets.chomp
  end
end
