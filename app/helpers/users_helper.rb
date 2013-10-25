module UsersHelper
  def exercise_date_range(date)
    "#{format_date(start_date(date))} - #{format_date(date)}"
  end

  def exercise_date_days(date)
    initial = start_date(date)
    days = []
    7.times do 
      days << initial
      initial += 1.day
    end
    days
  end

  def start_date(date)
    date - 6.days
  end

  def format_date(date)
    date.strftime("%m-%d-%Y")
  end
end
