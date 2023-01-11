# Note: I added the summaries of following 90 items from [Effective Java by Joshua Bloch](https://a.co/d/8dFRiL9). I'd recommend every Java developer should read this book.

## Creating and Destroying Objects
#### Item - 1: CONSIDER STATIC FACTORY METHODS INSTEAD OF CONSTRUCTORS
###### static factory method instead of constructors
- they have names
- unlike constructors, they are not required to create a new object each time they’re invoked
- they can return an object of any subtype of their return type.
- returned object can vary from call to call as a function of the input parameters. (see EnumSet `noneOf` method)
- the class of the returned object need not exist when the class containing the method is written (see `JDBC`)
###### Code Convention
- `from`, a type conversion method `Date d =Date.from(instant);`
- `of`, an aggregation method `Set<Rank> faceCards = EnumSet.of(JACK, QUEEN, KING);`
- `valueOf`, more verbose `BigInteger prime = BigInteger.valueOf(Integer.MAX_VALUE);`
- `getInstance`, `create`, `newInstance`, 
- `getType`, `newType` when factory method is in different class like `BufferedReader br = Files.newBufferedReader(path);`

#### Item - 2: CONSIDER A BUILDER WHEN FACED WITH MANY CONSTRUCTOR PARAMETERS
- The Builder pattern simulates named optional parameters
- easy to write/read client code
- parameterized varargs
- ensure immutability 

#### Item - 3: ENFORCE THE SINGLETON PROPERTY WITH A PRIVATE CONSTRUCTOR OR AN ENUM TYPE
- A singleton is simply a class that is instantiated exactly once
- We can enforce a Singleton property using private constructor with static factory method like below:
```java
public class DataSource {
    
    private static final DataSource ds = new DataSource();
    
    private DataSource() {
        
    }
    
    public static DataSource getDataSource() {
        return ds;
    }
}
```
- A one can access private Constructor by using Reflective API, we need to throw exception in constructor for this case
- Add `transient` for all fields and `readResolve` method for Serialization/Deserialization to make sure it remains singleton 
- Single Element Enum is the best way to implement a Singleton

#### ITEM 4: ENFORCE NON-INSTANTIABILITY WITH A PRIVATE CONSTRUCTOR
- Should add a private constructor to make a class non instantiable (mostly with Utility class, see `java.lang.Math` )

#### ITEM 5: PREFER DEPENDENCY INJECTION TO HARDWIRING RESOURCES
- Do not use a singleton or static utility class to implement a class that depends on one or more underlying resources
- Passing the resource into the constructor is called dependency Injection
- Dependency Injection (DI) enhance the Flexibility, re-usability and testability of a Class

#### ITEM 6: AVOID CREATING UNNECESSARY OBJECTS
- Do not create object when you can reuse existing one like 
`String str = new String("Java");` is bad practice to create new String as it is creating one extra object as argument `Java` to constructor `new String("Java")` is itself an instance.
- Immutable Objects can be reused and there is no need to create a new Immutable Object
- Equal Functionality Objects can be reused (see Pattern Compile vs String matches) (see autoboxing)

#### ITEM 7: ELIMINATE OBSOLETE OBJECT REFERENCES
- An obsolete reference is simply a reference that will never be de-referenced again.
- If an object reference is unintentionally retained, this Objects and other all objects referenced by this object will be excluded from GC and thus will cause memory leaks.
  - nulling the obsolete element by ourselves 
- Another common source of memory leaks is caches.
  - Use other processes (WeakHashMap or ScheduledThreadPoolExecutor) to clean out the unused keys
- Listener and other callbacks can cause memory leaks as well.
- If you register callbacks but do not de-register then they will accumulate and thus causing memory leaks

#### ITEM 8: AVOID FINALIZERS AND CLEANERS
- Don't use Finalizer
- Don't use Cleaners


#### ITEM 9: Prefer `try-with-resources` to `try-finallay`
- code with `try-finally`
  ```
    static void copy(String src, String dst) throws IOException {
        InputStream in = new FileInputStream(src);
        try {
            OutputStream out = new FileOutputStream(dst);
            try {
                byte[] buf = new byte[1024];
                int n;
                while ((n = in.read(buf)) >= 0) {
                    out.write(buf, 0, n);
                }
            } finally {
                out.close();
            }
        } finally {
            in.close();
        }

    }
  ```
- same above code with `try-with-resource`
  ```
    static void copy(String src, String dst) throws IOException {
        try (InputStream in = new FileInputStream(src);
             OutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[1024];
            int n;
            while ((n = in.read(buf)) >= 0) {
                out.write(buf, 0, n);
            }
        }
    }
  ```
- more readable, shorter
- we get very first exceptions with later one suppressed automatically
  - first exception mean the actual exception generated during opening a file in above `copy` method
  - later exceptions might be exceptions in close method of `AutoCloseable` resource 

## Methods Common to All Objects
#### ITEM 10: OBEY THE GENERAL CONTRACT WHEN OVERRIDING EQUALS
- When overriding `equals()` method, then make sure following contract if fulfill
  - Reflexive:   x.equals(x) => true
  - Symmetric:  x.equals(y) && y.equals(x) => true
  - Transitive:  x.equals(y) && y.equals(z) && x.equals(z) => true
  - Consistent: multiple invocations produce same results 
  - x.equals(null) => false 
- To avoid symmetric violation, our equals method should compare same instances
- To avoid transitivity, we should prefer composition to inheritance
- How to override `equals` method
  - use `==` to check argument is a reference to this object
  - use `instanceof` operator to check argument has the correct type
  - cast the argument to correct type
  - check each `significant` field of class with the corresponding fields of argument
  - Example
   ```
    class Point {
        private final int x;
        private final int y;

        public Point(int x, int y) {
            this.x = x;
            this.y = y;
        }

        @Override
        public boolean equals(Object o) {
            if (o == this) return true;
            if (!(o instanceof Point)) return false;
            Point p = (Point) o;
            return p.x == x && p.y == y;
       }
    }
   ``` 
  - Instead of overriding equals method by ourselves, use auto generated equals by IDEs or Annotations (which override `equals` in compiled code instead of codebase)

#### ITEM 11: ALWAYS OVERRIDE HASHCODE WHEN YOU OVERRIDE EQUALS
- Contract for hashCode()
  - return consistent same value on each invocation
  - if o1.equals(o2) then o1.hashCode() == o2.hashCode()
  - if o1 is not equals to o2 then it preferable to have distinct hash codes
