(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc31 loc12 loc22 loc32 loc42 loc23 loc33 loc24 loc34 loc44 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc12)
    (not (hero-holds))

    ; Locationg <> Corridor Connections
    (path c3132 loc31 loc32)
    (path c1222 loc12 loc22)
    (path c2232 loc22 loc32)
    (path c3242 loc32 loc42)
    (path c2223 loc22 loc23)
    (path c3233 loc32 loc33)
    (path c2333 loc23 loc33)
    (path c2324 loc23 loc24)
    (path c3334 loc33 loc34)
    (path c2434 loc24 loc34)
    (path c3444 loc34 loc44)
    
    (cor-connected-to c3132 loc31)
    (cor-connected-to c3132 loc32)
    (cor-connected-to c1222 loc12)
    (cor-connected-to c1222 loc22)
    (cor-connected-to c2232 loc22)
    (cor-connected-to c2232 loc32)
    (cor-connected-to c3242 loc32)
    (cor-connected-to c3242 loc42)
    (cor-connected-to c2223 loc22)
    (cor-connected-to c2223 loc23)
    (cor-connected-to c3233 loc32)
    (cor-connected-to c3233 loc33)
    (cor-connected-to c2333 loc23)
    (cor-connected-to c2333 loc33)
    (cor-connected-to c2324 loc23)
    (cor-connected-to c2324 loc24)
    (cor-connected-to c3334 loc33)
    (cor-connected-to c3334 loc34)
    (cor-connected-to c2434 loc24)
    (cor-connected-to c2434 loc34)
    (cor-connected-to c3444 loc34)
    (cor-connected-to c3444 loc44)

    ; Key locations
    (key-at key1 loc22) ; red
    (key-at key2 loc42) ; rainbow
    (key-at key3 loc24) ; yellow
    (key-at key4 loc44) ; purple

    ; Locked corridors
    (is-locked c3132)
    (how-cor-locked c3132 rainbow)
    
    (is-locked c3242)
    (how-cor-locked c3242 purple)
    
    (is-locked c2324)
    (how-cor-locked c2324 red)
    
    (is-locked c2434)
    (how-cor-locked c2434 red)
    
    (is-locked c3444)
    (how-cor-locked c3444 yellow)
    
    ; Risky corridors
    (risky c2324)
    (risky c2434)

    ; Key colours
    (key-col key1 red)
    (key-col key2 rainbow)
    (key-col key3 yellow)
    (key-col key4 purple)
    
    ; Key usage properties (one use, two use, etc)
    (key-usable key1)  ; Red keys don't need specified use number
    
    (key-usable key2)
    (one-use-key key2)
    
    (key-usable key3)
    (two-use-key key3)
    
    (key-usable key4)
    (one-use-key key4)

  )
  (:goal
    (and
      (hero-at loc31)
    )
  )

)