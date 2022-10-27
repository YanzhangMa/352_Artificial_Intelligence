(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates
        ; one orange line of domain description is one predicate
        (path ?cor - corridor ?room1 - location ?room2 - location)
        (cor-connected-to ?cor - corridor ?loc -location) ;used in unlock precondition, there must be away to use path for this but idk
        (is-locked ?cor - corridor) ; is a corridor locked?
        (how-cor-locked ?cor - corridor ?col - colour) ; if a corridor is locked, how is it locked? 
        (risky ?cor - corridor)
        
        (key-at ?k - key ?loc - location) ; defined location of keys instead of contents of rooms.
        (key-col ?k - key ?col - colour) ; colour tells you number of uses.
        (key-usable ?k - key)
        (one-use-key ?k - key)
        (two-use-key ?k - key)
        
        (hero-holds)
        (hero-holds-which ?k - key)
        
        (hero-at ?loc - location) ; initialised as starting position
        (goal ?loc - location)

    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - wants to move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky"
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and
            (hero-at ?from)
            ; One of following paths exists: ?from>?to or ?to>?from 
            (not (and 
                (not (path ?cor ?to ?from)) 
                (not (path ?cor ?from ?to))
                ))
            (not (is-locked ?cor))
        )

        :effect (and 
        (hero-at ?to)
        (not (hero-at ?from))
        (when (how-cor-locked ?cor red) (not (path ?cor ?from ?to)))
        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and
            (hero-at ?loc)
            (key-at ?k ?loc)
            (not (hero-holds))
        )

        :effect (and
            (hero-holds-which ?k)
            (hero-holds)
            (not (key-at ?k ?loc))
        )
    )
    
     ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and
            (hero-holds-which ?k)
            (hero-at ?loc)
        )

        :effect (and
            (not (hero-holds-which ?k))
            (not (hero-holds))
            (key-at ?k ?loc)
        )
    )
    


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left, PRETENTING ALL KEYS CAN BE USED INFINITELY MANY TIMES
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and
            (hero-holds-which ?k)
            (key-usable ?k)
            (how-cor-locked ?cor ?col)
            (key-col ?k ?col)
            (hero-at ?loc)
            (cor-connected-to ?cor ?loc) ; there must be a way to use path for this but idk how
        )

        :effect (and
            (not (is-locked ?cor))
            
            ;updating key uses
            (when (two-use-key ?k) (and
                (not (two-use-key ?k)) 
                (one-use-key ?k)
            ))
            (when (one-use-key ?k) (and
                (not (one-use-key ?k))
                (not (key-usable ?k))
            ))
            
        )
    )

)