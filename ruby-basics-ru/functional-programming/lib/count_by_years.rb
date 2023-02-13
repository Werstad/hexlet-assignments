# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  men = users.filter { |u| u[:gender] == 'male' }
  years = men.map { |u| u[:birthday][0, 4] }

  years.each_with_object({}) do |year, acc|
    acc[year] ||= 0
    acc[year] += 1
    #acc
  end
end
# END
