every :day, :at => '12am' do 
  runner "Competition.compute_winners_for_date_based_competitions"
end