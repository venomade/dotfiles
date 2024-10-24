map global normal n j
map global normal N J
map global normal <a-n> <a-j>
map global normal <a-N> <a-J>
map global normal e k
map global normal E K
map global normal i l
map global normal I L
map global normal <a-i> <a-l>
map global normal <a-I> <a-L>

map global normal j n
map global normal J N
map global normal <a-j> <a-n>
map global normal <a-J> <a-N>
map global normal l i
map global normal <a-l> <a-i>
map global normal <a-L> <a-I>

map global normal k e
map global normal K E
map global normal <a-e> <a-k>
map global normal <a-k> <a-e>
map global normal <a-E> <a-K>
map global normal <a-K> <a-E>

# Select whole lines when moving selection with J or K
# map global normal n j<a-x>
# map global normal e k<a-x>

# Make I insert before every line
map global normal L "<a-s>I"

# Goto Mode
map global goto n j -docstring 'buffer end'
map global goto e k -docstring 'buffer top'
map global goto i l -docstring 'line end'
