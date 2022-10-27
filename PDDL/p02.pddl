(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc21 loc12 loc22 loc32 loc42 loc23 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc22)
    (not (hero-holds))

    ; Locationg <> Corridor Connections
    (path c2122 loc21 loc22)
    (path c1222 loc12 loc22)
    (path c2232 loc22 loc32)
    (path c3242 loc32 loc42)
    (path c2223 loc22 loc23)
    
    (cor-connected-to c2122 loc21)
    (cor-connected-to c2122 loc22)
    (cor-connected-to c1222 loc12)
    (cor-connected-to c1222 loc22)
    (cor-connected-to c2232 loc22)
    (cor-connected-to c2232 loc32)
    (cor-connected-to c3242 loc32)
    (cor-connected-to c3242 loc42)
    (cor-connected-to c2223 loc22)
    (cor-connected-to c2223 loc23)

    ; Key locations
    (key-at key1 loc21) ; green
    (key-at key2 loc12) ; rainbow
    (key-at key3 loc22) ; purple
    (key-at key4 loc23) ; yellow

    ; Locked corridors
    (is-locked c2122)
    (how-cor-locked c2122 purple)
    
    (is-locked c1222)
    (how-cor-locked c1222 yellow)
    
    (is-locked c2232)
    (how-cor-locked c2232 yellow)
    
    (is-locked c3242)
    (how-cor-locked c3242 rainbow)
    
    (is-locked c2223)
    (how-cor-locked c2223 green)
    

    ; Risky corridors
    ;n/a

    ; Key colours
    (key-col key1 green)
    (key-col key2 rainbow)
    (key-col key3 purple)
    (key-col key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (key-usable key1)
    (one-use-key key1)
    
    (key-usable key2)
    (one-use-key key2)
    
    (key-usable key3)
    (one-use-key key3)
    
    (key-usable key4)
    (two-use-key key4)
    


  )
  (:goal
    (and
      (hero-at loc42)
    )
  )

)