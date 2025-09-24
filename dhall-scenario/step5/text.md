## `dhall-to-json` and `json-to-dhall`
Now we've covered how to generate configuration files from dhall files, using our own custom format and set formats with `dhall-to-json` and `dhall-to-yaml`.
However, we can also go the other way!
Given a JSON file, we may use `json-to-dhall` to go from JSON to Dhall.
Go ahead and try that with `alt_info.json` and see what happens:

```
json-to-dhall --file alt_info.json | batcat -l haskell
```{{execute}}

If you're observant you may find some problems with this configuration.
How come Herdi has become a janitor, and why has Eric performed a negative amount of pull requests?
Isn't this supposed to be caught by Dhall?
How do we fix this?

## Retroactive type checking
In many projects, we already have a set of configuration files.
Thus, it would be good to retroactively be able to apply the type safety given by Dhall to an already existing configuration file.
This is possible by specifying a schema.
The schema specifies the type of the value we wish to read.
Take a look at the schema which specifies the structure we want:

```
batcat -l haskell Schema.dhall
```{{execute}}

It specifies a list of users like before.
Importantly, take note that we only allow natural numbers (positive or zero) and a specific set of roles.
Now, let us apply this to our transformation from JSON to Dhall:

```
json-to-dhall ./Schema.dhall --file alt_info.json --output alt_info.dhall
```{{execute}}

Since `alt_info.json` was incorrect we get errors.
This happens due to the values violating the schema.
Now, go ahead and fix any errors that pop up, be sure to use the correct values presented in earlier steps. Remember you can find the correct values by looking at the previous JSON file you corrected:

```
batcat info.json
```{{execute}}

Note that you may need to run it again after the first fix to find all errors! If no output is printed, it means the program ran successfully and created the file `alt_info.dhall`, which can be viewed by running:

```
batcat -l haskell alt_info.dhall
```{{execute}}

## Configuration equivalence
Dhall also allows us to compare the content of different configuration file formats.
Take a look at the following YAML file:

```
batcat alt_info.yaml
```{{execute}}

Is this equivalent to the content of `alt_info.json`?
Yes, it is, but the fields of the record are listed in a different order.
So how do we compare the JSON and YAML?

Recall that Dhall is used to specify a **single source of truth**. 
We want to compare two configuration files of different formats, JSON and YAML, to see if they contain the same information.
To do this, we can convert both to Dhall, to get them in the same format.
Then, we simply compare the two:

```
json-to-dhall ./Schema.dhall --file alt_info.json --output info_json.dhall
yaml-to-dhall ./Schema.dhall --file alt_info.yaml --output info_yaml.dhall
diff info_json.dhall info_yaml.dhall
```{{execute}}

For those unfamiliar with `diff`, if there is no output that means the files are equivalent!

When converting to Dhall, we get the configuration file in its normal form.
This ignores slight syntactic differences, like the record fields being out of order.
This further solidifies the claim that a Dhall file is supposed to be used as the source for all configurations!

![A figure showing how Dhall can be a single source of truth](https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/dhall3.svg)

### Verification

The verification will make sure that `alt_info.json` has been corrected.
It will also check that the files `info_json.dhall` and `info_yaml.dhall` exist, and that they are equivalent.
