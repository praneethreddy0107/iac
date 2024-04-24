# Numeric Functions Examples

# Numeric functions:
# - min: Returns the minimum value from a list of numbers.
#   Syntax: min(number1, number2, ...)
output "min_value" {
  value = min(var.num_list...)
}

# - max: Returns the maximum value from a list of numbers.
#   Syntax: max(number1, number2, ...)
output "max_value" {
  value = max(var.num_list...)
}

# - abs: Returns the absolute value of a number.
#   Syntax: abs(number)
#   Argument: number - The number whose absolute value is to be returned.
output "abs_value" {
  value = abs(var.number)
}

# - ceil: Returns the smallest integer greater than or equal to a number.
#   Syntax: ceil(number)
#   Argument: number - The number to be rounded up.
output "ceiled_values" {
  value = [for num in var.num_list : ceil(num)]
}

# - floor: Returns the largest integer less than or equal to a number.
#   Syntax: floor(number)
#   Argument: number - The number to be rounded down.
output "floored_values" {
  value = [for num in var.num_list : floor(num)]
}

# - pow: Returns the result of raising the first argument to the power of the second argument.
#   Syntax: pow(base, exponent)
#   Arguments: base - The base number.
#              exponent - The exponent.
output "pow_values" {
  value = [for num in var.num_list : pow(num, 2)] # Squaring each number in the list
}

# - signum: Returns the sign of a number (-1 for negative, 0 for zero, 1 for positive).
#   Syntax: signum(number)
#   Argument: number - The number whose signum is to be returned.
output "signum_value" {
  value = signum(var.number)
}

# - parseint: Parses a string as an integer with a specified base.
#   Syntax: parseint(string, base)
#   Arguments: string - The string to be parsed.
#              base - The base of the number system to use.
output "parsed_int_value" {
  value = parseint("100", 10) # Parsing the specified number as a base 10 integer
}

# - log: Returns the logarithm of a number with a specified base.
#   Syntax: log(base, number)
#   Arguments: base - The base of the logarithm.
#              number - The number whose logarithm is to be calculated.
output "log_value" {
  value = log(50, 10) # Logarithm of the specified number with base 10
}
