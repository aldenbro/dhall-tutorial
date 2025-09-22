Before stepping into Dhall, let's first interact with a more common configuration language, namely JSON.

We have been given a file `info.json` which contains info regarding the DevOps course. 

```json
[
    {
        "name": "Larissa",
        "role": "Teacher"
    },
    {
        "name": "Eric",
        "pullRequestsMade": 4,
        "role": "TA"
    },
    {
        "name": "Sofia",
        "pullRequestsMade": 3,
        "role": "Outside Resource"
    },
    {
        "name": "David",
        "pullRequestsMade": 2,
        "role": "Student"
    },
    {
        "name": "Herdi",
        "pullRequestsMade": -1,
        "role": "Student"
    }
]
```

Unfortunately, the person making the file was very tired, and so some errors slipped in. Three errors have been identified: 

1. Larissa does not have a field stating how many pull requests she made, even though she's made `5`. 
2. Sofia did not properly get her role of `TA`. 
3. Herdi got assigned a negative number of pull requests, which is impossible. The most likely scenario is that a minus sign slipped in, and so the actual number should be `1`.

It is now your job to fix these mistakes. You have several options to do this, for example you can use `vim`, `nano`, or the built in editor.

Once you think you have corrected all of the mistakes, you should be able to continue to the next step.