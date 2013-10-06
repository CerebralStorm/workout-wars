module Nickname

  def self.get_nickname
    adjetives = []
    File.open("#{Rails.root}/public/assets/adjetives.txt").each_line do |line|
      adjetives << line    
    end

    nouns = []
    File.open("#{Rails.root}/public/assets/nouns.txt").each_line do |line|
      nouns << line    
    end 

    [adjetives[rand(adjetives.length)].strip.titleize, nouns[rand(nouns.length)].strip.titleize].join(" ")
  end

end