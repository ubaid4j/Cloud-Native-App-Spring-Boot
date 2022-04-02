# Item - 1: CONSIDER STATIC FACTORY METHODS INSTEAD OF CONSTRUCTORS
#### static factory method instead of constructors
- they have names
- unlike constructors, they are not required to create a new object each time they’re invoked
- they can return an object of any subtype of their return type.
- returned object can vary from call to call as a function of the input parameters. (see EnumSet `noneOf` method)
- the class of the returned object need not exist when the class containing the method is written (see `JDBC`)
#### Code Convention
- `from`, a type conversion method `Date d =Date.from(instant);`
- `of`, an aggregation method `Set<Rank> faceCards = EnumSet.of(JACK, QUEEN, KING);`
- `valueOf`, more verbose `BigInteger prime = BigInteger.valueOf(Integer.MAX_VALUE);`
- `getInstance`, `create`, `newInstance`, 
- `getType`, `newType` when factory method is in different class like `BufferedReader br = Files.newBufferedReader(path);`

# Item - 2: CONSIDER A BUILDER WHEN FACED WITH MANY CONSTRUCTOR PARAMETERS
- The Builder pattern simulates named optional parameters
- easy to write/read client code
- parameterized varargs
- ensure immutability 













## Extra notes
### Java Bean Pattern
- no arg constructor with setters
- disadvantages like multiple calls for this construction, cannot achieve immutability
### Constructor telescoping
- We can have multiple constructors which are delegating to other one (like 1-arg constructor to 2-arg constructor with second parameter is null)
- hard to write client code when there are many parameters, and harder still to read it.