#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
#
# <YOUR CODE GOES HERE>
ll.push(ARGV)

# Then, print it out
#
# <YOUR CODE GOES HERE>

ARGV.each{|arg| print("-> #{arg.inspect}")}
