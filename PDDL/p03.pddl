(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc34 loc45 loc12 loc22 loc32 loc33 loc25 loc13 loc21 loc14 loc35 loc24 loc44 loc23 loc43 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc21)
    (not (hero-holds))

    ; Locationg <> Corridor Connections
    (path c2122 loc21 loc22)
    (path c1222 loc12 loc22)
    (path c2232 loc22 loc32)
    (path c1213 loc12 loc13)
    (path c1223 loc12 loc23)    
    (path c2223 loc22 loc23)
    (path c3223 loc32 loc23)
    (path c3233 loc32 loc33)
    (path c1323 loc13 loc23)
    (path c2333 loc23 loc33)
    (path c1314 loc13 loc14)
    (path c2314 loc23 loc14)
    (path c2324 loc23 loc24)
    (path c2334 loc23 loc34)
    (path c3334 loc33 loc34)
    (path c1424 loc14 loc24)
    (path c2434 loc24 loc34)
    (path c2425 loc24 loc25)
    (path c2535 loc25 loc35)
    (path c3545 loc35 loc45)
    (path c4544 loc45 loc44)
    (path c4443 loc44 loc43)
    
    (cor-connected-to c2122 loc21)
    (cor-connected-to c2122 loc22)
    (cor-connected-to c1222 loc12)
    (cor-connected-to c1222 loc22)
    (cor-connected-to c2232 loc22)
    (cor-connected-to c2232 loc32)
    (cor-connected-to c1213 loc12)
    (cor-connected-to c1213 loc13)
    (cor-connected-to c1223 loc12)
    (cor-connected-to c1223 loc23)
    (cor-connected-to c2223 loc22)
    (cor-connected-to c2223 loc23)
    (cor-connected-to c3223 loc32)
    (cor-connected-to c3223 loc23)
    (cor-connected-to c3233 loc32)
    (cor-connected-to c3233 loc33)
    (cor-connected-to c1323 loc13)
    (cor-connected-to c1323 loc23)
    (cor-connected-to c2333 loc23)
    (cor-connected-to c2333 loc33)
    (cor-connected-to c1314 loc13)
    (cor-connected-to c1314 loc14)
    (cor-connected-to c2314 loc23)
    (cor-connected-to c2314 loc14)
    (cor-connected-to c2324 loc23)
    (cor-connected-to c2324 loc24)
    (cor-connected-to c2334 loc23)
    (cor-connected-to c2334 loc34)
    (cor-connected-to c3334 loc33)
    (cor-connected-to c3334 loc34)
    (cor-connected-to c1424 loc14)
    (cor-connected-to c1424 loc24)
    (cor-connected-to c2434 loc24)
    (cor-connected-to c2434 loc34)
    (cor-connected-to c2425 loc24)
    (cor-connected-to c2425 loc25)
    (cor-connected-to c2535 loc25)
    (cor-connected-to c2535 loc35)
    (cor-connected-to c3545 loc35)
    (cor-connected-to c3545 loc45)
    (cor-connected-to c4544 loc45)
    (cor-connected-to c4544 loc44)
    (cor-connected-to c4443 loc44)
    (cor-connected-to c4443 loc43)

    ; Key locations
    (key-at key1 loc21)
    (key-at key2 loc23)
    (key-at key3 loc23)
    (key-at key4 loc23)
    (key-at key5 loc23)
    (key-at key6 loc44)

    ; Locked corridors
    (is-locked c1223)
    (how-cor-locked c1223 red)
    
    (is-locked c2223)
    (how-cor-locked c2223 red)
    
    (is-locked c3223)
    (how-cor-locked c3223 red)
    
    (is-locked c1323)
    (how-cor-locked c1323 red)
    
    (is-locked c2333)
    (how-cor-locked c2333 red)
    
    (is-locked c2314)
    (how-cor-locked c2314 red)
    
    (is-locked c2324)
    (how-cor-locked c2324 red)
    
    (is-locked c2334)
    (how-cor-locked c2334 red)
    
    (is-locked c2425)
    (how-cor-locked c2425 purple)
    
    (is-locked c2535)
    (how-cor-locked c2535 green)
    
    (is-locked c3545)
    (how-cor-locked c3545 purple)
    
    (is-locked c4544)
    (how-cor-locked c4544 green)
    
    (is-locked c4443)
    (how-cor-locked c4443 rainbow)
  

    ; Risky corridors
    (risky c1223)
    (risky c2223)
    (risky c3223)
    (risky c1323)
    (risky c2333)
    (risky c2314)
    (risky c2324)
    (risky c2334)
    

    ; Key colours
    (key-col key1 red)
    (key-col key2 green)
    (key-col key3 purple)
    (key-col key4 green)
    (key-col key5 purple)
    (key-col key6 rainbow)

    ; Key usage properties (one use, two use, etc)
    (key-usable key1)
    
    (key-usable key2)
    (one-use-key key2)
    
    (key-usable key3)
    (one-use-key key3)
    
    (key-usable key4)
    (one-use-key key4)
    
    (key-usable key5)
    (one-use-key key5)
    
    (key-usable key6)
    (one-use-key key6)

  )
  (:goal
    (and
      (hero-at loc43)
    )
  )

)