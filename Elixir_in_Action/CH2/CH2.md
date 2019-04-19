# CH2 Building blocks

This chapter covers

- Using the interactive shell
- Working with variables
- Organizing your code
- Understanding the type system
- Working with Operators
- Understanding the runtime



##  Working with variables

Elixir is a dynamic programming language -> It doesn't explicitly declare a variable or its type. Instead, the variable is determined by whatever data it contains at the moment. In Elixir terms, assignment is called *binding*. 

```elixir
monthly_salary = 10000
```

In Elixir, a variable name always starts with a lowercase alphabetic -> In Erlang Variable start with uppercase

```Erlang
#Erlang
A = 100.

#Elixir
a = 100
```



Also variable name can be end with the question mark or exclamation mark characters.  

Variable names can be rebound to a different value.

```elixir
#Erlang
A = 100.
A = 110.
#Error

#Elixir
a = 100
a = 110
#Possible

```

Elixir is a ***garbage-collection language.***  



## Organizing your code

### 2.3.1 Modules

A modules is a collection of functions, somewhat like a namespace. Every Elixir function must be defined inside a module.

A module name must follow certain rules. It starts with an uppercase letter and is usually written in CamelCase style.



### 2.3.2 Functions ###

 As with variable, function names can end with the ? and ! characters. The ? character is often used to indicate a function that returns either true or false. Placing the character ! at the end of the name indicates a function that may raise a runtime error.-> Both of these are conventions, rather than rules.

 Function can be defined using the def macro

```elixir
demodul Geometry do
    def rectangle_area(a, b) do
    ...
	end
	
	def function_has_no_argument do
	...
	end
end	
```

 There is no explicit return in Elixir -> The return value of a function is the return value of its last expression.

```elixir
Geometry.rectangle(3,2)
Geometry.rectangle 3, 2

#Same expression
```

Elixir comes with a built-in operator, |>, called *pipeline operator*

```elixir
-5 |> abs() |> (Integer.to-string(abs(-5)))
```

Pipeline operator places the result of the previous call as the first argument of the next call. So the following code,

```elixir
prev(arg1, arg2) |> next(arg3, arg4)
#It means
next(prev(arg1, arg2), arg3, arg4)
```

***Multi-line pipelines don;t work in the shell***



### 2.3.3 Function arity ###

Arity is a fancy name of the number of arguments a function receives.

```elixir
defmodule Rectangle do
	def area(a), do: area(a,a)  %%Rectangle.area/1 -> 1 arity
	def area(a, b) do: a * b	%%Rectangle.area/2 -> 2 arity
```



```elixir
# Same-name functions, different arities, default params
defmodule Calculator do
    def sum(a) do
    	sum(a, 0)
    end
    
    def sum(a, b) do  
	    a + b
    end
end
```

A lower-arity function is implemented in terms of a higher-arity one, This pattern is so frequent that Elixir allows you to specify defaults for arguments by using the \ \\operaor followed by the ***argument's*** default value

```elixir
defmodule Clculator do
	def sum(a, b \\ 0) do
		a + b
	end
end
```

```elixir
defmodule MyModule do
	def fun(a, b \\ 1, c, d, \\ 2) do
		a + b + c + d
	end
end
```

>  Similar with argument of fun in C/C++ or other language
>
> But in Elixir, \\\ set default of ***multiple argument***



### 2.3.4 Function visibility ###

```elixir
# Module with a public and a private function
defmodule TestPrivate do
    def double(a) do 		# Public function
        sum(a,b) 		# Calls the private function
    end

    defp sum(a,b) do		# Private function
        a + b
        end
    end    
```







