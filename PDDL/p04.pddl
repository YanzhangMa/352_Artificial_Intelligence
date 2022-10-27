(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc11 loc12 loc13 loc21 loc22 loc23 loc32       loc42 loc52 loc62 loc72 - location
    c1112 c1121 c1312 c1323 c2221 c2212 c2223 c2232      c3242 c4252 c5262 c6272  - corridor
    key1 key2 key3 key4 key5 - key
  )

  (:init
    ; Hero location and carrying status
    (hero-at loc12)
    (not (hero-holds))
    
    
    ; Locationg <> Corridor Connections
    (path c1112 loc11 loc12)
    (path c1121 loc11 loc21)
    (path c1312 loc13 loc12)
    (path c1323 loc13 loc23)
    (path c2221 loc22 loc21)
    (path c2212 loc22 loc12)
    (path c2223 loc22 loc23)
    (path c2232 loc22 loc32)
    
    (path c3242 loc32 loc42)
    (path c4252 loc42 loc52)
    (path c5262 loc52 loc62)
    (path c6272 loc62 loc72)
    
        
    (cor-connected-to c1112 loc11)
    (cor-connected-to c1112 loc12)

    (cor-connected-to c1121 loc11)
    (cor-connected-to c1121 loc21)

    (cor-connected-to c1312 loc13)
    (cor-connected-to c1312 loc12)

    (cor-connected-to c1323 loc13)
    (cor-connected-to c1323 loc23)

    (cor-connected-to c2221 loc22)
    (cor-connected-to c2221 loc21)

    (cor-connected-to c2212 loc22)
    (cor-connected-to c2212 loc12)

    (cor-connected-to c2223 loc22)
    (cor-connected-to c2223 loc23)

    (cor-connected-to c2232 loc22)
    (cor-connected-to c2232 loc32)
    
    
    (cor-connected-to c3242 loc32)
    (cor-connected-to c3242 loc42)
    
    (cor-connected-to c4252 loc42)
    (cor-connected-to c4252 loc52)
    
    (cor-connected-to c5262 loc52)
    (cor-connected-to c5262 loc62)
    
    (cor-connected-to c6272 loc62)
    (cor-connected-to c6272 loc72)
    
    

    ; Key locations
    (key-at key1 loc12)
    (key-at key2 loc12)
    (key-at key3 loc12)
    (key-at key4 loc22)
    (key-at key5 loc21)
    
    ;Locked corridors
    (is-locked c1112)
    (how-cor-locked c1112 purple)
    
    (is-locked c1121)
    (how-cor-locked c1121 red)
    
    
    (is-locked c1312)
    (how-cor-locked c1312 yellow)
    
    (is-locked c1323)
    (how-cor-locked c1323 green)
    
    (is-locked c2221)
    (how-cor-locked c2221 red)
    
    (is-locked c2212)
    (how-cor-locked c2212 red)
    
    (is-locked c2223)
    (how-cor-locked c2223 yellow)
    
    (is-locked c2232)
    (how-cor-locked c2232 rainbow)
    
    ;Risky corridors
    (risky c1121)
    (risky c2221)
    (risky c2212)
    
    ;Key colours
    (key-col key1 red)
    (key-col key2 green)
    (key-col key3 yellow)
    (key-col key4 purple)
    (key-col key5 rainbow)
    
    ;Key usage properties(one use, two use, etc)
    
    (key-usable key1)
    
    (key-usable key2)
    (one-use-key key2)
    
    (key-usable key3)
    (two-use-key key3)
    
    (key-usable key4)
    (one-use-key key4)
    
    (key-usable key5)
    (one-use-key key5)
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc72)
    )
  )

)