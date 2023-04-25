require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "|                      -------------------------------                               |"
puts "|               BIENVENUE À TOUS CHERS SPECTATEURS !                                 |"
puts "| Vous connaissez les regles du jeux dans l'arene des Gobelins Fletrissants :        |"
puts "|               IL N'Y A PAS DE REGLES !!! MOUAHAHAHAHA!                             |"
puts "| Le dernier combattant qui reussi à bouger ses petits orteils repartira vainqueur!  |"
puts "|                      -------------------------------                               |"
print "\n"
puts "EH MAIS... EH ! Toi !"
puts "Oui, TOI la ! Qu'est-ce que tu fais ici? C'est une arene pour les gobelins, retourne manger tes ordures..."
puts "Ah... Hein!?? Quoi!? Tu es ici pour combattre...? POUAHAHAHAHAHAH"
puts "Tres bien, alors vas-y, inscris-toi, tu feras un bon échauffement pour les vrais combattants."
puts "C'est quoi ton nom?"

ennemies = []

player_1 = HumanPlayer.new(gets.chomp)

ennemies << ennemie_1 = Player.new("Josiane")
ennemies << ennemie_2 = Player.new("José")



while (ennemie_1.life_points > 0 || ennemie_2.life_points > 0) && player_1.life_points > 0
  puts "\n"
  player_1.show_state
  ennemie_1.show_state
  ennemie_2.show_state
  puts "\n"
  puts "\n"
  puts "|                      -------------------------------                               |"
  puts "                         Quelle action veux-tu effectuer?"
  puts "                       a - Chercher une meilleure arme"
  puts "                       s - Chercher à se soigner"
  puts "                       Attaquer un joueur en vue :"
  puts "                       0 - #{ennemie_1.name} a #{ennemie_1.life_points} points de vie"
  puts "                       1 - #{ennemie_2.name} a #{ennemie_2.life_points} points de vie"
  puts "|                      -------------------------------                               |"
  puts "\n"
  puts "\n"
  input = gets.chomp
    case input
    when 'a'
      player_1.search_weapon
    when 's'
      player_1.search_health_pack
    when '0'
      player_1.attacks(ennemie_1)
    when '1'
      player_1.attacks(ennemie_2)
    when "exit"
      exit
    else
      puts "Grnnn... C'est quoi ça?? Je n'ai pas compris ce que tu veux faire..."
      input = gets.chomp
    end

  puts "Ahahah', maintenant #{ennemie_1.name} et #{ennemie_2.name} se ruent sur toi !"

  ennemies.each do |ennemie|
    if ennemie.life_points > 0
      ennemie.attacks(player_1)
    end
  end
end

puts "Et bah... C'était vraiment pas beau à voir."
puts player_1.life_points <= 0 ? "Je l'avais prévenu pourtant... Bon. L'humain est mort, AUX SUIVANTS !" : "L'HUMAIN EST VAINQUEUR ! T'es surprenant comme petit gars, mais la prochaine fois que tu ramenes une arme secrete ici, on te zigouille !"
