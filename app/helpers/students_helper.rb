module StudentsHelper

#   module Validations
#
#   private
#
#   def is_int? input
#     if (Integer(input) rescue nil) != input.to_i
#       return false
#     else
#       return true
#     end
#   end
#
#   def is_float? input
#     if (Float(input) rescue nil) != input.to_f
#       return false
#     else
#       return true
#     end
#   end
#
# end

#
#   module GpaCalculation
#
#   private
#
#   MINIMUM_GPA = 2.0
#   B_POINTS = 3.0
#   A_POINTS = 4.0
#   #What do I need to calculate gpa?
#   #total credits attempted at institution
#   #institutional GPA
#   #GPA * credits = quality points
#   #Min = 2.0
#   #quality points / credits = GPA
#   #currentQP + x / credits + x/(3 or 4)(As or Bs) = 2.0
#   def get_institutional_credits
#     begin
#       puts "\nPlease enter institutional credits attempted: "
#       @institutional_credits = gets.chomp
#     end until is_float? @institutional_credits
#     @institutional_credits = @institutional_credits.to_f
#   end
#
#   def get_institutional_gpa
#     begin
#       puts "\nPlease enter institutional GPA: "
#       @institutional_gpa = gets.chomp
#     end until is_float? @institutional_gpa
#     @institutional_gpa = @institutional_gpa.to_f
#   end
#
#   def calculate_quality_points
#     @quality_points = @institutional_credits * @institutional_gpa
#     return @quality_points
#   end
#
#   def set_gpa_status
#     calculate_quality_points
#     if @institutional_gpa < MINIMUM_GPA
#       @gpa_status = true
#     else
#       @gpa_status = false
#     end
#   end
#
#   def calculate_b_needed
#     @b_needed = ((MINIMUM_GPA * @institutional_credits - @quality_points) / (1 - MINIMUM_GPA/B_POINTS)) / B_POINTS
#     if @b_needed.to_i == @b_needed
#       return @b_needed
#     else
#       return @b_needed.to_i + 1
#     end
#   end
#
#   def calculate_a_needed
#     @a_needed = ((MINIMUM_GPA * @institutional_credits - @quality_points) / (1 - MINIMUM_GPA/A_POINTS)) / A_POINTS
#     if @a_needed.to_i == @a_needed
#       return @a_needed
#     else
#       return @a_needed.to_i + 1
#     end
#   end
#
# end

#
#  module PhrsCalculation
#
#   private
#
#   MINIMUM_PERCENTAGE = 0.725 #Minimum completion percentage required
#
#   def get_earned_credits
#     begin
#       puts "\nPlease enter total credits earned: "
#       @earned_credits = gets.chomp
#     end until is_float? @earned_credits
#     @earned_credits = @earned_credits.to_f
#   end
#
#   def get_attempted_credits
#     begin
#       puts "\nPlease enter total credits attempted: "
#       @attempted_credits = gets.chomp
#     end until is_float? @attempted_credits
#     @attempted_credits = @attempted_credits.to_f
#   end
#
#   def calculate_completion_percentage
#     @completion_percentage = @earned_credits / @attempted_credits
#     return @completion_percentage
#   end
#
#   def set_phrs_status #phrs = percentage hours
#     if calculate_completion_percentage < MINIMUM_PERCENTAGE
#       @phrs_status = true
#     else
#       @phrs_status = false
#     end
#   end
#
#   def calculate_minimum_credits
#     @minimum_credits = ((MINIMUM_PERCENTAGE * @attempted_credits) - @earned_credits) / (1 - MINIMUM_PERCENTAGE)
#     @minimum_credits = (@minimum_credits + 1).to_i #round up to nearest int
#     return @minimum_credits
#   end
#
# end

end