- How to write `hashCode()` method
  - Initialize int result = 1;
  - And for each significant fields:
    - result = 31 * result + Type.hashCode(field)
  - return result
- There is method `Objects.hash(Object ...)` which calculate the hash using the same above algorithm, but it is not good for performance as it create Array of Object and boxing/unboxing of primitive types
- Example
  ```
  class Coordinate {
    final int x;
    final int y;

    public Coordinate(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof Coordinate)) return false;
        Coordinate c1 = (Coordinate) obj;
        return c1.x == x && c1.y == y;
    }

    @Override
    public int hashCode() {
        int result = 1;
        result = 31 * result + Integer.hashCode(x);
        result = 31 * result + Integer.hashCode(y);
        return result;
    }

    @Override
    public String toString() {
        return "Coordinate{" +
            "x=" + x +
            ", y=" + y +
            '}';
    }
  }
  ``` 
  - We used 31 as it is prime odd and the VM can convert the multiplication to shift.
    - 31 * result ===  (result << 5) - result

#### ITEM 12: ALWAYS OVERRIDE toString
#### ITEM 13: OVERRIDE CLONE JUDICIOUSLY
- Object's clone method returns a field by field copy of the object
- contract: 
  ```
    x.clone() != x
    x.clone().getClass() == x.getClass()
    x.clone().equals(x)
  ``` 
- Copying arrays is the sole compelling use of `clone` facility
- `clone` is doing shallow copy (we need to add extra functionality to make it deep copy)
- How to Clone
  - Override clone with public method which return the same type (containing clas)
  - class `super.clone()` first
  - fix any fields that need fixing (like fields that contain deep structure)
- Better approach is `copy constructor` or `copy factory`

#### ITEM-14: CONSIDER IMPLEMENTING COMPARABLE
- Contract
  - returns  0  if this object is equals to other one
  - returns -1  if this object is less than to other one
  - returns  1  if this object is greater than to other one
  - sgn(x.compareTo(y)) == -sgn(y.compareTo(x))
    - sgn is a function which returns -1 for any negative value, +1 for any positive value and 0 for 0
  - Must follow transitivity
  - If x.compareTo(y) == 0 then sgn(x.compareTo(z)) == sng(y.compareTo(z))
  - If x.compareTo(y) == 0 then x.equals(y)

## Classes and Interfaces
#### ITEM-15: MINIMIZE THE ACCESSIBILITY OF CLASSES AND MEMBERS
- Reduce accessibility of program elements as much as possible
  - Top level (not nested) classes has only two possible access levels
     - package-private (no requirement to have same name as file name, and there can be multiple classes in a file)
     - public (class name should be same file name, and there can be only one public class)
  - Prefer package-private class
  - For members (fields, methods, nested classes and nested interfaces), following are access level
    - private (only accessible from the top level class where it is declared)
    - package-private (accessible from any class in the package where it is declared)
    - protected (accessible from subclasses)
    - public (accessible from anywhere) 
  - An overridden method in subclass cannot have a more restrictive access level 
#### ITEM 16: IN PUBLIC CLASSES, USE ACCESSOR METHODS, NOT PUBLIC FIELDS
- If a class is accessible outside its package, provide accessor methods
#### ITEM 17: MINIMIZE MUTABILITY
- Immutable class
  - Instance can not be modified 
  - All info containing this instance is fixed in the lifetime of the object
  - An immutable object can be in exactly one state, the state in which it was created
  - Easy to use then mutable class and less prone to error
  - They are thread safe
  - They can be shared freely
  - Disadvantage:
     - We need to create a separate object for each distinct value 
- Five rules to create immutable class
  - Don't provide methods that modify the object's state
  - Ensure that the class can't be extended
  - Make all fields final
  - Make all fields private
  - Ensure exclusive access to any mutable components
    - don't give reference for mutable object
    - don't initialize mutable object from client given object
    - use defensive copies in constructors/accessors
#### ITEM 18: FAVOR COMPOSITION OVER INHERITANCE (gh-567)
- It is safe to use inheritance within package
- Inheritance violates encapsulation
  - As subclass depends on the implementation details of its super class, and changes in super class may break the functionality in subclass
- A known user can access the methods from super class which are not forcing invariants
- If super class introduced some new methods which are same as we already declared in our subclass then it starts overriding 
- If super class introduced same method signature with different return type, then our subclass will fail to compile
- Composition
  - Adding a reference of existing class in new class is called composition
  - solve all problems produced by Inheritance
- Use Inheritance, where there is `is-a` relationship
#### ITEM 19: DESIGN AND DOCUMENT FOR INHERITANCE OR ELSE PROHIBIT IT
- Overridable methods = non-final and public/protected methods
- The class must document its self-use of overridable methods
  - For each public/protected method, the documentation must indicate which overridable methods the method invoke 
- Use `@impSpec` to document the overrideable methods
- Constructors must not invoke overridable methods
  - Clone and readObject must not invoke overridable methods
- Prohibit subclassing in classes that are not designed and documented to be safely subclassed
  - Declare class with `final` 
  - Private/package-private constructors
#### ITEM 20: PREFER INTERFACES TO ABSTRACT CLASSES
- Existing classes can easily be retrofitted to implement a new interface
- Interfaces are ideal for defining mixins
  - Mixin is a type that class can implement to provide some optional behavior (Like Comparable)
- Interfaces allow non-hierarchical type framework 
  - We can implement multiple Interfaces for single class 
- Interfaces are not permitted to have
  - instance fields
  - non-public static fields
  - `protected` access modifier for all members
- Skeletal Implementations
  - Interface -> AbstractClass -> Concrete Class
  - As AbstractList is skeletal implementation of List and providing almost all functionalities of List (except 2 abstract methods), following method is using AbstractList to convert array of int to List of Integers without much efforts
    ```
        static List<Integer> intArrayAsList(int[] a) {
          Objects.requireNonNull(a);
        
          return new AbstractList<>() {
            
              @Override
              public Integer get(int index) {
                  return a[index];
              }
            
              @Override
              public int size() {
                  return a.length;
              }
          };
      }
    ```
