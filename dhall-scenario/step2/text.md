You probably found it somewhat tedious to fix the mistakes in the JSON file, and it would have been even worse if you didn't know where to look.

Dhall is supposed to be a better way to write configuration files, alleviating some of the issues you encountered in the previous step.

This is how `info.json` would have looked like if it was a Dhall file instead:

```c
[ { name = "Larissa", pullRequestsMade = 5, role = "Teacher" }
, { name = "Eric", pullRequestsMade = 4, role = "TA" }
, { name = "Sofia", pullRequestsMade = 3, role = "TA" }
, { name = "David", pullRequestsMade = 2, role = "Student" }
, { name = "Herdi", pullRequestsMade = 1, role = "Student" }
]
```

However, how the Dhall representation would look like is not that important, as it does not highlight the strengths of the language, which presents itself as other features.

## Translation
Dhall has several translation tools which means you can convert to/from Dhall with other configuration languages, such as the aforementioned JSON. You can for example run the following code to get the Dhall output above:

`json-to-dhall --file info.json`{{exec}}

## Typing

Dhall is a typed language, which means you can specify the structure of a given record as a type, and any record given that type will be forced to abide by it.

You have been given the file `Schema.dhall`,

`cat Schema.dhall`{{exec}}

 which specifies the intended structure of the JSON file, which is that the JSON file should be a list of users. Moreover, a user is supposed to be a record that has three fields, a name consisting of text, the number of pull requests made represented as a natural number (0,1,2,...), and finally a role which can be one of three options: Teacher, TA, or Student.

Inspecting `User.dhall`

`cat Schema.dhall`{{exec}}

 we can find that we have made the definition of a user explicit with three distinctive types, `Text`, `Natural`, and `<  Teacher | TA | Student >`, which is a special type called a union type. You can use this schema when converting to Dhall.

`json-to-dhall ./Schema.dhall --file info.json`{{exec}}

One thing to note is that if you supply the program with a schema and a JSON file that does not follow the schema, the program will produce an error. This means you are guaranteed to have a schema abiding input if the program completes. It also means you can catch schema errors in you JSON files, such as the ones in Step 1. You can see this by running

`json-to-dhall ./Schema.dhall --file incorrect_info.json`{{exec}}