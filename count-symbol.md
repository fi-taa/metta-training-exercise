## Detailed Loop Invariant Explanation for `Count-Symbol`

### Initialization

The base case of the recursion handles an empty tree (`NilNode`). In this scenario, the count of any symbol is correctly determined to be `0`.

```lisp
(= (Count-Symbol NilNode $Symbol) 0)
```

Here, the invariant holds because an empty tree cannot contain any symbols, so the count is 0.

### Maintenance

For a non-empty tree represented by (TreeNode $root $left $right), the function counts occurrences of the symbol $Symbol as follows:

- It first checks if the root symbol $root matches $Symbol.
- If it matches, it adds 1 to the count.
- It then recursively counts occurrences of $Symbol in the left and right subtrees.
- The total count is the sum of counts from the left and right subtrees, plus 1 if the root matches the symbol.

```lisp
(= (Count-Symbol (TreeNode $root $left $right) $Symbol)
   (if (== $root $Symbol)
       (+ 
            1 
            (+ 
                (Count-Symbol $left $Symbol) 
                (Count-Symbol $right $Symbol)
            )
        )
       (+ 
            (Count-Symbol $left $Symbol) 
            (Count-Symbol $right $Symbol)
        )
    )
)
```

The invariant holds at each step of the recursion because:

- If the root matches the symbol, the function correctly includes 1 in the count.
- It accurately counts occurrences of the symbol in both the left and right subtrees.
- It maintains the correct total count by summing these values.

### Termination

When the recursion terminates, it has processed all nodes in the tree. For the base case of NilNode, the function correctly returns 0, indicating that there are no instances of the symbol in an empty tree. For non-empty trees, the function returns the total count of the symbol in the tree by combining counts from the root and both subtrees.

## Summary

- Initialization: The base case of the recursion (NilNode) correctly returns 0 since an empty tree has no symbols.
- Maintenance: Each recursive call to Count-Symbol correctly counts occurrences of the symbol in the root and subtrees, maintaining the invariant by adding up counts.
- Termination: The final result of the recursion correctly reflects the total count of the symbol in the tree, confirming the correctness of the algorithm.

Example Test Cases

Test Case 1:

```lisp
! (Count-Symbol NilNode B)
```

    - Initialization: The tree is empty (NilNode), so the function correctly returns 0.

Test Case 2:

```lisp
! (Count-Symbol (TreeNode A (TreeNode B NilNode NilNode) (TreeNode B NilNode NilNode)) B)
```
    - Initialization: The tree is (TreeNode A (TreeNode B NilNode - NilNode) (TreeNode B NilNode NilNode)).
    - Maintenance: The function finds B in the left and right subtrees of the root A. Both subtrees contain one instance of B.
    - Termination: The function correctly returns 2 as the symbol B is found twice in the tree.