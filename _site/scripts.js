$(document).ready(function(){

  $('#calculate').click(function(e){
    e.preventDefault()

    var minCompletion = 0.725
    var minGpa = 2.0
    var bPoints = 3.0

    var institutionalGpa = $('#institutional_gpa').val()
    var institutionalCredits = $('#institutional_credits').val()
    var qualityPoints = institutionalGpa * institutionalCredits

    var totalEarnedCredits = $('#total_earned_credits').val()
    var totalAttemptedCredits = $('#total_attempted_credits').val()

    function creditsNeededGpa() {
      var creditsNeeded = ((minGpa * institutionalCredits - qualityPoints) / (1 - minGpa/bPoints)) / bPoints
      creditsNeeded = parseInt(creditsNeeded + 0.99)
      if (creditsNeeded > 0) {
        return creditsNeeded
      } else {
        return "Student is meeting requirement"
      }
    }

    function creditsNeededCompletion() {
      var creditsNeeded = ((minCompletion * totalAttemptedCredits) - totalEarnedCredits) / (1 - minCompletion)
      creditsNeeded = parseInt(creditsNeeded + 0.99)
      if (creditsNeeded > 0) {
        return creditsNeeded
      } else {
        return "Student is meeting requirement"
      }
    }


    $('#minimum_credits_for_gpa').html(creditsNeededGpa)
    $('#minimum_credits_for_completion').html(creditsNeededCompletion)

  })

})
//
// minimum_credits = ((min_phrs * @total_attempted_credits) - @total_earned_credits) / (1 - min_phrs)
// minimum_credits = (minimum_credits + 0.99).to_i #round up to nearest int
// minimum_credits
