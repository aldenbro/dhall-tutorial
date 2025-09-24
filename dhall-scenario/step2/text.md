You probably found it somewhat tedious to fix the mistakes in the JSON file. But think how bad it would have been if you didn't know what was wrong with the file to begin with.

Dhall is here to help you!
Dhall is a programmable configuration language that is meant to be used to generate configuration files.
In contrast to plain configuration languages, it introduces types and functions.
This makes it more ergonomic and precise.

When using Dhall without all its bells and whistles, it looks quite similar to JSON. To showcase the similarities, here is a Dhall file specifying a simple record:

```haskell
{ age = 42, name = "Bob", weight = 133.7 }
```

## Type safety

Dhall is a statically typed language.
This implies type safety, meaning that we cannot assign a value to a variable that conflicts with that type.

Using types with the aforementioned example, it can look like this:

```haskell
dhall <<< '
    let Entity = { age : Natural, name : Text, weight : Double }
    in  { age = 42, name = "Bob", weight = 133.7 } : Entity
'
```{{execute}}

If you would have given a negative number as the age, or an integer as the weight, Dhall would complain when you try to evaluate the expression.

You can see it for yourself if you run the following:

```haskell
dhall <<< '
    let Entity = { age : Natural, name : Text, weight : Double }
    in  { age = -42, name = "Bob", weight = 133 } : Entity
'
```{{execute}}

This helps catch simple mistakes, such as the ones found in the JSON file of Step 1, without looking for them manually.

## Types

Dhall has a couple of primitive types which can be used. These are:
- `Bool`
- `Natural`: A non-negative number.
- `Integer`
- `Double`
- `Text`
- `Date` / `Time` / `TimeZone`
- `Bytes`

Beyond that, Dhall also has some built-in composite types:
- `Records {}`: A mapping from field names to values, like the ones used in the example above.
- `List []`: A collection of elements of the same type.
- `Optional`: Represent a value, or the absence of one.
- `Unions <>`: Representing an enum of different alternatives.

With these types, a lot of common fields can be represented. Custom types can also be easily defined, such as `Entity` in the example above, expanding the usefulness of the type system.

### Verification

There is no verification for this step.