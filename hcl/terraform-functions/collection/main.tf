

# alltrue Function
# Checks if all elements in a list are true.
# Syntax: alltrue(list)
# Arguments: list - The list of boolean values to check.

output "all_true_check" {
  value = alltrue([true, true, true])
}

# anytrue Function
# Checks if any elements in a list are true.
# Syntax: anytrue(list)
# Arguments: list - The list of boolean values to check.

output "any_true_check" {
  value = anytrue([true, false, false])
}

# chunklist Function
# Splits a list into chunks of a specified size.
# Syntax: chunklist(list, chunk_size)
# Arguments: list - The list to split into chunks.
#            chunk_size - The size of each chunk.

output "chunked_lists" {
  value = chunklist(var.list_of_numbers, 3)
}

# coalesce Function
# Returns the first non-null value from a list of values.
# Syntax: coalesce(values)
# Arguments: values - The list of values to evaluate.

output "coalesced_value" {
  value = coalesce(null, 1, null, 2)
}

# coalescelist Function
# Returns the first non-empty list from a list of lists.
# Syntax: coalescelist(lists)
# Arguments: lists - The list of lists to evaluate.

output "coalesced_list" {
  value = coalescelist([], [1, 2], [3, 4])
}

# compact Function
# Removes null and empty values from a list.
# Syntax: compact(list)
# Arguments: list - The list to remove null and empty values from.

output "compacted_list" {
  value = compact([1, null, "", 2, 3, null, 4])
}

# concat Function
# Concatenates multiple lists together.
# Syntax: concat(list1, list2, ...)
# Arguments: list1, list2, ... - The lists to concatenate.

output "concatenated_lists" {
  value = concat([1, 2], [3, 4], [5, 6])
}

# contains Function
# Checks if a list contains a specified value.
# Syntax: contains(list, value)
# Arguments: list - The list to search.
#            value - The value to search for.

output "value_in_list" {
  value = contains(var.list_of_numbers, 3)
}

# distinct Function
# Removes duplicate values from a list.
# Syntax: distinct(list)
# Arguments: list - The list to remove duplicates from.

output "unique_values" {
  value = distinct([1, 2, 2, 3, 3, 3])
}

# element Function
# Returns the element at a specified index in a list.
# Syntax: element(list, index)
# Arguments: list - The list to retrieve the element from.
#            index - The index of the element to retrieve.

output "element_at_index" {
  value = element([1, 2, 3], 1)
}

# flatten Function
# Flattens a list of lists into a single list.
# Syntax: flatten(list_of_lists)
# Arguments: list_of_lists - The list of lists to flatten.

output "flattened_list" {
  value = flatten(var.list_of_lists)
}

# index Function
# Returns the index of a specified value in a list.
# Syntax: index(list, value)
# Arguments: list - The list to search.
#            value - The value to search for.

output "index_of_value" {
  value = index([1, 2, 3], 2)
}

# keys Function
# Returns the keys of a map as a list.
# Syntax: keys(map)
# Arguments: map - The map whose keys are to be returned.

output "map_keys" {
  value = keys(var.map_data)
}

# length Function
# Returns the length of a list or map.
# Syntax: length(collection)
# Arguments: collection - The list or map whose length is to be returned.

output "list_length" {
  value = length(var.list_of_numbers)
}

# tolist Function
# Creates a list from a set of values.
# Syntax: tolist(values)
# Arguments: values - The values to include in the list.

output "new_list" {
  value = tolist([1, 2, 3])
}

# lookup Function
# Looks up a value in a map by its key.
# Syntax: lookup(map, key, default)
# Arguments: map - The map to search.
#            key - The key to search for.
#            default - The default value to return if the key is not found.

output "lookup_result" {
  value = lookup(var.map_data, "key2", "default_value")
}

# tomap Function
# Creates a map from a set of key-value pairs.
# Syntax: tomap({ key1 = value1, key2 = value2, ... })
# Arguments: key1, value1, key2, value2, ... - The key-value pairs to include in the map.

output "new_map" {
  value = tomap({
    key1 = "value1",
    key2 = "value2"
  })
}




# range Function
# Generates a sequence of numbers within a specified range.
# Syntax: range(start, stop, step)
# Arguments: start - The starting value of the range.
#            stop - The end value of the range.
#            step - The increment between numbers (optional, default is 1).

output "number_range" {
  value = range(1, 5)
}

# reverse Function
# Reverses the elements of a list.
# Syntax: reverse(list)
# Arguments: list - The list to reverse.

output "reversed_list" {
  value = reverse([1, 2, 3])
}

# setintersection Function
# Computes the intersection of multiple sets.
# Syntax: setintersection(set1, set2, ...)
# Arguments: set1, set2, ... - The sets to compute the intersection.

output "intersection_set" {
  value = setintersection([1, 2, 3], [2, 3, 4], [3, 4, 5])
}

# setproduct Function
# Computes the Cartesian product of multiple sets.
# Syntax: setproduct(set1, set2, ...)
# Arguments: set1, set2, ... - The sets to compute the Cartesian product.

output "cartesian_product" {
  value = setproduct([1, 2], [3, 4])
}

# setsubtract Function
# Computes the difference between two sets.
# Syntax: setsubtract(set1, set2)
# Arguments: set1 - The set to subtract from.
#            set2 - The set to subtract.

output "difference_set" {
  value = setsubtract([1, 2, 3, 4], [2, 3])
}

# setunion Function
# Computes the union of multiple sets.
# Syntax: setunion(set1, set2, ...)
# Arguments: set1, set2, ... - The sets to compute the union.

output "union_set" {
  value = setunion([1, 2, 3], [2, 3, 4], [3, 4, 5])
}

# slice Function
# Returns a subset of elements from a list.
# Syntax: slice(list, start, length)
# Arguments: list - The list to slice.
#            start - The starting index of the slice.
#            length - The length of the slice.

output "sliced_list" {
  value = slice([1, 2, 3, 4, 5], 1, 3)
}

# sort Function
# Sorts a list of values.
# Syntax: sort(list)
# Arguments: list - The list to sort.

output "sorted_list" {
  value = sort([3, 1, 2])
}

# sum Function
# Computes the sum of values in a list.
# Syntax: sum(list)
# Arguments: list - The list of values to sum.

output "sum_of_values" {
  value = sum([1, 2, 3, 4, 5])
}



# values Function
# Returns the values of a map as a list.
# Syntax: values(map)
# Arguments: map - The map whose values are to be returned.

output "map_values" {
  value = values(var.map_data)
}

# zipmap Function
# Creates a map from two lists, one for keys and one for values.
# Syntax: zipmap(keys, values)
# Arguments: keys - The list of keys.
#            values - The list of values.

output "zipped_map" {
  value = zipmap(["key1", "key2", "key3"], ["value1", "value2", "value3"])
}














/**
# matchkeys Function
# Filters a map to include only keys that match a specified pattern.
# Syntax: matchkeys(map, pattern)
# Arguments: map - The map to filter.
#            pattern - The pattern to match against keys.

output "matched_keys" {
  value = matchkeys(var.map_data, "key[12]", keys(var.map_data))
}



# one Function
# Returns the first non-null value from a list of values.
# Syntax: one(values)
# Arguments: values - The list of values to evaluate.

output "first_non_null_value" {
  value = one([null, null, null, 2])
}
# transpose Function
# Transposes a list of lists.
# Syntax: transpose(list_of_lists)
# Arguments: list_of_lists - The list of lists to transpose.

output "transposed_list" {
  value = transpose([[1, 2, 3], [4, 5, 6]])
}

*/