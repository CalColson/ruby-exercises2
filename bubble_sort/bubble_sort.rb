def bubble_sort(array)
	return puts 'empty array error' if array.empty?

	last_index = array.length - 1
	last_index.times do
		sorted = true
		i = 0
		while i < last_index 
			if array[i] > array[i + 1]
				sorted = false
				swap(array, i, i + 1)
			end
			i += 1
		end
		break if sorted
		last_index -= 1
	end
	p array
end

def bubble_sort_by(array)
	return puts 'empty array error' if array.empty?

	last_index = array.length - 1
	last_index.times do
		sorted = true
		i = 0
		while i < last_index 
			if yield(array[i], array[i + 1]) == 1
				sorted = false
				swap(array, i, i + 1)
			end
			i += 1
		end
		break if sorted
		last_index -= 1
	end
	p array
end

def swap(array, i, j)
	sub = array[i]
	array[i] = array[j]
	array[j] = sub
end


array = gets.chomp.split(' ')
#bubble_sort(array)
bubble_sort_by(array) do |this, that|
	this.length <=> that.length
end