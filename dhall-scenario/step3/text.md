```haskell
let Role = < Teacher | TA | Student >

let User
    : Type
    = { name : Text, pullRequestsMade : Natural, role : Role }

let makeUser
    : Text -> Natural -> Role -> User
    = \(name : Text) ->
      \(pullRequestsMade : Natural) ->
      \(role : Role) ->
        { name, pullRequestsMade, role }

in    [ makeUser "Larissa" 5 Role.Teacher
      , makeUser "Eric" 4 Role.TA
      , makeUser "Sofia" 3 Role.TA
      , makeUser "David" 2 Role.Student
      -- Add the final student here to complete the record
      ]
    : List User
```