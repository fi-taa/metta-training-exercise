; put you code here
(: List Type)
(: NilList List)
(: Cons (-> Symbol List List))

(: Member? (-> Symbol List Bool))
(: Reverse (-> List List))
(: Length (-> List Number))

;; Membership Check
(= (Member? $Symbol NilList) False)
(= (Member? $Symbol (Cons $head $tail))
   (or (== $Symbol $head)
       (Member? $Symbol $tail)))

;; Reverse
(= (Reverse NilList) NilList)
(= (Reverse (Cons $head $tail))
   (Reverse-Helper $tail (Cons $head NilList)))

(: Reverse-Helper (-> List List List))
(= (Reverse-Helper NilList $acc) $acc)
(= (Reverse-Helper (Cons $head $tail) $acc)
   (Reverse-Helper $tail (Cons $head $acc)))

;; Length
(= (Length NilList) 0)
(= (Length (Cons $head $tail))
   (+ 1 (Length $tail)))

! (Member? B (Cons A (Cons B (Cons C NilList))))
! (Reverse (Cons A (Cons B (Cons C NilList))))
! (Length (Cons A (Cons B (Cons C NilList))))


