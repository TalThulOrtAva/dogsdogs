#Features added:

Features you'll go mutts over!

## Allow dogs to be associated with an owner.

Assumptions:
- An owner can have many dogs.
- A dog can have one owner.
- I am taking the text in the current app that reads "Add your dog" to
mean that the users are in fact the dog owners in question.
- We do not currently have information on who owns these other dogs,
so that will need to be backfilled once we get the info.

## Add pagination to index of dogs.

Assumptions:
- Should be configurable.
- Should be backwards compatible (so I'll make a new route.)
