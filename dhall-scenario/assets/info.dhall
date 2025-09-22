let User = ./User.dhall

let Role = < Teacher | TA | Student >

let makeUser
    : Text -> Natural -> Role -> User
    = \(name : Text) ->
      \(pullRequestsMade : Natural) ->
      \(role : Role) ->
        { name, pullRequestsMade, role }

in    [ makeUser "Larissa" None Role.Teacher
      , makeUser "Eric" 4 Role.TA
      , makeUser "Sofia" 3 Role.Outside_Resource
      , makeUser "David" 2 Role.Student
      , makeUser "Herdi" -1 Role.Student
      ]
    : List User