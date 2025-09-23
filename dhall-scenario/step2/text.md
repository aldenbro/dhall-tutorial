You probably found it somewhat tedious to fix the mistakes in the JSON file, and it would have been even worse if you didn't know where to look.

Dhall is supposed to be a better way to write configuration files, alleviating some of the issues you encountered in the previous step.

This is how a small Dhall file looks like, without using any fancy features:

```haskell
{ age = 42, name = "Bob", weight = 13.37 }
```

It is pretty similar to how a corresponding JSON file would look like.

However, how the Dhall file looks like is not that important, as it does not highlight the strengths of the language, which presents itself as other features.

## Typing

Dhall is a typed language, which means you can specify the structure of a given record as a type, and any record given that type will be forced to abide by it.

For the aforementioned example, this would look something like the following:

```haskell
let Entity = { age : Natural, name : Text, weight : Double }

in  { age = 42, name = "Bob", weight = 13.37 } : Entity
```

If you would have given a negative number as the age, or an integer as the weight, Dhall would complain when you would try to evaluate the expression. This helps catch simple mistakes, such as the ones found in Step 1, without looking for them manually. In this aspect Dhall is a much more safe language to use for your configuration files.

Dhall has a couple of primitive types which can be used, these are:
- `Bool`
- `Natural` (a non-negative number)
- `Integer`
- `Double`
- `Text`
- `Date` / `Time` / `TimeZone`
- `Bytes`

Beyond that, Dhall also has some built-in composite types:
- `Records {}` (a mapping from field names to values, like the ones used in the example above)
- `List []` (a collection of elements of the same type)
- `Optional` (indicating the possibility that there might not be a value)
- `Unions <>` (representing an enum of different alternatives)

With these types, a lot of common fields can be represented. Custom types can also be easily defined, such as `Entity` in the example above, expanding the usefulness of the system.