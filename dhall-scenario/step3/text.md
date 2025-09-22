It is also possible to write functions in Dhall, this can make defining repetitive structures like the ones found in Step 1's JSON file much easier.

A function look something like the following:

```haskell
funcName : Param1Type -> Param2Type -> ResultType
    = \(param1: Param1Type) ->
      \(param2: Param2Type) ->
        ... func body ...
```

Let us create a function which creates users, such as the ones found in `info.json`. But first, let's define what a user is explicitly. One suggestion can be found in `User.dhall`, which can be viewed by running

`batcat -l haskell User.dhall`{{exec}}

We have defined the name as `Text`, the # of PRs as `Natural` (since we can't have a negative number of PRs), and the role as `<  Teacher | TA | Student >`, i.e. a union of specific options. This captures the wanted behavior. We can now create a function which creates a user:


```haskell
let Role = < Teacher | TA | Student >

makeUser : Text -> Natural -> Role -> User
    = \(name : Text) ->
      \(pullRequestsMade : Natural) ->
      \(role : Role) ->
        -- A user is a record of a name, # of PRs, and a role
        { name, pullRequestsMade, role }
```

We can now use the function to create a Dhall file which represents the same content as `info.json`, but as a Dhall file.  A template has been given for this purpose in `info.dhall`, with the same errors as in Step 1. Since we have static typing in Dhall, any statement which doesn't correspond to the given type will fail the type checking and throw an error. Thus you can run the following command and fix the entries until it prints the wanted output.

`dhall --file ./info.dhall`{{exec}}

To remember the correct values you can look back at your corrected JSON file:

`batcat info.json`{{exec}}

## A single source of truth

This is all well and good, we can create configuration files that have some kind of static check to ensure type correctness. But the systems you use might not support Dhall, it might only support the aforementioned JSON.

However, Dhall comes with a tool that can be used to translate from Dhall, to JSON. Thus we can have type safety in our JSON files, by outsourcing their generation to Dhall. Running the following command will generate the same JSON as seen in `info.json`:

`dhall-to-json --file dhall.info`{{exec}}

You are able to proceed to the next step if you have successfully fixed `info.dhall`.