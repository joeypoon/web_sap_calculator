class Student < ActiveRecord::Base
  attr_reader :min_gpa, :min_phrs

  def initialize *args
    super
    @min_gpa = 2.0
    @min_phrs = 0.725
    if args.empty?
      @institutional_gpa = 0
      @institutional_credits = 0
      @total_earned_credits = 0
      @total_attempted_credits = 0
    else
      calculate_sap(args.first)
    end
  end

  def calculate_sap args
    @institutional_gpa = args[:institutional_gpa].to_f
    @institutional_credits = args[:institutional_credits].to_f
    @total_earned_credits = args[:total_earned_credits].to_f
    @total_attempted_credits = args[:total_attempted_credits].to_f
  end

  def credits_needed_for_min_gpa
    if @institutional_gpa >= min_gpa
      0
    else
      calculate_b_needed
    end
  end

  def credits_needed_for_min_phrs
    if @total_attempted_credits == 0 || ((@total_earned_credits / @total_attempted_credits) >= min_phrs)
      0
    else
      credits_needed_for_phrs
    end
  end

  def quality_points
    @institutional_credits * @institutional_gpa
  end

  def calculate_b_needed
    b_points = 3.0
    credits_needed_if_all_b = ((min_gpa * @institutional_credits - quality_points) / (1 - min_gpa/b_points)) / b_points
    (credits_needed_if_all_b + 0.99).to_i
  end

  def credits_needed_for_phrs
    minimum_credits = ((min_phrs * @total_attempted_credits) - @total_earned_credits) / (1 - min_phrs)
    minimum_credits = (minimum_credits + 0.99).to_i #round up to nearest int
    minimum_credits
  end

end
