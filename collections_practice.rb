require "pry"
def begins_with_r(array)
    array.all? do |word|
      word.start_with?("r")
    end

end

def contain_a(array)
  array.select do |word|
    word.include?("a")
  end

end

def first_wa(array)
  all_wa = array.select do |word|
    word[0..1] == "wa"
  end
  all_wa[0]
end

def remove_non_strings(array)
    array.select do |item|
      item.is_a?(String)
    end
end

def count_elements(array)
  collected_count = []
  unique_names = array.uniq
  name_array = unique_names.collect do |name_hash|
    name_hash[:name]
  end
  name_array.each do |word|
    count_collection = {}
    count_collection[:name] = word
    count_collection[:count] = 0
    collected_count.push(count_collection)
  end
  all_names_array = array.collect do |name_hash|
    name_hash[:name]
  end
  collected_count.each do |counter_hash|
    counter_hash[:count] = all_names_array.count(counter_hash[:name])
  end
  collected_count

end

def merge_data(keys, data)
  merged_data = []
  data[0]["blake"][:first_name] = "blake"
  data[0]["ashley"][:first_name] = "ashley"
  merged_data = data[0].values
  merged_data
end

def find_cool(data)
  data.select do |hash|
    if hash.values.include?("cool")
      return [hash]
    end
  end
end

def organize_schools(data)
  organized_schools = {}
  location_hashes = data.values
  cities_arr = location_hashes.collect do |loc|
    loc[:location]
  end
  unique_cities = cities_arr.uniq
  unique_cities.each do |city|
    organized_schools[city] = []

  end
  organized_schools #now looks like {"NYC" = [], "SF" = [], "Chi" = []
  data.keys.each do |schools|
    data[schools].each do |loc_key, loc_data|
      organized_schools.each do |city, school_arr|
        if loc_data == city
          school_arr.push(schools)
        end
      end
    end
  end
  binding.pry
  organized_schools


end
