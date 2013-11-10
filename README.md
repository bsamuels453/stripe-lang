# The stripe programming language

This is the repository for the stripe programming language

## Focus on :

### 1. Maintainability

Maintainability is an aspect which is often forgotten in the design of programming language. According to Rober L. Glass, "Maintenance typically consumes about 40 to 80 percent of software costs. Therefore, it is probably the most important life cycle phase.". Where most new languages seem to target fast development time, stripe targets reduced maintenance time.

### 2. Testability

Testability is also an important aspect within the software life cycle. Usually this is supported via external libraries in other languages but can still be very hard to do when global states are involved. Stripe aims to make the code completely testable.

### 3. Purity

To support the 2 previous points, stripe deals only in a pure manner. States and global data are impossible directly within the language.

### 4. Reactive

To support the previous point, stripe deals with anything which is bound to change within time in a reactive manner. The concept of Signal is introduced to simulate states and global data while keeping everything pure.

### 5. Contract

To help interfacing with the world, stripe allows contracts to be written for functions and for classes. With the help of pre-conditions, post-conditions and invariants, the behaviour expected from the code can be explicitely stated.

### 6. Architecture

While the design phase is usually done outside of the code implementation, stripe wants to allow the architecture to be done within the language itself.This is partly supported by the previous point where the use cases can be more easily mapped to the language.

### 7. Ease of use

While all the previous points imply a very rigid and tedious framework to be built around the language, stripe still aims to be easy to use.

### 8. Compatibility

Since a lot of libraries are already written for other languages, one of the goal of stripe is also to allow the use of those. This is done by embedding stripe within a runtime that runs within another language. The main target will be llvm to allow the usage of C/C++ libraries but this will most likely not be the first backend written.
