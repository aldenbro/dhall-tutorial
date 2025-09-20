# Planning

## Step 1
This is a JSON file that records teachers, TAs and students for the DevOps course.
For each person, we have a given name, role and email.
The roles can be "Teacher", "TA" or "Student".
The emails are school emails, and always formatted as `<name>@mail.com`.

```json
{
    {
        "name": "Larissa",
        "role": "Teacher",
        "email": "larissa@mail.com"
    },
    {
        "name": "Eric",
        "role": "TA",
        "email": "eric@mail.com"
    },
    {
        "name": "Sofia",
        "role": "TA",
        "email": "sofia@mail.com"
    },
    {
        "name": "David",
        "role": "Student",
        "email": "david@mail.com"
    },
    {
        "name": "Herdi",
        "role": "Student",
        "email": "herdi@mail.com"
    }
}
```

Edit the JSON and extend it with your own credentials!

## Step 2

Intro to Dhall
* Type safety/typing
* Enums
* Functions

## Step 3

```haskell
let Role = < Teacher | TA | Student >

let makeUser =
      \(name : Text) ->
      \(role : Role) ->
        { name = name
        , role = role
        , email = "${name}@mail.com"
        }

in  [ makeUser "Larissa" Role.Teacher
    , makeUser "Eric" Role.TA
    , makeUser "Sofia" Role.TA
    , makeUser "David" Role.Student
    , makeUser "Herdi" Role.Student
    ]
```


```haskell
let Role = < Teacher | TA | Student >

let User : Type =
      { name : Text
      , role : Role
      , email : Text
      }

let makeUser : Text -> Role -> User =
      \(name : Text) ->
      \(role : Role) ->
        { name = name
        , role = role
        , email = "${name}@mail.com"
        }

in  [ makeUser "Larissa" Role.Teacher
    , makeUser "Eric" Role.TA
    , makeUser "Sofia" Role.TA
    , makeUser "David" Role.Student
    , makeUser "Herdi" Role.Student
    ]
    : List User
```

## Step 4

The DevOps course has decided to migrate to YAML, and you now have to convert the JSON to YAML. Fortunately this is a breeze, since you are using Dhall.

* Create a YAML
* Create a CSV, by defining how it should look
```haskell


```

## Step 5

Canonical forms
* How do we check equivalence between all three config files?
* Define canonical form and use it to check!