#### ITEM 21: DESIGN INTERFACES FOR POSTERITY
- Using default methods to add new methods to existing interfaces should be avoided unless the need is critical
- We may use default methods at the time of interface creation
#### ITEM 22: USE INTERFACES ONLY TO DEFINE TYPES
- Constant interface pattern is poor use of interface
#### ITEM 23: PREFER CLASS HIERARCHIES TO TAGGED CLASSES
- Tagged classes are verbose, error-prone and inefficient 
- Tagged classes are used for defining a single data type capable of representing objects of multiple flavor, but we can transfer it in class hierarchy to make it more clean
- Tagged Class example: 
  ```
    class Figure {
        enum Shape {RECTANGLE, CIRCLE};

        // tag field
        final Shape shape;
    
        // for rectangle
        double length;
        double width;
    
        // for circle
        double radius;
    
        // circle constructor
        Figure(double radius) {
           this.shape = Shape.CIRCLE;
           this.radius = radius;
        }
    
        // rectangle constructor
        Figure(double length, double width) {
            this.shape = Shape.RECTANGLE;
            this.length = length;
            this.width = width;
       }
    
        double area() {
            return switch (shape) {
                case CIRCLE -> Math.PI * (radius * radius);
                case RECTANGLE -> length * width;
        };
    }
   ```
- To hierarchy
  ```
    abstract class Figure {
        abstract double area();
    }

    class Circle extends Figure {
        final double radius;

        public Circle(double radius) {
            this.radius = radius;
        }

        @Override
        double area() {
            return Math.PI * (radius * radius);
        }
    }

    class Rectangle extends Figure {
        final double length;
        final double width;

        public Rectangle(double length, double width) {
            this.length = length;
            this.width = width;
        }

        @Override
        double area() {
            return length * width;
        }
    }
  ```
- Now, the code is clean, not-bloated, specific to each type  
#### ITEM 24: FAVOR STATIC MEMBER CLASSES OVER NONSTATIC
- Nested classes are defined within another class to serve its enclosing class
- 4 type of nested classes (last three are also called inner classes)
  - nonstatic member class
  - static member class
  - anonymous class
  - local class 
- Each instance of non-static member class is implicitly associated with an enclosing instance of its containing class
- It is impossible to create an instance of nonstatic member class without an enclosing instance
- Add `static` modifier to a member class that does not require access to an enclosing instance
  - instance member class have a hidden extra reference to its enclosing instance which take time and space
  - We can have possible memory leaks when we use instance member class as the enclosing instance being retained though it is eligible for GC 
#### ITEM 25: LIMIT SOURCE FILES TO A SINGLE TOP-LEVEL CLASS
- Never put multiple top level classes or interfaces in a single source file
## Generics
#### ITEM 26: DON’T USE RAW TYPES
- Generic Class
  - A class or interface whose declaration has one or more type parameters
- Raw types lose all safety and expressiveness benefits of generics
- Unbounded wildcard
  - If we don't want to add type parameter in generic, we can use unbounded wildcard e.g. `Set<String>` to `Set<?>`
  - When we use unbounded wildcard, it's mean that our collection can contain any type
  - If we declare a collection with unbounded wildcard, we cannot put anything in it
