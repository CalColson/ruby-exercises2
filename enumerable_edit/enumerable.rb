#!/usr/bin/ruby

module Enumerable

	def my_each
		for item in self
			yield(item)
		end
		self
	end

	def my_each_with_index
		index = 0
		for item in self
			yield(item, index)
			index += 1
		end
		self
	end

	def my_select
		selections = []
		self.my_each do |item|
			selections << item if yield(item)
		end
		selections
	end

	def my_all?
		self.my_each do |item|
			return false if !yield(item)
		end
		return true
	end

	def my_any?
		self.my_each do |item|
			return true if yield(item)
		end
		return false
	end

	def my_none?
		self.my_each do |item|
			return false if yield(item)
		end
		return true
	end

	def my_count
		count = 0
		self.my_each {count += 1}
		count
	end

	def my_map(&proc)
		array = []
		self.my_each do |item|
			if proc != nil
				array << yield(item)
			elsif block_given?
				array << proc.call(item)
			else
				array = self
			end
		end
		array
	end

	def my_inject
		total = nil
		first_iteration = true
		self.my_each do |item|
			total ||= item
			total = yield(total, item) if !first_iteration
			first_iteration = false
		end
		total
	end

	def multiply_els
		self.my_inject do |prod, n|
			prod * n
		end
	end
end