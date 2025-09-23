# Configuration drift
Don't repeat yourself.
That is one of the main selling points of Dhall.
By creating a Dhall file to generate configurations, we have created a **single source of truth**.
This is meant to be referenced everywhere the data is needed for configuration files.
It helps combat *configuration drift*, which happens when configurations built from a standard template starts to diverge over time.
This will be demonstrated further in the next example.

## Migrating to YAML
As it turns out, the DevOps course is getting overhauled!
Instead of keeping track of all users using a JSON configuration file, we want to move to YAML!

To do this, instead of using `dhall-to-json`, simply use `dhall-to-yaml`.
```
dhall-to-yaml --file info.dhall --output info.yaml
batcat info.yaml
```{{exec}}

See, that was pretty easy!

## Migrating to CSV
But wait, YAML isn't what we want either.
For some reason, we really like dividing values by columns, so we want to use CSV-format.
Now, `dhall-to-csv` exists.
However, what if we didn't have it?
We want to let you write your own CSV formatter.

For those that need a quick refresher on CSV formatting, here we have an example of a user in a CSV file:
```
name,pullRequestsMade,role
Herdi,1,Student
```{{}}

A code skeleton is prepared at `csv.dhall`.
You just need to fill in two places to make it work:

1. The first row describing our columns
2. How each `User` is outputted

Go do that now:
```
vim csv.dhall
```{{exec}}

When you think your solution is correct, use the dhall interpreter and output it to a new file called `users.csv` like this:
```
dhall text --file csv.dhall --output info.csv
batcat info.csv
```{{exec}}
By using the `text`{{}} option for Dhall, we are telling the interpreter to output plain text, which allows us to pass this into a new file without any Dhall langauge expressions.

### Verification
The verification script for this step checks that you have a valid YAML and CSV file with the original users.
