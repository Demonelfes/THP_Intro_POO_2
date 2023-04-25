class Player
  attr_accessor :name
  attr_accessor :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state()
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage_taken)
    @life_points -= damage_taken
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué."
      @life_points = 0
    end
  end

  def attacks(attacked_player)
    damage_dealt = 0

    puts "#{@name} attaque le joueur #{attacked_player.name}."
    damage_dealt = compute_damage
    puts "#{name} a infligé #{damage_dealt} points de dommage à #{attacked_player.name}."
    attacked_player.gets_damage(damage_dealt)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player_name)
    super(player_name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    if new_weapon_level > @weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la gardes avec toi."
      @weapon_level = new_weapon_level
    else
      puts "C'est une crotte de chien ou une arme...? Elle n'est pas mieux que ton arme actuelle. Tu la laisses par terre."
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
    case health_pack_found
    when 1
      puts "Tu n'as rien trouve..."
    when 2..5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
    when 6
      puts  "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end

