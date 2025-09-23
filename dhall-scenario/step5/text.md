# Translating back-and-forth

## `dhall-to-json` and `json-to-dhall`
Now we've covered how to generate configuration files from dhall files, using our own custom format and set formats with `dhall-to-json` and `dhall-to-yaml`.
However, we can also go the other way!
Given a JSON file, we may use `json-to-dhall` to go from JSON to Dhall.
Go ahead and try that with our given `info.json` and see what happens:
```
json-to-dhall --file info.json --output info.dhall
batcat -l haskell info.dhall
```{{execute}}
If you're observant you may find some problems with this configuration.
How come Herdi has become a janitor, and why has Eric performed a negative amount of pull requests?
Isn't this supposed to be caught by Dhall? How do we fix this?

## Retro-active type checking
In many projects, we already have a set of configuration files.
Think of this project, with incorrect `info.json`, as an alternate timeline where the DevOps course was bad (I know, hard to believe!).
Thus, it would be good to retroactively be able to apply the typesafety given by Dhall to an already existing JSON file.
This is possible by specifying a schema.
The schema specifies the type of the value we wish to read.
Take a look at the schema for `info.json`:
```
batcat -l haskell Schema.dhall
```{{execute}}
It specifies a list of users like before.
Importantly, take note that we only allow natural numbers (positive or zero) and a set amount of roles.
Now, let us apply this to our transformation from JSON to Dhall:
```
json-to-dhall ./Schema.dhall --file info.json --output info.dhall
```{{execute}}
Since the `info.json` was incorrect, as noted before, we get errors.
This happens due to the values violating the schema and its types.
Now, go ahead and fix any errors that pop up.
Note that you may need to run it again after the first fix to find all errors!

# Configuration equivalence
In this alternate timeline where Dhall was not used, `info.yaml` was written by hand!
Take a look:
```
batcat info.yaml
```{{execute}}
Is this correct?
Yes, it is, but the records are in a different order.
So how do we compare the JSON and YAML?

## Using Dhall as the truth
Recall that Dhall wants us to specify the **single source of truth**. 
We want to compare two configuration files of different format, JSON and YAML, to see if they contain the same information.
To do this, we can convert both to Dhall, to get them in the same format.
Then, we simply compare the two:
```
json-to-dhall ./Schema.dhall --file info.json --output info_json.dhall
yaml-to-dhall ./Schema.dhall --file info.yaml --output info_yaml.dhall
diff info_json.dhall info_yaml.dhall
```{{execute}}
For those unfamiliar with `diff`, no output means that the files are equivalent!
Therefore, we have confirmed that the yaml file is equal to the JSON file, and is therefore correct!

What happens is that we get the two configuration files in the Dhall "canonical" normal form.
This ignores any syntactic differences, like the records being out of order.
This further solidifies the claim that a Dhall file is supposed to be used as the source for all configurations!

### Verification
The verification will make sure that a `info.dhall` exists, and that `info_json.dhall` and `info_yaml.dhall` exist.
It will also make sure that there are no errors in `info.json`.
