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

## Extra notes
### Java Bean Pattern
- no arg constructor with setters
- disadvantages like multiple calls for this construction, cannot achieve immutability
### Constructor telescoping
- We can have multiple constructors which are delegating to other one (like 1-arg constructor to 2-arg constructor with second parameter is null)
- hard to write client code when there are many parameters, and harder still to read it.
