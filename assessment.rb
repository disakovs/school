module ModuleOne; end
module ModuleTwo; end

class Clothes
  def cloth(color)
    puts "I am #{color} piece of clothing"
  end
end

class TShirt < Clothes 
  include ModuleOne
  include ModuleTwo 
end

p TShirt.ancestors 