​(clear-all)
​
(define-model game-of-nine
    
;(sgp :v nil :esc t :lf .6 :bll 0.5 :ans 0.4 :rt 1.1 :ncnar nil)
​
​(chunk-type move claim strategy my-move
(chunk-type move type strategy mns bid-diff op-move my-move)
(chunk-type game-state type-move my-mns op-mns my-bid-diff op-bid-diff op-move my-move op-final)
(chunk-type game-end )
(chunk-type goal state strategy my-mns)
​
(add-dm
 (claim1 ISA claim strategy coop my-move 0)
 (bid1 ISA move type bid strategy coop bid-diff 3 op-move -2 my-move -2)
 (bid2 ISA move type bid strategy coop bid-diff 2 op-move -2 my-move -2)
 (bid3 ISA move type bid strategy coop bid-diff 2 op-move -1 my-move -1)
 (bid4 ISA move type bid strategy coop bid-diff 1 op-move -1 my-move -1)
 (bid5 ISA move type bid strategy coop bid-diff 3 op-move 0 my-move -1)
 (bid6 ISA move type bid strategy coop bid-diff 1 op-move 0 my-move 0)
 (decision1 ISA move type decision strategy coop bid-diff 1 op-move -1 my-move reject)
 (decision2 ISA move type decision strategy coop bid-diff 2 op-move -1 my-move reject)
; so coop never accepts??
 (opening1 ISA move type opening strategy coop mns 1 op-move 6 my-move 5)
 (opening2 ISA move type opening strategy coop mns 4 op-move 6 my-move 6)
 (opening3 ISA move type opening strategy coop mns 1 op-move 5 my-move 5)
 (opening4 ISA move type opening strategy coop mns 4 op-move 8 my-move 7)
 (claim2 ISA claim strategy agg my-move 1)
 (bid7 ISA move type bid strategy agg bid-diff 3 op-move 1 my-move 0)
 (bid8 ISA move type bid strategy agg bid-diff 2 op-move 1 my-move 0)
 (decision3 ISA move type decision strategy agg bid-diff 1 op-move -1 my-move reject)
 (decision4 ISA move type decision strategy agg bid-diff 2 op-move -1 my-move accept)
 (final-offer1 ISA move type final-offer strategy agg bid-diff 2 op-move 0 my-move 0)
 (final-offer2 ISA move type final-offer strategy agg bid-diff 3 op-move 0 my-move -1)
 (opening5 ISA move type opening strategy agg mns 1 op-move 8 my-move 9)
 (opening6 ISA move type opening strategy agg mns 4 op-move 6 my-move 7)
 (opening7 ISA move type opening strategy agg mns 1 op-move 7 my-move 8)
 (opening8 ISA move type opening strategy agg mns 4 op-move 7 my-move 8)
 (quit1 ISA move type quit strategy agg bid-diff 2 op-move 1 my-move quit)
 (bid9 ISA move type bid strategy neutral bid-diff 2 op-move -2 my-move -1)
 (bid10 ISA move type bid strategy neutral bid-diff 3 op-move -1 my-move -1)
 (bid11 ISA move type bid strategy neutral bid-diff 1 op-move -1 my-move 0)
 (bid12 ISA move type bid strategy neutral bid-diff 3 op-move 0 my-move 0)
 (bid13 ISA move type bid strategy neutral bid-diff 2 op-move 0 my-move 0)
 (final-offer3 ISA move type final-offer strategy neutral bid-diff 1 op-move 0 my-move 0)
 (final-offer4 ISA move type final-offer strategy neutral bid-diff 2 op-move 0 my-move -1)
 (decision5 ISA move type decision strategy neutral bid-diff 1 op-move -1 my-move accept)
 (decision6 ISA move type decision strategy neutral bid-diff 0 op-move -1 my-move reject)
 (opening9 ISA move type opening strategy neutral mns 3 op-move 7 my-move 7)
 (quit2 ISA move type quit strategy neutral mns 1 bid-diff 0 op-move 0 my-move quit)
 (goal isa goal state start strategy neutral)
 (reject) (accept) (quit) (coop) (agg) (neutral) (bid) (decision) (opening) (claim)
 (final-offer) (quit))
​
; TODO: is the MNS of the player visible to the model before making the claim?
(P start-game
   =goal>
      ISA         goal
      state       start
	strategy	=s
   =action>
	ISA		game-state
	my-mns	=m-mns
==>
   =goal>
      state       claim
	my-mns	=m-mns
   +retrieval>
	ISA		move
	type		claim
	strategy	=s
   -action>
)

; note: partial matching allowed for claims (no claim for neutral but that can change)
(P make-claim
   =goal>
	ISA		goal
	state		claim
   =retrieval>
	ISA		move
	type		claim
	my-move	=move
==>
   =goal>
	state		update
   +action>
	ISA		game-state
	type-move	claim
	my-move	=move
)​


(P start-opening
   =goal>
	ISA		goal
	state		bid
	strategy	=s
	my-mns	=m-mns
   =action>
	ISA		game-state
	my-bid-diff	nil
	op-move	=o-move
==>
   +retrieval>
	ISA		move
	type		opening
	strategy	=s
	mns		=m-mns
	op-move	=o-move
   -action>	
)

(P start-bid
   =goal>
	ISA		goal
	state		bid
	strategy	=s
   =action>
	ISA		game-state
	my-bid-diff	=m-diff
	op-move	=o-move
	op-final	no
==>
   +retrieval>
	ISA		move
	- type	opening
	- type	decision
	strategy	=s
	bid-diff	=m-diff
	op-move	=o-move
   -action>	
)

(P start-decision
      =goal>
	ISA		goal
	state		bid
	strategy	=s
   =action>
	ISA		game-state
	my-bid-diff	=m-diff
	op-move	=o-move
	op-final	yes
==>
   +retrieval>
	ISA		move
	type		decision
	strategy	=s
	bid-diff	=m-diff
	op-move	=o-move
   -action>	
)

(P make-move
   =goal>
	ISA		goal
	state		bid
   =retrieval>
	ISA		move
	type		=t
	my-move	=m-move
==>
   +action>
	ISA		game-state
	type		=t
	my-move	=m-move
   =goal>
	state		update
)

(P get-strategy
   =goal>
	ISA		goal
	state		update
   =action>
	ISA		game-state
	op-mns	=o-mns
	op-bid-diff	=o-bid-diff
	op-move	=o-move
	my-move	=m-move
   ?retrieval>
	state		empty
==>
   +retrieval>
	ISA		move
	mns		=o-mns
	bid-diff	=o-bid-diff
	op-move	=m-move
	my-move	=o-move
)

(P update-strategy
   =goal>
	ISA		goal
	state		update
   =retrieval>
	ISA		move
	strategy	=s
==>
   =goal>
	state		bid
	strategy	=s
)


(set-all-base-levels 100000 -1000)
(goal-focus goal)
​
)