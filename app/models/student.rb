# require_relative "validations"
# require_relative "phrs_calculation"
# require_relative "gpa_calculation"
class Student < ActiveRecord::Base

  def initialize *args
    super
    calculate_sap(args.first) unless args.empty?
  end

  def calculate_sap args
    @institutional_gpa = args[:institutional_gpa]
    @institutional_credits = args[:institutional_credits]
    @total_earned_credits = args[:total_earned_credits]
    @total_attempted_credits = args[:total_attempted_credits]
  end

  def check_sap
    @notice = "Success!"
  end

  #
  # include Validations
  # include PhrsCalculation
  # include GpaCalculation
  #
  # def initialize(institutional_gpa=0, institutional_credits=0, total_earned_credits=0, total_attempted_credits=0)
  #   @institutional_gpa = institutional_gpa
  #   @institutional_credits = institutional_credits
  #   @total_earned_credits = total_earned_credits
  #   @total_attempted_credits = total_attempted_credits
  # end
  #
  # def check_sap
  #   check_gpa
  #   check_phrs
  # end
  #
  # private
  #
  # def check_gpa
  #   get_institutional_credits
  #   get_institutional_gpa
  #   set_gpa_status
  #   if @gpa_status == true
  #     puts "\nStudent needs " + calculate_b_needed.to_s + " credits at all Bs or " + calculate_a_needed.to_s + " credits at all As."
  #   else
  #     puts "\nStudent is meeting GPA requirements."
  #   end
  # end
  #
  # def check_phrs
  #   get_earned_credits
  #   get_attempted_credits
  #   set_phrs_status
  #   if @phrs_status == true
  #     puts "\nStudent needs " + calculate_minimum_credits.to_s + " credits to reach the minimum completion percentage."
  #   else
  #     puts "\nStudent is meeting completion percentage requirements."
  #   end
  # end

end
