require 'pry'

holiday_hash = {
   :winter => {
     :christmas => ["Lights", "Wreath"],
     :new_years => ["Party Hats"]
   },
   :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
   },
   :fall => {
     :thanksgiving => ["Turkey"]
   },
   :spring => {
     :memorial_day => ["BBQ"]
   }
 }
def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #    :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
   #}
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, supplies|
    holiday_hash[:winter][holiday] << supply
    #binding.pry
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
    supplies_array = []
  holiday_hash[:winter].each do |holiday, supplies|
    supplies_array << supplies
    #binding.pry

  end
    supplies_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_puts = ""
  holiday_hash.each do |season, holiday_info|
    puts "#{season}:".capitalize
    holiday_info.each do |holiday, supplies|
      holiday_format = "#{holiday}".split("_").map{|item| item.capitalize}.
        join(" ")
        #holiday_puts = holiday_puts.join(" ")
        holiday_puts = "  #{holiday_format}: "
        supplies.each_with_index do |supply, index|
          if index == 0
            holiday_puts = holiday_puts + "#{supply}"
          else
            holiday_puts += ", #{supply}"
          end

        end #end of supplies.each


      #binding.pry
      puts holiday_puts
      holiday_puts = " "
    end


  end

end

#all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  return_array = []
  holiday_hash.each do |season, holiday_info|
    holiday_info.each do |holiday, supplies|
      supplies.each do |supply|
        if supply == "BBQ"
          return_array << holiday
        end
      end

      #binding.pry

    end

  end
return_array

end

#all_holidays_with_bbq(holiday_hash)
