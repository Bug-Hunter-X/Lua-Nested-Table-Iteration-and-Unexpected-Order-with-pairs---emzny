# Lua Nested Table Iteration Bug

This repository demonstrates a common error in Lua related to table iteration and unexpected order when using `pairs()`.  The issue arises when modifying tables within nested loops, relying on a specific order that `pairs()` doesn't guarantee.

## Problem

The `pairs()` iterator in Lua doesn't guarantee any specific order of iteration.  This means that code relying on a particular order might fail unexpectedly.

The `bug.lua` file contains an example of a function that iterates over a nested table. The expectation might be that the table is processed in a specific order; however, because of `pairs()` behavior, this is not always true and might result in unintended consequences.

## Solution

The `bugSolution.lua` file offers a solution that either avoids modification during iteration or, if modification is needed, uses an alternative approach like iterating over a sorted array of keys to ensure predictable behavior. While `pairs()` is still used, the process is done in a way that accounts for its lack of order guarantee.