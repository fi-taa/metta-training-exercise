(: Tree Type)
(: NilNode Tree)

(: TreeNode (-> Symbol Tree Tree Tree))
(: Check-Symbol (-> Tree Symbol Bool))

(= (Check-Symbol NilNode $Symbol) False)
(= (Check-Symbol (TreeNode $root $left $right) $Symbol)
    (if (== $root $Symbol)
        True
        (or (Check-Symbol $left $Symbol)
            (Check-Symbol $right $Symbol)
        )
    )
)


;; Test cases
! (Check-Symbol NilNode B) ;False
! (Check-Symbol (TreeNode A (TreeNode B NilNode NilNode) (TreeNode C NilNode NilNode)) B) ;True
! (Check-Symbol (TreeNode A (TreeNode B NilNode NilNode) (TreeNode C NilNode NilNode)) D) ;False
