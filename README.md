# milne-libs

A series of libraries for [Gambit-C](http://gambitscheme.org/), expanding the use of the Scheme to fit my needs.

These libraries may well be compatible with other implementations of Scheme.

---

## Requirements

1. RSR6-compliant Scheme Implementation (Reccomended: [Gambit-C](http://gambitscheme.org/))
2. The Scheme Implementation must also support Gambit's ```namespace``` macro.

---

## Usage

You can either load all the libraries together, or individually.

```
(load "milne")
```

Or, for example, to load only the mString library:

```
(load "mstrings")
```

Loading all the libraries together will not affect the namespaces exposed, and so their usage below remains the same.

### UnitTest

The UnitTest library supplies a simple, easy to use testing library.

Be aware, that the UnitTest library uses ANSI color codes when printing output.

* ```unittest#check-equal?```

The main testing procedure, ```check-equal?``` takes three arguments.

1. An expression to test against.
2. An expected result.
3. A message to print in the case of failure.

For example:

```
$ (unittest#check-equal? (+ 1 1) 2 "1 + 1 should equal 2.")
> PASS:
1 + 1 should equal 2.
$ (unittest#check-equal? (+ 2 2) 5 "This ain't 1984.")
> FAILURE:
This ain't 1984.
Expected:
5
Received:
4
```

* ```unittest#test-results```

This procedure tallies the tests produced by all ```check-equal?``` procedures, gives a brief overview, and then exits the program with either a status of 0, if there are no failures, or a status of 1 if there are.

For example, if we ran both the above ```check-equal?```s:

```
$ (unittest#test-results)
> Results:
Pass: 1 out of 2
Fail: 1 out of 2
```

With an exit status of 1.

### mString

The mString library provides a series of convenience helpers, that I found lacking in Scheme.

* ```mstring#string-nth```

This procedure takes 2 arguments.

1. A string
2. A positive or negative integer representing the character to be returned.

Given a positive integer, it works similarly to ```string-ref```, however instead of returning a byte, it returns a string.

Given a negative integer, it works backwards from the end of the string to determine the character to be returned, as a string.

For example:

```
$ (mstring#string-nth "Hello, World!" 2)
> "l"
$ (mstring#string-nth "Hello, World!" -1)
> "!"
```

* ```mstring#string-slice```

This procedure takes 3 arguments.

1. A string.
2. A positive integer representing the starting character to be returned.
3. A positive or negative integer representing the ending character to be returned.

This procedure returns a string representation of a range from a given string.

It acts quite similarly to Python's string slicing, and takes negative integers on the ending character as well as positive, the same as ```string-nth```.

For example:

```
$ (mstring#string-slice "Hello, World!" 4 -2)
> o, Worl
```

---

## License

Licensed under the 3-Clause BSD License.

See [LICENSE.md](LICENSE.md) for legally binding terms.
