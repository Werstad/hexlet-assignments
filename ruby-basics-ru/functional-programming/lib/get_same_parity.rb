# frozen_string_literal: true

# BEGIN
def get_same_parity(list)
    res = []
    if !list.empty?
        res = list.filter {|num| num.even? == list[0].even?}
    end
    res
end
# END
