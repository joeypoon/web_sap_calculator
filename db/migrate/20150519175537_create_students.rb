class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.float :institutional_gpa
      t.float :institutional_credits
      t.float :total_earned_credits
      t.float :total_attempted_credits

      t.timestamps null: false
    end
  end
end
