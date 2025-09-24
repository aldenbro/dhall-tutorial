# Configuration Languages
A configuration file is meant to be a human readable and easily parsable document which contains information about the state of a system. These are written with different languages tailored for this.
Some easily recognizable examples are JSON, YAML, TOML, INI, etc.

A crucial part of DevOps is to both setup a system and maintain it.
In both of these stages, configuration files can be used to manage third-party packages, testing, specifying version control tools etc.

However, with the growth and complexity of many projects, using plain configuration languages like JSON can lead to issues such as duplication and files growing to thousands of lines.
Furthermore, these languages lack the safety features of many programming languages, such as type safety (ignoring Javascript).
Dhall aims to alleviate these issues.
However, before introducing Dhall, let's see how a plain configuration language is used.

## Fixing a JSON file
We have been given a file `info.json` which contains info regarding the DevOps course. You can view the file by running:

`batcat info.json`{{exec}}

> NOTE: `batcat` is a `cat` alternative that supports syntax highlighting.

Unfortunately, the person making the file was very tired, and some errors slipped in.
Three specific errors have been identified: 

1. Larissa does not have a field stating how many pull requests she made, even though she's made `5`. 
2. Sofia did not properly get her role of `TA`. 
3. Herdi got assigned a negative number of pull requests, which is impossible. The most likely scenario is that a minus sign slipped in, and so the actual number should be `1`.

It is now your job to fix these mistakes. You have several options to do this, for example you can use `vim`, `nano`, or the built in editor.

### Verification

The verification will make sure that you have corrected the mistakes listed above.