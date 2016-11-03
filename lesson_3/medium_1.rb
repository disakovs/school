#1

string = "The Flinstones Rock!"

(0..9).each { |spaces| puts (' ' * spaces) + string }

statement = "The Flintstones Rock"

letters = statement.gsub(" ", "").split('')

final_hash = letters.each_with_object({}) do |letter, hash|
  hash[letter] ? hash[letter] += 1 : hash[letter] = 1
end

p final_hash

def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

p titleize("hello people")

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |key, _|
  if munsters[key]["age"] < 17
    munsters[key]["age_group"] = "kid"
  elsif munsters[key]["age"] < 64
    munsters[key]["age_group"] = "adult"
  else
    munsters[key]["age_group"] = "senior"
  end
end
