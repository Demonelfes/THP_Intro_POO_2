require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


alexis = Player.new('Demonelfes')
paloma = Player.new('Gobelinator')
round = 1

puts "Le combat peut enfin commencer ! Voici l'état de chaque joueur :"
alexis.show_state
paloma.show_state
puts "\nPassons à la phase d'attaque :"
print "\n"
while alexis.life_points > 0 && paloma.life_points > 0
  puts "Round #{round}. Combattez !"
  print "\n"
  paloma.attacks(alexis)
  if alexis.life_points <= 0
    break
  end
  alexis.attacks(paloma)
  puts "\n-----------------------------\n"
  round += 1
end
puts alexis.life_points <= 0 ? "\nLe vainqueur est #{paloma.name} !" : "Le vainqueur est #{alexis.name} !"
binding.pry
