# Dhall as a programming language

## Functions in Dhall
It is also possible to write functions in Dhall. 
This can make defining repetitive structures like the ones found in Step 1's JSON file much easier.

Here is an example of a function declaration:

```haskell
let funcName : Param1Type -> Param2Type -> ResultType
    = \(param1: Param1Type) ->
      \(param2: Param2Type) ->
        ... func body ...
in funcName
```

Let us define a function that creates users, with a record format like the one in `info.json`.
But first, let's define the type of a user explicitly.
A definition can be found in `User.dhall`, which can be viewed by running:

`batcat -l haskell User.dhall`{{exec}}

We have defined the name as `Text`, the # of PRs as `Natural` (since we can't have a negative number of PRs), and the role as `< Teacher | TA | Student >`, i.e. a union of specific options. This captures the wanted behavior. We can now define a function which creates a user:

```haskell
let User = ./User.dhall

let Role = < Teacher | TA | Student >

let makeUser : Text -> Natural -> Role -> User
    = \(name : Text) ->
      \(pullRequestsMade : Natural) ->
      \(role : Role) ->
        -- A user is a record of a name, # of PRs, and a role
        { name, pullRequestsMade, role }
in makeUser
```

We can now use the function to create a Dhall file which represents the same content as `info.json`.
A template has been given for this purpose in `info.dhall`, with the same errors as in Step 1. You can view the template by running:

`batcat -l haskell info.dhall`{{exec}}

Since we have static typing in Dhall, any statement which doesn't correspond to the given type will fail the type checking and throw an error.
Thus you can run the following command and fix the entries until it prints the wanted output.

`dhall --file ./info.dhall`{{exec}}

To remember the correct values you can look back at your corrected JSON file from Step 1:

`batcat info.json`{{exec}}

## Built-in functions
Dhall also has a standard library, defined in its [Prelude](https://store.dhall-lang.org/Prelude-v23.1.0/).
Many of the prelude functions are available by default to use.
To showcase this, we define a `Human` type below.
Run the code and look at the output.

```
dhall <<< '
  let Status = < Alive | Dead >
  let Human = {age: Natural, status: Status}
  let herdi = {age = 23, status = Status.Dead}
  in "Age: ${Natural/show herdi.age}, Status: ${showConstructor herdi.status}"
  '
```{{exec}}

In this example, we used two builtin functions: `Natural/show` and `showConstructor`.
These two were used to convert the values from their type into text.
Remember these two, as they might come handy later!

## A single source of truth

This is all well and good, we can create configuration files that have some kind of static check to ensure type correctness.
But the systems you use might not support Dhall. 
It might only support the aforementioned JSON.

![A figure describing how Dhall can be transformed into JSON](https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/dhall1.svg)

However, Dhall comes with a tool that can be used to translate from Dhall to JSON.
Thus we can have type safety in our JSON files, by outsourcing their generation to Dhall.
Running the following command will generate the same JSON as seen in `info.json` using `info.dhall`:

`dhall-to-json --file info.dhall | batcat -l json`{{exec}}

### Verification

The verification will check that you have successfully fixed `info.dhall`.