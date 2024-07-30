(: Tree Type)
(: NilNode Tree)
(: TreeNode (-> Symbol Tree Tree Tree))

(: maxDepth (-> Tree Number))
(: max (-> Number Number Number))

(= (maxDepth NilNode) 0)
(= (maxDepth (TreeNode $root $left $right))
   (+ 1 (max (maxDepth $left) (maxDepth $right))))

(= (max $a $b) (if (> $a $b) $a $b))

!(maxDepth NilNode)
!(maxDepth (TreeNode A (TreeNode B NilNode NilNode) (TreeNode C NilNode NilNode)))
