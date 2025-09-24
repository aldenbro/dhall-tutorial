## Configuration drift
Don't repeat yourself.
This is one of the main selling points of Dhall.
By creating a Dhall file to generate configurations, we have created a **single source of truth**, as mentioned previously.
This file is meant to be used everywhere the data is needed for configurations.
It helps combat *configuration drift*, which happens when configurations built from a standard template starts to diverge over time.
An essential thing to mitigate, to ensure that the system continues to be manageable.

## Migrating to YAML
Turns out, the DevOps teachers want to use a tool that only uses YAML files.
Since we have our source of truth, `info.dhall`, we can use this to generate the configuration file for us.

To do this, instead of using `dhall-to-json`, simply use `dhall-to-yaml`.
```
dhall-to-yaml --file info.dhall | batcat -l yaml
```{{exec}}

See, that was pretty easy!

## Migrating to CSV
But what if we add another tool that wants data in a CSV-format?
Now, `dhall-to-csv` exists.
However, what if we didn't have it? (We haven't downloaded it for you.)
We want to let you write your own CSV formatter, to demonstrate the programming aspect of Dhall.

For those that need a quick refresher on CSV formatting, here we have an example of a user in a CSV file:

```
name,pullRequestsMade,role
Herdi,1,Student
```{{}}

A code skeleton is prepared at `csv.dhall`, which you can view by running:

```
batcat -l haskell csv.dhall
```{{exec}}

You just need to fill in two places to make it work.
To help you with this task, on any error you may pass in the flag `--explain` to the interpreter to get more details. 
This is what is you need to change:

1. The first row describing our columns
    <details>
        <summary>Hint 1</summary>
        This will be the names of each field, separated by commas.
    </details>
    <details>
        <summary>Answer</summary>
        <code>name,pullRequestsMade,role</code>
    </details>
2. How each `User` is outputted
    <details>
        <summary>Hint 1</summary>
        To insert a variable in a string, you do <code>${var}</code>.
    </details>
    <details>
        <summary>Hint 2</summary>
        A value of type <code>Natural</code> becomes text by calling <code>Natural/show</code> on it.
        A value of type <code>Role</code> becomes text by calling <code>showConstructor</code> on it.
    </details>
    <details>
        <summary>Answer</summary>
        <code>${user.name},${Natural/show user.pullRequestsMade},${showConstructor user.role}</code>
    </details>

When you think your solution is correct, use the dhall interpreter to check the output:

```
dhall text --file csv.dhall | batcat -l csv
```{{exec}}

By using the `text`{{}} option for Dhall, we are telling the interpreter to output plain text, which allows us to print this without any Dhall langauge expressions.

The notion of **single source of truth** has now becomes more realized as we have learnt how it is possible to convert from Dhall to multiple different formats.

![A figure describing how Dhall can be converted to multiple different formats](https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/dhall2.svg)

### Verification

The verification checks that you have correctly completed the code in `csv.dhall`.
