mogrify
=======

The mogrify gem is a set of non-destructive transformers for enumerable objects. The tests are the best place to look for a feel of what the methods do.

symogrify
--------

Instance method on Hash, returns the same hash with all string keys converted to symbols (even keys in nested hashes).

hashmogrify
--------

Monkey patch for enumerable, takes a block and returns a hash where the key and value are the result of applying the block to the enumerable.
