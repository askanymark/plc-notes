# Primitive Types
> A value that is not composite, i.e. isn't obviously made up of smaller components.
- like numeric values, but also:
  - Characters: e.g. Unicode chars + operations (also involving strings of characters):
    - Classification (is it a digit? Chinese or upper-case Latin?)
    - ordering (conversion to upper-case, lower-case)
    - appending strings (regex search and replace)
    - formatting of other values as strings
    - parsing values from strings
  - Booleans: true, false + operations (and, not, or, if-then-else)
  - symbolic values ('detached', 'semi-detached' and 'terraced') in enumerated types


### C/C++ booleans
- only native primitive values: 1,2,4 and 8-byte integers + floats
- all other primitive values are identified with some integers
  - false = 0; all other integers = true
- can define constants: TRUE = 1 and FLASE = 0
  - BUT beware 2 * TRUE != TRUE


### C/C++ characters
- traditionally 8-bit integers, covering only a small subset:
  - special syntax for those numbers ('a')
  - many library functions (toupper('a'))
- strings are arrays of chars terminated by the *null* char


### Java chars and booleans
- to improve safety Java provides a dedicated Boolean type:
  - n = 0 is of type int
  - n == 0 is of type boolean
- chars aren't numbers, but can obtain their Unicode 'serial number'
  - imperfect - using UTF-16 encoding
  - one Unicode characte = 1 or 2 Java chars
- strings are primitive values in Java, not sequences of chars


### Enumerated types in C and Java
- in C, symbolic values are synonyms for numbers:

```c
typedef enum {DETACHED, SEMIDETACHED, TERRACE} HouseCategory;
...
    HouseCategory hc = TERRACE; //=2
```
- in Java, symbolic values are objects:

```java
enum HouseCategory {DETACHED, SEMIDETACHED, TERRACE};
// and enum types are classes
// therefore, no arithmetic with symbolic values
TERRACE.ordinal() // would obtain the numbers
// parsing of symbolic values provided, e.g.:
Enum.valueOf(HouseCategory.class, input.toUpperCase());
```


### Haskell primitive values
- dedicated types for Booleans and 16-bit Unicode characters
- if-the-else in expressions => cannot drop 'else' part:

```haskell
myfun n = 2 * (if n > 0 then (factorial n) else 0) + 1
```
C/Java:

```java
2 * (n > 0 ? factorial(n) : 0) + 1
```
- Haskell uses Booleans as guards --> tidier code:

```haskell
myfun n | n > 0 = 2 * (factorial n) + 1
        | n <= 0 = 1
```
- enumerated types:

```haskell
data HouseCategory = DETACHED | SEMIDETACHED | TERRACED
data Bool = True | False -- from the base library
```


### Symbols as primitives in Lisp
- only **numbers **and **symbols** are primitive types
- symbols are Lisp identifiers
- symbols can refer to functions or variables but can be just themselves, i.e. symbolic values = data
- the symbolic values *nil *and *t *stand for 'false' and 'true'
- Lisp symbolic values as values of an enumerated type:

```c
(defun house-categoryp (a)
    (member a '(detached semidetached terraced)))
```
> The function 'house-categoryp' tests whether a value is of type 'house category' - a way to define a type in Lisp
> '(detached semidetached terraced) is a list of 3 symbols
> the ' prevents the interpretation of 'detached' as a function 


### Summary
• C:  – limited range of primitive values
        – much opportunity for errors to go undetected
        – formatting and parsing facilities limited
• Java: – safer due to a range of abstract values and types
            – good generic formatting mechanism
            – no generic parsing mechanism
• Lisp: – symbolic primitive values for any purpose, untyped
            – much opportunity for errors to go undetected
            – powerful, convenient but untyped formatting+parsing
• Haskell: – symbolic primitive values for any purpose, typed
                  – excellent type-checking improves safety
                  – convenient, powerful, typed formatting+parsing




