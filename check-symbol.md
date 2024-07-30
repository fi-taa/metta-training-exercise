## Detailed Loop Invariant Explanation for `Check-Symbol`

### Initialization

The base case of the recursion handles an empty tree (`NilNode`). At this point, the function correctly determines that the symbol is not present, returning `False`.

```lisp
(= (Check-Symbol NilNode $Symbol) False)
```

Here, the invariant holds because an empty tree cannot contain any symbols, so the result is False.

### Maintenance

For a non-empty tree represented by (TreeNode $root $left $right), the function checks if the root of the current tree matches the symbol. If it does, the function returns True. If not, the function recursively checks the left and right subtrees for the symbol. The invariant is maintained because the function correctly propagates the search down the tree, returning True if the symbol is found in any subtree, or False if it is not.

```lisp
(= (Check-Symbol (TreeNode $root $left $right) $Symbol)
   (if (== $root $Symbol)
       True
       (or (Check-Symbol $left $Symbol)
           (Check-Symbol $right $Symbol)
        )
    )
)
```

The invariant holds at each step of the recursion because the function correctly checks the root and subtrees, ensuring the symbol is found if it exists in the tree.

### Termination

When the recursion terminates, the base case of NilNode is reached, and the function correctly returns False, indicating the symbol is not present. For non-empty trees, the recursive calls have correctly searched the entire tree, and the final result indicates whether the symbol is present.

## Summary

- Initialization: The base case of the recursion (NilNode) correctly returns False since an empty tree cannot contain any symbols.
- Maintenance: Each recursive call to Check-Symbol correctly checks the root and subtrees, maintaining the invariant by ensuring the symbol is found if it exists in the tree.
- Termination: The final result of the recursion correctly reflects whether the symbol is present in the tree, confirming the correctness of the algorithm.

Example Test Cases

Test Case 1:

```lisp
! (Check-Symbol NilNode B)
```
    - Initialization: The tree is empty (NilNode), so the function correctly returns False.

Test Case 2:

```lisp
! (Check-Symbol (TreeNode A (TreeNode B NilNode NilNode) (TreeNode C NilNode NilNode)) d)
```

    - Initialization: The tree is non-empty.
    - Maintenance: The function first checks if the root A matches d (it doesn't). Then, it recursively checks the left subtree (TreeNode B NilNode NilNode) and the right subtree (TreeNode C NilNode NilNode). Neither subtree contains d.
    - Termination: The function correctly returns False as the symbol d is not found in the tree.