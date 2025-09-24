let map = https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/List/map.dhall

let concat = https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/Text/concat.dhall

let Role = < Teacher | TA | Student >

let User = 
  { name : Text
  , pullRequestsMade : Natural
  , role : Role 
  }

let userInfo = ./info.dhall

-- Take a list of users and return it in CSV format
let toCSV: List User -> Text = 
  -- TODO: Define the column names here
  let columnNames: Text = "<COLUMNS HERE>"
  let formatRow: User -> Text =
    -- TODO: Define how user fields should be printed.
    \(user: User) -> "<FORMATTED USER HERE>" ++ "\n"
  in
  \(users: List User) ->
    columnNames ++ "\n" ++
    concat (map User Text formatRow users)

in toCSV userInfo