- Generic type information erased at runtime (it's just for type safety at compile time)
- Using raw types can lead to exceptions at runtime, so don't use them
- Following table shows the term with examples 

|          Term           |               Example               |
|:-----------------------:|:-----------------------------------:|
|   Parameterized type    |           `List<String>`            |
|  Actual type parameter  |              `String`               |
|      Generic Type       |              `List<E>`              |
|  Formal Type Parameter  |                 `E`                 |
| Unbounded wildcard type |              `List<?>`              |
|        Raw Type         |               `List`                |
| Bounded Type parameter  |        `<E extends Number>`         |
|  Recursive type bound   |     `<T extends Comparable<T>>`     |
|  Bounded wildcard type  |      `List<? extends Number>`       |
|     Generic method      | `static <E> List<E> asList(E[] a)`  |
|       Type token        |           `String.class`            |

#### ITEM 27: ELIMINATE UNCHECKED WARNINGS
- There are some warnings which can't be eliminated but our code is typesafe then we can use `@SuppressWarnings("unchecked")`  annotation
- `@SuppressWarnings("unchecked")` should be used on the smallest scope possible
- Add a comment saying why it is safe to do, with `@SuppressWarnings("unchecked")`
#### ITEM 28: PREFER LISTS TO ARRAYS
- Arrays are **covariant**
  - If `Sub` is subtype of `Super` then array type `Sub[]` is subtype of the array type `Super[]` like below
  ```
    Object[] arr = new Long[1];
  ```
- Generics are **invariant**
- We cannot declare the following line of code as we did for Arrays
  ```
    //compilation error
    //java: incompatible types: java.util.ArrayList<java.lang.Long> cannot be converted to java.util.List<java.lang.Object>
    //List<Object> list = new ArrayList<Long>();
  ```
- Arrays are **reified**
  - Arrays enforce their element type at runtime
- Lists are implemented by **erasure**
  - Lists enforce their types only at compile time and discard (or erase) their element type information at runtime.
  - **Erasure** allowed generic types to interoperate freely with legacy code, ensuring smooth transition to generics in Java 5
- It is illegal to create an array of a 
  - generic type: `new List<E>[]`
  - parameterized type: `new List<String>[]`
  - type parameter: `new E[]`
- because it isn't typesafe.
#### ITEM 29: FAVOR GENERIC TYPES
- Generic Types are safer and easier to use than types that require casts in client codee 
- The only limitation of using generic types is that we cannot use **primitive** type
  - like `Stack<int>` or `Stack<double>`
  - We can use Boxed primitive types like `Stack<Integer>` or `Stack<DOUBLE>`
#### ITEM 30: FAVOR GENERIC METHODS
- Generic methods are safe and easier to use than methods requiring their clients to put explicit casts on input parameters and return values.
- Methods should be used without cast
- The **type parameter list**, which declares the type parameters, goes between a method's modifiers and its return type like below:
  ```
      static <E> Set<E> union(Set<E> s1, Set<E> s2) {
        Set<E> result = new HashSet<>(s1);
        result.addAll(s2);
        return result;
      }
  ```
  where `<E>` is the **type parameter list**.
- Bounded type parameter list
  ```
    <E extends Integer> Set<E> intersection(Set<E> s1, Set<E> s2) {
        Set<E> result = new HashSet<>();
        for (E element: s1) {
            if (s2.contains(element)) {
                result.add(element);
            }
        }
        return result;
    }
  ```
  where `<E extends Integer>` is **bounded type parameter list** and its means that **E** are those types which are the subset of `Integer`.
- Recursive Type Bound
  - A type parameter bounded by some expression involving that type parameter itself
  ```
  static <E extends Comparable<E>> E max(Collection<E> c)
  ```
  So, this method accept only types which implements `Comparable` of same type
#### ITEM 31: USE BOUNDED WILDCARDS TO INCREASE API FLEXIBILITY
- **Bounded wildcard type**
  - To reduce the invariant
  - For producer input we can use `<? extends Type>`
  - For consumer input we can use `<? super Type>`
- mnemonic: *PECS stands for produce-extends, consumer-super*
- Do no use bounded wildcard types as return types
- Comparable/Comparators are always consumers, thus we can use `Comparable<? super T>` and `Comparator<? super T>`
- If a type parameter appears only once in a method declaration, replace it with a wildcard
#### ITEM 32: COMBINE GENERICS AND VARARGS JUDICIOUSLY
- `@SafeVarargs` constitutes a promise by the author of a method that it is a typesafe.
  - `@SafeVarargs` is legal only for **non overridable** methods
- It is unsafe to give another method access to a generic varargs parameter array
- A generic varargs method is safe if:
  - It doesn't store anything in the varargs parameter array
  - It doesn't make the array (or a clone) visible to untrusted code
- Varargs and generics do not interact well because the varargs facility is leaky abstraction built atop arrays, and arrays have different type rule from generics.
#### ITEM 33: CONSIDER TYPESAFE HETEROGENEOUS CONTAINERS
- Collection APIs have a fixed number of type parameters
- We can have dynamic type parameters if we place type parameter on the key rather than container
```
    static class Favorites {

        private final Map<Class<?>, Object> map = new HashMap<>();
        
        public <T> void putFavorite(Class<T> type, T instance) {
            map.put(type, type.cast(instance));
        }

        public <T> T getFavorite(Class<T> type) {
            return type.cast(map.get(type));
        }
    }

```
## Enums and Annotations
#### ITEM 34: USE ENUMS INSTEAD OF INT CONSTANTS
- An enumerated type is a type whose legal values consist of a fixed set of constants
- Enums are used to represent enumerated types
- Enums are not extendable
- Enums are not instantiable
- Enums provide compile time type safety
- Enums are immutable
- Constant specific data
  - Declare a final field as per data requirement
  - Add a required number of args constructor
  - Add an enumerated value with parenthesis which contains required parameters
  - ```
        EARTH(5.975e+24, 6.378e6),

        private final double mass;
        private final double radius;

        Planet(double mass, double radius) {
            this.mass = mass;
            this.radius = radius;
        }

    ```
- Constant specific method
  - Declare an abstract method in enum
  - Provide implementation in each enumerated value like
  - ```
        PLUS {
            @Override
            double apply(double x, double y) {
                return  x + y;
            }
        }
    ```
- An enum can have both constant specific method and data
```
    PLUS("+") {
        @Override
        double apply(double x, double y) {
            return x + y;
        }
    };
    
    private final String symbol;
    OperationC(String symbol) {
        this.symbol = symbol;
    }
    
    abstract double apply(double x, double y);
    
    @Override
    public String toString() {
        return symbol;
    }
```
- Enum constructor are not permitted to access the enum static fields except constant variables
  - As static fields have not yet been initialized when enum constructors runs
- Use enums any time you need a set of constants whose members are known at compile time
#### ITEM 35: USE INSTANCE FIELDS INSTEAD OF ORDINALS
- Never derive a value associated with an enum from its ordinal; store it in an instance
#### ITEM 36: USE ENUMSET INSTEAD OF BIT FIELDS
- BIT fields are being used for their bitwise operations
  - But it is harder to interpret a bit field
```
    static class TextObsolete {
        static final int STYLE_BOLD = 1 << 0; //1
        static final int STYLE_ITALIC = 1 << 1; //2
        static final int STYLE_UNDERLINE = 1 << 2; //4
        static final int STYLE_STRIKETHROUGH = 1 << 3; //8
        
        void applyStyle(int styles) {
            System.out.println("Styles --> " + styles);
        }
    }
    
    @Test
    void testTextObsolete() {
        TextObsolete txt = new TextObsolete();
        txt.applyStyle(TextObsolete.STYLE_BOLD | TextObsolete.STYLE_STRIKETHROUGH);
    }
```
- Instead, we can use EnumSet which provides
  - Richness
  - Type safety
  - Interoperability
```
    static class Text {
        enum Style {
            BOLD, ITALIC, UNDERLINE, STRIKETHROUGH
        }
        
        public void applyStyles(Set<Style> styles) {
            System.out.println("Styles ----> " + styles);
        }
    }
    
    @Test
    void testText() {
        Text text = new Text();
        text.applyStyles(EnumSet.of(Style.BOLD, Style.STRIKETHROUGH));
    }
```
#### ITEM 37: USE ENUMMAP INSTEAD OF ORDINAL INDEXING
- EnumMap provides type safety and is independent of ordinals
#### ITEM 38: EMULATE EXTENSIBLE ENUMS WITH INTERFACES
- As enum are not extensible, we can emulate it by implementing an interface
```
    interface Operation {
        double apply(double x, double y);
    }
    
    enum BasicOperation implements Operation {
        PLUS("+") {
            @Override
            public double apply(double x, double y) {
                return x + y;
            }
        }
    }
    
    enum ExtendedOperation implements Operation {
        EXP("^") {
            @Override
            public double apply(double x, double y) {
                return Math.pow(x, y);
            }
        }
    }

```
#### ITEM 39: PREFER ANNOTATIONS TO NAMING PATTERNS
- Naming patterns were obsolete technique to have some metadata so that the tools/framework can process that data.
- Annotation provide high level of metadata
- Sample Declaration
  - ```
      @Retention(RetentionPolicy.RUNTIME)
      @Target(ElementType.METHOD)
      @interface Annotation1 {
      
      }  
    ```
    - Where `@interface` is keyword which represents `Annotation1` is Annotation type
    - `@Target` is meta annotation which represents that this annotation can be used on methods
    - `@Retention` is meta annotation too which represents that this annotation will be available at runtime
      - When annotation is present in runtime we can read it using `java.lang.reflect` API

#### ITEM 40: CONSISTENTLY USE THE OVERRIDE ANNOTATION
- Compiler can protect us from many errors if we use the `Override` annotation

#### ITEM 41: USE MARKER INTERFACES TO DEFINE TYPES
- A marker interface contains no methods
- Compile-time error detection is the intent of marker interfaces

## Lambdas and Streams
#### ITEM 42: PREFER LAMBDAS TO ANONYMOUS CLASSES
- In Java 8: interfaces with a single abstract method are special and deserve special treatment
  - These are known as Functional Interfaces
  - **Lambda Expression** is used to create instance of these interfaces
  - **Lambdas** are similar in function to anonymous classes but far more concise
- One line is ideal for lambda and three lines is a reasonable maximum
- Lambdas are limited to functional interface
  - If we want to create an instance of an abstract class, we can do it with anonymous class (but not with lambda)
  - If an interface has multiple abstract methods, when we can create its instance using anonymous class (but not with lambda)
  - Lambda cannot obtain a reference to itself
    - in lambda `this` keyword refers to enclosing instance
    - in anonymous class `this` keyword refers to anonymous class instance
#### ITEM 43: PREFER METHOD REFERENCES TO LAMBDAS
- Reference methods are shorter and clearer
- There are five type of method reference:

|  Method Ref Type  |         Example          |                  Lambda Equivalent                   |
|:-----------------:|:------------------------:|:----------------------------------------------------:|
|      Static       |   `Integer::parseInt`    |            `str -> Integer.parseInt(str)`            |
|       Bound       | `Instant.now()::isAfter` | `Instant then = Instant.now(); t -> then.isAfter(t)` |
|      Unbound      |  `String::toLowerCase`   |              `str -> str.toLowerCase()`              |
| Class Constructor |   `HashMap<K,V>::new`    |              `() -> new HashMap<K, V>`               |
| Array Constructor |       `int[]::new`       |                `len -> new int[len]`                 |

#### ITEM 44: FAVOR THE USE OF STANDARD FUNCTIONAL INTERFACES
- Six basic interfaces in `java.util.Functions`
  - Operator interface has same result and argument type
  - Predicate interface takes an argument and returns a boolean
  - Function interface has different argument and return types
  - Supplier interface takes no argument and return a value
  - Consumer takes an argument and returns nothing
- Table

|     Interface      |  Function Signature   |        Example        |
|:------------------:|:---------------------:|:---------------------:|
| Unary Operator<T>  |    `T apply(T t)`     | `String::toLowerCase` |
| Binary Operator<T> | `T apply(T t1, T t2)` |    `Integer::sum`     |
|     Predicate      |  `boolean test(T t)`  | `Collection::isEmpty` |
|   Function<T, R>   |    `R apply(T t)`     |   `Arrays::asList`    |
|    Supplier<T>     |       `T get()`       |    `Instant::now`     |
|    Consumer<T>     |  `void accpet(T t)`   | `System.out::println` |

- Always annotate functional interfaces with the `@FunctionalInterface` annotation
#### ITEM 45: USE STREAMS JUDICIOUSLY
- Overusing streams makes programs hard to read and maintain
- Careful naming of lambda parameters is essential for better readability 
- Helper methods increase the readability for stream pipelines
#### ITEM 46: PREFER SIDE-EFFECT-FREE FUNCTIONS IN STREAMS
- The `forEach` operation should be used only to report the result of a stream computation, not to perform the computation.
- A `pure function` is one whose result depends only on its input
- Import all members of `Collectors` as it makes stream pipelines more readable
- Use `Collectors` methods for the effective usage of Streams
#### ITEM 47: PREFER COLLECTION TO STREAM AS A RETURN TYPE
- While having `Collection`, we can easily Iterate and use `Stream`
  - As Collection extends `Iterable`  and
  - It has `stream()` method get its stream
#### ITEM 48: USE CAUTION WHEN MAKING STREAMS PARALLEL
- Parallelization is not increasing performance when source is from `Stream.iterate` or intermediate operation is `limit`
- Parallelization can by apply on `ArrayList`, `HashMap`, `HashSet`, `ConcurrentHashMap`, `arrays`, `int ranges` and `long ranges`
  - These datastructures can be accurately and cheaply split into sub-ranges of any desired sizes
  - They have good-to-excellent locality of reference when processed sequentially
## Methods
#### ITEM 49: CHECK PARAMETERS FOR VALIDITY
- use `Objects.requireNonNull(obj, msg)` to validate nullity
- throw `IllegalArgumentException`, `NullPointerException`, `IndexOutOfBoundException` for these type of validations
#### ITEM 50: MAKE DEFENSIVE COPIES WHEN NEEDED
- We need defensive copies in case of mutable components of a class
- `Date` is obsolete. We can use `java.time` classes
- Do not use `clone` method to make a defensive copy of a parameter whose type is non-final
  - when a class is non-final, then they can be extended by malicious class
  - We can use `clone` method in accessor as we know the type
#### ITEM 51: DESIGN METHOD SIGNATURES CAREFULLY
- Choose method name carefully
- Avoid long parameter lists
  - use Helper class
  - split methods to reduce parameter lists
  - builder pattern
- Favor interfaces over classes for parameter types
- Favor two-element enum types over boolean parameter
#### ITEM 52: USE OVERLOADING JUDICIOUSLY
- The choice of which overloading to invoke is made at compile time
  - runtime does not affect the choice of overloading
- selection among **overloaded** methods is **static**, while selection among **overridden** methods is **dynamic** 
- avoid confusing use of **overloading**
  - never add two **overloading** methods with same number of parameters
  - never overload a method that uses **varargs**
  - In the presence of auto-boxing, `Object` and `int` are no longer radically different
    - Two types are radically different if it is clearly impossible to cast any non-null expression to both types
  - `Lambdas` and `Method reference` increased the potential for confusion in overloading
#### ITEM 53: USE VARARGS JUDICIOUSLY
- `varargs` methods accept zero or more arguments of a specified type
- When using `varargs` we got some performance consequences as:
  - `varargs` facility first create an array whose size is the number of passed arguments at site call
  - then putting the arguments values into the array 
  - and then finally passing that array to the method
- We can use overloaded methods for upto three parameters instead of only one vararg parameter
#### ITEM 54: RETURN EMPTY COLLECTIONS OR ARRAYS, NOT NULLS
- We can return empty Collections instead of returning null
  - `Collections.emptyList`
  - `Collections.emptySet`
  - `Collections.emptyMap`
- The aforementioned empty collections are immutable, and it causes no performance issue
- Same, we need to return zero-length array instead of returning null
  - Zero length array are immutable
#### ITEM 55: RETURN OPTIONALS JUDICIOUSLY
- `Optional<T>` is immutable container which hold non-null T reference or nothing at all
- **Containers types** including `collections`, `maps`, `streams`, `arrays` and `optionals` should not be wrapped in **optionals**.
- Never return an optional of a boxed primitive 
  - Use `IntOptional`, `LongOptional`, `DoubleOptional`
- Never use `Optional` as key or value in `Map` or element in `Collectoions` or `Arrays`
#### ITEM 56: WRITE DOC COMMENTS FOR ALL EXPOSED API ELEMENTS
- Focus on **what** not on **how** while writing docs
- Pre-conditions and Post-conditions are helpful in docs
- docs tags:
  - `@param` for every parameters
  - `@return` any return type
  - `@throws` for every exception (checked and unchecked both)

```java
/**
 *
 * Returns the element at the specified position in this list
 *
 * <p>This method is <i>not</i> guaranteed to run in constant
 * time. In some implementations it may run in time proportional 
 * to the element position
 *
 * @param index index of element to return; must be
 *              non-negative and less than the size of this list
 * @return the element at the specified position in this list
 * @throws java.lang.IndexOutOfBoundsException if the index is out of
 *         range ({@code index < 0 || index >= this.size})
 */
```
- The first sentence becomes the summary description
  - No two members or constructors in a class should have same summary description
  - The summary description ends at the first period that is followed by a space, tab or line terminator
- `@implSpec` describe the contract between a method and its subclass
- `@code` suppress processing of HTML markup and render the text in **code** font
- `@literal` suppress processing of HTML markup as well but it do not **render** text in **code** font
- Doc comments should be readable both in the source code and in the generated documentation
- For methods and constructors, the summary description should be a verb phrase
- For classes/interfaces/fields the summary description should be a noun phrase
- `@inheritDoc` can be used to inherit doc comments from supertype
## General Programming
#### ITEM 57: MINIMIZE THE SCOPE OF LOCAL VARIABLES
- prefer **traditional for loop** over **while loop** to minimize scope of local variable
#### ITEM 58: PREFER FOR-EACH LOOPS TO TRADITIONAL FOR LOOPS
- for-each loop provides:
  - Clarity
  - Bug prevention
  - No performance penalty
- We can't use for-each loop in following conditions:
  - **Destructive filtering**: where we need to remove a selected element
  - **Transforming**: where we need to replace some values of its element
  - **Parallel Iteration**
#### ITEM 59: KNOW AND USE THE LIBRARIES
- Prefer library code instead of writing by ourselves
- A Java programmer should be familiar with the basics of
  - `java.lang`
  - `java.util`
  - `java.io`
#### ITEM 60: AVOID FLOAT AND DOUBLE IF EXACT ANSWERS ARE REQUIRED
- `float` and `double` do not provide exact results
  - not suited for **monetary** calculations
- We can use `BigDecimal`, `long`, `int` to get correct result
  - use `BigDecimal` if we want the system to keep track of the decimal point
#### ITEM 61: PREFER PRIMITIVE TYPES TO BOXED PRIMITIVES
- Every primitive type has a corresponding reference type which is called **Boxed primitive**
- Difference between primitive and Boxed primitive:
  - primitive have only their values while boxed primitives have identities distinct from their values
    - multiple boxed instances of same value
  - boxed primitive can have `null` value
  - primitive are more time and space efficient
- comparing two boxed primitives with `==` is actually identity comparison
- When we mix primitives and boxed primitives in an operation, the boxed primitive is auto-unboxed
  - A `NullPointerException` thrown when null object reference is auto-unboxed
- When to use **boxed primitives**
  - elements, keys and values in collections
  - type parameters in parameterized types and methods
  - reflective methods invocations
#### ITEM 62: AVOID STRINGS WHERE OTHER TYPES ARE MORE APPROPRIATE
- for compound information, instead of using string, we can use static nested class
#### ITEM 63: BEWARE THE PERFORMANCE OF STRING CONCATENATION
- We can use `StringBuilder` instead of string concatenation
  - String concatenation requires quadratic time
    - As String is immutable
    - Concatenation requires a new copy of a string and a string builder
    - Let suppose, if we are concatenating a string in a loop (let n = 100) then 100 new string (and 100 string builder) objects will be created in heap
#### ITEM 64: REFER TO OBJECTS BY THEIR INTERFACES
- We can change implementation without changing any code
- More generalization
  - List instead of ArrayList, LinkedHashList
  - Map instead of HashMap, LinkedHashMap etc
#### ITEM 65: PREFER INTERFACES TO REFLECTION
- We use reflection when a class is not present at compile time.
  - Use reflection only to instantiate objects (of unknown classes) and access the objects using interface or superclass that is known at compile time
#### ITEM 66: USE NATIVE METHODS JUDICIOUSLY
- Java Native Interface have three main uses:
  - access to platform-specific facilities
  - access to libraries of native code
  - performance critical parts
- Only use native methods to use native libraries when no equivalent libraries are available in Java
- Disadvantages of using JNI
  - memory corruption
  - hard to debug
  - garbage collector cannot trace native memory usage
  - cost while going into and out of native code
  - native method requires **glue code**
#### ITEM 67: OPTIMIZE JUDICIOUSLY
- Don't sacrifice sound architectural principles for performance
- Strive to write good programs rather than fast ones
  - If a good program is not fast enough, its architecture will allow it to be optimized
- Strive to avoid design decisions that limit performance
- Consider the performance consequences of your API design decisions
  - We should avoid following items:
    - Needless defensive copying
    - Inheritance over composition
    - Implementation type over Interface type
- Measure performance before and after each attempted optimization 
- A Program spends 90% of their time in 10% of their code
- Profiling tools can help to decide where to focus optimization efforts
- Choice of algorithm (to efficient one) can increase performance without low level optimizations
#### ITEM 68: ADHERE TO GENERALLY ACCEPTED NAMING CONVENTIONS
- Typographical naming conventions

|  Identifier Type   |                     Example                     |
|:------------------:|:-----------------------------------------------:|
| Package or module  |      `org.unit.jupiter, com.google.common`      |
| Class or Interface | `Stream, FutureTask, LinkedHashMap, HttpClient` |
|  Method or Field   |          `remove, groupingBy, getCrc`           |
|   Constant Field   |         `MIN_VALUE, NEGATIVE_INFINITY`          |
|   Local Variable   |              `i, denom, houseNum`               |
|   Type Parameter   |             `T,E,K,V,X,R,U,V,T1,T2`             |

- Grammatical naming convention
  - Class names (including enum) should name with a **singular noun** or **noun phrase**
    - e.g. `Thread`
  - Non instantiable utility classes are named with **plural noun**
    - e.g. `Collections`, `Collectors`
  - Interfaces are named like classes (or with an adjective ending in able)
    - e.g. `Collection`, `Comparator`, `Runnable`, `Iterable`
  - Methods that do some actions are named with **verbs**
  - Methods that return boolean, prepend **is**, or **has**
  - Methods that return attribute of object on which they invoked, prepend **get**
    - There is debate between `size()` or `getSize()` method names
  - Prepend **toType** for instance method that do type conversion
    - `toString`, `toArray`
  - Prepend **asType** for static method that do type conversion
    - `asList`
  - Prepend **typeValue** for instance methods which return primitive value of boxed type
    - `intValue`
  - Common names for static factories:
    - `from`, `of`, `valueOf`, `instance`, `getInstance`, `newInstance`, `getType`, `newType`
  - **Noun** or **noun phrase** should be used for field names
## Exceptions
#### ITEM 69: USE EXCEPTIONS ONLY FOR EXCEPTIONAL CONDITIONS
- Exceptions should not be used to control flow (they only used for exceptional conditions)
- A well-designed API must not force its clients to use exceptions for ordinary control flow
#### ITEM 70: USE CHECKED EXCEPTIONS FOR RECOVERABLE CONDITIONS AND RUNTIME EXCEPTIONS FOR PROGRAMMING ERRORS
- [Worth to read](https://www.oracle.com/technical-resources/articles/enterprise-architecture/effective-exceptions-part1.html)
#### ITEM 71: AVOID UNNECESSARY USE OF CHECKED EXCEPTIONS
#### ITEM 72: FAVOR THE USE OF STANDARD EXCEPTIONS
- Familiar Exceptions
  - `IllegalArgumentException`
  - `IllegalStateException`
  - `IllegalStateException`
  - `IndexOutOfBoundsException`
  - `ConcurrentModificationException`
  - `UnsupportedOperationException`
- Do not reuse `Exception`, `RuntimeException`, `Throwable` or `Error` directly
  - Try these classes as abstract
- Subclass a standard exception if needed but remember that Exceptions are serializable
#### ITEM 73: THROW EXCEPTIONS APPROPRIATE TO THE ABSTRACTION
- Use **exception translation** to avoid disconcerting exceptions
  - Higher layers should catch lower-level exceptions and, in their place, throw exceptions that can be explained in terms of the higher-level abstraction
- Along with Exception Translation, we can use **exception chaining**
  - Exception chaining is helpful to get lower level exception cause
  - The lower level exception (the cause) is passed to the higher level exception
  - We can use `getCause` to access that lower level exception programmatically
  - It integrate the exception stack-trace with cause as well
#### ITEM 74: DOCUMENT ALL EXCEPTIONS THROWN BY EACH METHOD
- Use the Javadoc `@throws` tag to document each exception that method can throw
#### ITEM 75: INCLUDE FAILURE-CAPTURE INFORMATION IN DETAIL MESSAGES
- We may have constructor (of subclass of a runtime exception) which may accept significant parameters and then we construct the detail message in constructor
#### ITEM 76: STRIVE FOR FAILURE ATOMICITY
- Failure-Atomic
  - A failed method invocation should leave the object in the state that it was in prior to the invocation.
  - We can achieve that behavior using immutable objects.
  - For mutable objects the most common way to achieve failure atomicity is:
    - to check parameters for validity before performing the operation
    - order the computation so that any part that may fail takes place before any part that modifies the object
    - perform the operation on a temporary copy of the object
    - recovery code
#### ITEM 77: DON’T IGNORE EXCEPTIONS
## Concurrency
#### ITEM 78: SYNCHRONIZE ACCESS TO SHARED MUTABLE DATA
- Synchronization is required for reliable communication between threads as well as for mutual exclusion.
- Synchronization is not guaranteed to work unless both read and write operations are synchronized
  - use `synchronized` keyword for synchronization
- `volatile` modifier performs no mutual exclusion, it guarantees that any thread that reads the field will see the most recently written value.
#### ITEM 79: AVOID EXCESSIVE SYNCHRONIZATION
- Inside a synchronized region, do not invoke a method that is designed to be overridden
- We should do as little work as possible inside synchronized regions
- To achieve synchronization in mutable class:
  - Leave for client to synchronize it (Collections in `java.util`)
  - Synchronize internally (`java.util.concurrent`)
#### ITEM 80: PREFER EXECUTORS, TASKS, AND STREAMS TO THREADS
- `java.util.concurrent.Executors` class contains static factories that provide almost all type of executors
  - thread pool executor execute a requests in queue by multiple threads
    - `Executors.newCachedThreadPool` is good for lightly loaded servers
    - `Executors.newFixedThreadPool` is good for heavily loaded servers
- We should refrain from working directly with threads
  - When we work directly with thread, a Thread serves as both a unit of work and the mechanism for executing it
  - The unit of work and execution mechanism are separated in **Executor Framework**
- Unit of Work -> Task
  - Two types of tasks
    - Runnable (returns no value)
    - Callable (returns a value)
- `Executor` (interface)
  - `AbstractExecutorService` (Abstract class)
    - ThreadPoolExecutor
    - ScheduledThreadPoolExecutor
    - ForkJoinPool
      - It split up into smaller subtasks and uses a work-stealing algorithm to distribute tasks among its threads, resulting in higher CPU utilization, higher throughput and lower latency.
#### ITEM 81: PREFER CONCURRENCY UTILITIES TO WAIT AND NOTIFY
- Higher-level utilities in `java.util.concurrent`
  - Executor Framework
  - Concurrent Collections
    - ConcurrentHashMap
    - ConcurrentLinkedQueue
  - `Synchronizers` (that enable threads to wait for one another)
    - CountDownLatch
    - Semaphore
- Always use the **wait loop idiom** to invoke the wait method; never invoke it outside a loop.
  - Testing the condition before waiting and skipping the wait if the condition already holds are necessary to ensure liveliness.
    - If the condition already holds and the `notify` (or `notifyall`) has already been invoked before a thread waits, there is no guarantee that the thread will ever wake from the wait
- use `notifyAll` in preference to `notify`
#### ITEM 82: DOCUMENT THREAD SAFETY
- Leve of Thread safety:
  - **Immutable**: No external synchronization is necessary (String, Long, BigInteger)
  - **Unconditionally thread-safe**: Instances of this class are mutable, but class has sufficient internal synchronization, thus no need of external synchronization
  - **Conditionally thread-safe**: Some methods requires external synchronizations 
  - **Not thread-safe**: Mutable and external synchronization required
  - **Thread-hostile**: Unsafe for concurrent use even using external synchronization
    - Usually results form modifying static without synchronization
#### ITEM 83: USE LAZY INITIALIZATION JUDICIOUSLY
- Lazy initialization is the act of delaying the initialization of a field until its value is needed
- We should initialize most fields normally (not lazily)
- If we need to initialize a field lazily to achieve performance goals or to break a harmful initialization circularity, then we should use appropriate lazy initialization technique
  - For instance fields: **double-check idiom**
    ```
      private volatile FieldType field;
    
      private FieldType getField() {
        FieldType result = field;
        if (result == null) { // First check (no locking)
          synchronized(this) {
            if (field == null) { // Second check (with locking)
              field = result = computeFieldValue();
            }
          }
        }
      }
    ```
  - For static fields: **lazy initialization holder class idiom**
    ```
        private static class FieldHolder {
            static final FieldType field = computeFieldValue();
        }
    
        private static FieldType getField() {
          return FieldHolder.field;
        }
      ```
  - For instance field that can tolerate repeated initialization: **single check idiom**
    ```
      private volatile FieldType field;
    
      private FieldType getField() {
        FieldType result = field;
        if (result == null) {
          field = result = computeFieldValue();
        }
        return resutl;
      }
    ```
#### ITEM 84: DON’T DEPEND ON THE THREAD SCHEDULER
- Threads should not run if they aren't doing useful work
- Threads should not busy-wait
- Don't use `Thread.yield`

## Serialization
#### ITEM 85: PREFER ALTERNATIVES TO JAVA SERIALIZATION
- The best way to avoid serialization exploits is never to deserialize anything
- There is no reason to use Java serialization in any new system you write
- Deserialization of untrusted data is inherently dangerous and should be avoided
#### ITEM 86: IMPLEMENT SERIALIZABLE WITH GREAT CAUTION
- A major cost of implementing Serializable is that it decreases the flexibility to change a class's implementation once it has been released
- A second cost of implementing Serializable is that it increases the likelihood of bugs and security holes
- A third cost of implementing Serializable is that it increases the testing burden associated with releasing a new version of a class
- Implementing Serializable is not a decision to be undertaken lightly
- Classes designed for inheritance should rarely implement Serializable and interfaces should rarely extend it
- Inner classes should not implement Serializable
#### ITEM 87: CONSIDER USING A CUSTOM SERIALIZED FORM
- Do not accept the default serialized form without first considering whether it is appropriate
- The default serialized form is likely to be appropriate if an object's physical representation is identical to its logical content
- Using the default serialized form when an object's physical representation differs substantially from its logical data content has four disadvantages:
  - It permanently ties the exported API to the current internal representation
  - It can consume excessive space
  - It can consume excessive time
  - It can cause stack overflows
#### ITEM 88: WRITE `readObject` methods defensively
- `readObject` method must create defensive copies of all mutable fields
- `readObject` method must validate invariants of a class
- `readObject` method must not invoke overrideable methods in the class
#### ITEM 89: FOR INSTANCE CONTROL, PREFER ENUM TYPES TO `readResolve`
- If we are depending on `readResolve` for instance control, all instance fields with object reference must be declared `transient`
#### ITEM 90: CONSIDER SERIALIZATION PROXIES INSTEAD OF SERIALIZED INSTANCES
- **Serialization Proxy Pattern** reduces the risks arisen by serialization
- Design
  - Private static nested class that represents logical state of enclosing class instance
  - That private static nested class is known as **serialization proxy**
  - One argument (type is enclosing class) constructor
    - Copy constructor (copy only data)
  - Both enclosing and nested class implements `Serializable`
  - Add `writeReplace` method in enclosing class
    - This method causes the Serialization System to emit a `SerializationProxy` instance instead of an instance of the enclosing class
    - In other words, `writeReplace` method translates an instance of the enclosing class to its serialization proxy prior to serialization
    - With this method in place, the serialization system will never generate a serialized instance of the enclosing class
  - make `readObject` method on the enclosing class to throw exception like `InvalidObjectException("Proxy required")` 
  - Add `readResolve` method on the `SerializationProxy` class that returns the logically equivalent instance of enclosing class
- Pros
  - Immutability
  - No need to defensive copying in `readObject`
  - No need to think about which fields might be compromised by serialization attacks
## Extra notes
### Java Bean Pattern
- no arg constructor with setters
- disadvantages like multiple calls for this construction, cannot achieve immutability
### Constructor telescoping
- We can have multiple constructors which are delegating to other one (like 1-arg constructor to 2-arg constructor with second parameter is null)
- hard to write client code when there are many parameters, and harder still to read it.
### Heap Pollution
- Heap pollution simply means there is *bad stuff* in heap
- the bad stuff here is objects of type `A` where we ought to have objects of type `B`
- some hole in static typing is allowing the bad stuff to leak into the heap
- Heap pollution cause unexpected `ClassCastException`
### Site Effect
- A side effect is an observable change in the state of teh system that is not obviously required in order to achieve the post condition
### State-dependent vs State Testing Method
- A method that can be invoked only under certain unpredictable conditions is a **state-dependent** method
- A method indicating whether it is appropriate to invoke the **state-dependent** method is a **state-testing** method
  - e.g. `next` method in `Iterator` is **state-dependent** method while `hasNext` in `Iterator` is **state-testing** method
### Serialization
- Any `readObject` method returns a newly created instance