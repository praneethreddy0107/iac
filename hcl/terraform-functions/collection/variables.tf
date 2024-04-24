# Collection Functions Examples

# Collection functions:
# - alltrue: Checks if all elements in a list are true.
# - anytrue: Checks if any elements in a list are true.
# - chunklist: Splits a list into chunks of a specified size.
# - coalesce: Returns the first non-null value from a list of values.
# - coalescelist: Returns the first non-empty list from a list of lists.
# - compact: Removes null and empty values from a list.
# - concat: Concatenates multiple lists together.
# - contains: Checks if a list contains a specified value.
# - distinct: Removes duplicate values from a list.
# - element: Returns the element at a specified index in a list.
# - flatten: Flattens a list of lists into a single list.
# - index: Returns the index of a specified value in a list.
# - keys: Returns the keys of a map as a list.
# - length: Returns the length of a list or map.
# - lookup: Looks up a value in a map by its key.
# - map: Creates a map from a set of key-value pairs.
# - matchkeys: Filters a map to include only keys that match a specified pattern.
# - merge: Merges multiple maps into a single map.
# - one: Returns the first non-null value from a list of values.
# - range: Generates a sequence of numbers within a specified range.
# - reverse: Reverses the elements of a list.
# - setintersection: Computes the intersection of multiple sets.
# - setproduct: Computes the Cartesian product of multiple sets.
# - setsubtract: Computes the difference between two sets.
# - setunion: Computes the union of multiple sets.
# - slice: Returns a subset of elements from a list.
# - sort: Sorts a list of values.
# - sum: Computes the sum of values in a list.
# - transpose: Transposes a list of lists.
# - values: Returns the values of a map as a list.
# - zipmap: Creates a map from two lists, one for keys and one for values.

# Define sample variables for demonstration purposes
variable "list_of_numbers" {
  description = "List of numbers for collection function examples"
  default     = [1, 2, 3, 4, 5]
}

variable "list_of_lists" {
  description = "List of lists for collection function examples"
  default     = [[1, 2], [3, 4], [5, 6]]
}

variable "map_data" {
  description = "Map data for collection function examples"
  default     = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}