# frozen_string_literal: true

# BEGIN
def anagramm_filter(string, array)
    result = []
    array.each {|el| result << el if el.chars.sort == string.chars.sort }
    result
end
# END
