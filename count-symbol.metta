(: Tree Type)
(: NilNode Tree)
(: TreeNode (-> Symbol Tree Tree Tree))
(: Count-Symbol (-> Tree Symbol Number))

(= (Count-Symbol NilNode $Symbol) 0)

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

;; Test Case
! (Count-Symbol NilNode B)
! (Count-Symbol (TreeNode A (TreeNode B NilNode NilNode) (TreeNode B NilNode NilNode)) B)
