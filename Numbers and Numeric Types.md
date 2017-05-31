# Numbers and Numeric Types

```java
int i = 2147483647; // largest Java int = 2^31 - 1
                    // in binary: 01111111111111111111111111111111
i = i + 2           // overflow (chage of sign)
                    // in binary: 10000000000000000000000000000001
System.out.println(i) // prints out -2147483647
i = 2 * i           // overflow
                    // in binary: 00000000000000000000000000000010
System.out.println(i) // prints 2
```
## CPU Numbers

```java
double tiny = 1.0E-200; // 10^-200
double huge = 1.0E+200; // 10^200
System.out.println(tiny * tiny); // underflow, prints: 0.0
System.out.println(huge == tiny + huge); // rounding, prints: true
System.out.println(huge * huge * tiny); // overflow, prints: Infinity
System.out.println(huge * tiny * huge); // no overflow, prints: 1.0E+200
```
- Expressions are trees:

```java
(/
    (+
        (- b)
        (sqrt
            (-
                (expt b 2)
                (* 4 a c))))
    (* 2 a))
```
![Image](https://desmos-lesson-uploads.s3.amazonaws.com/activitybuilder/eeca14e50d54c2bb57d16acc69b4bd15)


- Java automatically converts integer-to-float conversions
- operator precedence -> less parantheses -> tree less obvious:

```java
b**2 - 4*a*c = (b**2) - ((4*a)*c)
// rather than
(((b**2)-4)*a)*c
```
- re-arrange expressions using algebraic laws to make overflow less likely or effect of rounding less severe, e.g.:

```java
a*b - c*b
// which better?
(a-c)*b
```


### C/C++
- C/C++ mirror closely to native CPU arithmetic types and operations - which are unintuitive
- short, int, long:
  - integer-like types: range given by a fixed number of bits
  - size not defined by language, depends on CPU/OS/compiler
  - overflows ignored (back to range using modulo)
  - signed and unsigned versions, e.g:
    - 8-bit signed short      range -128...127
    - 8-bit unsigned short range 0...255
- float, double, long double:
  - range and precision depend on CPU type
  - rounding, infinity, NaN behaviour depend on CPU type


### Ada
- Ada supports explicit ranges and makes range checks:

```haskell
type Digit is range 0..9;
D1 : Digit := 0;
D2 : Digit := D1 - 1; -- runtime error!
```
- Ada also supports explicit modulo types:

```haskell
type Digit is mod 10;
D1 : Digit := 0;
D2 : Digit := D1 - 1; -- sets D2 to 9
```
- can specify a minimal number of decimal digits not to round:

```haskell
type Meter_Reading is digits 15 range 0.0..1.0;
R1 : Meter_Reading := 0.5;
R2 : Meter_Reading := R1 + 0.0000000000001; -- R1 < R2
```
- fixed-point numbers = like floats but exponent fixed

```haskell
type Dial_Reading is
delta 0.1 range 0.0 .. 360.0;
D1 : Dial_Reading := 0.0;
D2 : Dial_Reading := D1 + 0.1; -- D2 > D1
D3 : Dial_Reading := D1 + 0.01; -- D3 = D1
```
very efficient - represented by integers
small delta => small range, large delta => poor precision


### Haskell
- very large integer:

```haskell
main = print (factorial 1000) -- fills the screen with digits...
factorial n -- = 1 * 2 * ... * n
| (n == 0) = 1
| otherwise = n * factorial (n - 1)
```
- very precise fraction:

```haskell
import Data.Ratio
main = print (sum_fracts 1000) -- a huge fraction...
sum_fracts n -- = 1/1 + 1/2 + ... + 1/n
| (n == 0) = 1
| otherwise = (1%n) + sum_fracts (n - 1)
```
- see "digits-haskell" for related files


> See "lab2-num" for practical
