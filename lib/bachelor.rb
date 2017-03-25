require 'pry'
# require 'json'
#
# def hash
#   JSON.parse(File.read('spec/fixtures/contestants.json'))
# end

def get_first_name_of_season_winner(data, season)
  name = ""
  data[season].each do |dict|
    name = dict["name"] if dict["status"] == "Winner"
  end
  name.split[0]
end

def get_contestant_name(data, occupation)
  data.each do |season, array|
    array.each do |dict|
      return dict["name"] if dict["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, array|
    array.each do |dict|
      count += 1 if dict["hometown"] == hometown
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season, array|
    array.each do |dict|
      return dict["occupation"] if dict["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data[season].each do |dict|
    str_age = dict["age"]
    int_age = str_age.to_f
    age_array.push(int_age)
  end
  sum = 0
  age_array.each do |x|
    sum = sum + x
  end
  avg = (sum / age_array.count).round
end

# data = hash
# season = "season 10"
# puts get_average_age_for_season(data, season)
