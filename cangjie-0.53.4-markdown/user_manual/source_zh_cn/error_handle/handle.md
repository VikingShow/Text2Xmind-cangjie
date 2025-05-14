





throw 和处理异常 \- 仓颉语言用户指南




































1. **1\.** 初识仓颉语言❱
2. 1. [**1\.1\.** 初识仓颉语言](../../source_zh_cn/first_understanding/basic.html)
	2. [**1\.2\.** 安装仓颉工具链](../../source_zh_cn/first_understanding/install_Community.html)
	3. [**1\.3\.** 运行第一个仓颉程序](../../source_zh_cn/first_understanding/hello_world.html)
3. **2\.** 基本概念❱
4. 1. [**2\.1\.** 标识符](../../source_zh_cn/basic_programming_concepts/identifier.html)
	2. [**2\.2\.** 程序结构](../../source_zh_cn/basic_programming_concepts/program_structure.html)
	3. [**2\.3\.** 表达式](../../source_zh_cn/basic_programming_concepts/expression.html)
	4. [**2\.4\.** 函数](../../source_zh_cn/basic_programming_concepts/function.html)
5. **3\.** 基础数据类型❱
6. 1. [**3\.1\.** 整数类型](../../source_zh_cn/basic_data_type/integer.html)
	2. [**3\.2\.** 浮点类型](../../source_zh_cn/basic_data_type/float.html)
	3. [**3\.3\.** 布尔类型](../../source_zh_cn/basic_data_type/bool.html)
	4. [**3\.4\.** 字符类型](../../source_zh_cn/basic_data_type/characters.html)
	5. [**3\.5\.** 字符串类型](../../source_zh_cn/basic_data_type/strings.html)
	6. [**3\.6\.** 元组类型](../../source_zh_cn/basic_data_type/tuple.html)
	7. [**3\.7\.** 数组类型](../../source_zh_cn/basic_data_type/array.html)
	8. [**3\.8\.** 区间类型](../../source_zh_cn/basic_data_type/range.html)
	9. [**3\.9\.** Unit 类型](../../source_zh_cn/basic_data_type/unit.html)
	10. [**3\.10\.** Nothing 类型](../../source_zh_cn/basic_data_type/nothing.html)
7. **4\.** 函数❱
8. 1. [**4\.1\.** 定义函数](../../source_zh_cn/function/define_functions.html)
	2. [**4\.2\.** 调用函数](../../source_zh_cn/function/call_functions.html)
	3. [**4\.3\.** 函数类型](../../source_zh_cn/function/first_class_citizen.html)
	4. [**4\.4\.** 嵌套函数](../../source_zh_cn/function/nested_functions.html)
	5. [**4\.5\.** Lambda 表达式](../../source_zh_cn/function/lambda.html)
	6. [**4\.6\.** 闭包](../../source_zh_cn/function/closure.html)
	7. [**4\.7\.** 函数调用语法糖](../../source_zh_cn/function/function_call_desugar.html)
	8. [**4\.8\.** 函数重载](../../source_zh_cn/function/function_overloading.html)
	9. [**4\.9\.** 操作符重载](../../source_zh_cn/function/operator_overloading.html)
	10. [**4\.10\.** const 函数和常量求值](../../source_zh_cn/function/const_func_and_eval.html)
9. **5\.** 结构类型❱
10. 1. [**5\.1\.** 定义 struct 类型](../../source_zh_cn/struct/define_struct.html)
	2. [**5\.2\.** 创建 struct 实例](../../source_zh_cn/struct/create_instance.html)
	3. [**5\.3\.** mut 函数](../../source_zh_cn/struct/mut.html)
11. **6\.** 枚举类型和模式匹配❱
12. 1. [**6\.1\.** 枚举类型](../../source_zh_cn/enum_and_pattern_match/enum.html)
	2. [**6\.2\.** Option 类型](../../source_zh_cn/enum_and_pattern_match/option_type.html)
	3. [**6\.3\.** 模式概述](../../source_zh_cn/enum_and_pattern_match/pattern_overview.html)
	4. [**6\.4\.** 模式的 Refutability](../../source_zh_cn/enum_and_pattern_match/pattern_refutability.html)
	5. [**6\.5\.** match 表达式](../../source_zh_cn/enum_and_pattern_match/match.html)
	6. [**6\.6\.** if\-let 表达式](../../source_zh_cn/enum_and_pattern_match/if_let.html)
	7. [**6\.7\.** while\-let 表达式](../../source_zh_cn/enum_and_pattern_match/while_let.html)
	8. [**6\.8\.** 其他使用模式的地方](../../source_zh_cn/enum_and_pattern_match/other.html)
13. **7\.** 类和接口❱
14. 1. [**7\.1\.** 类](../../source_zh_cn/class_and_interface/class.html)
	2. [**7\.2\.** 接口](../../source_zh_cn/class_and_interface/interface.html)
	3. [**7\.3\.** 属性](../../source_zh_cn/class_and_interface/prop.html)
	4. [**7\.4\.** 子类型关系](../../source_zh_cn/class_and_interface/subtype.html)
	5. [**7\.5\.** 类型转换](../../source_zh_cn/class_and_interface/typecast.html)
15. **8\.** 泛型❱
16. 1. [**8\.1\.** 泛型概述](../../source_zh_cn/generic/generic_overview.html)
	2. [**8\.2\.** 泛型函数](../../source_zh_cn/generic/generic_function.html)
	3. [**8\.3\.** 泛型接口](../../source_zh_cn/generic/generic_interface.html)
	4. [**8\.4\.** 泛型类](../../source_zh_cn/generic/generic_class.html)
	5. [**8\.5\.** 泛型结构体](../../source_zh_cn/generic/generic_struct.html)
	6. [**8\.6\.** 泛型枚举](../../source_zh_cn/generic/generic_enum.html)
	7. [**8\.7\.** 泛型类型的子类型关系](../../source_zh_cn/generic/generic_subtype.html)
	8. [**8\.8\.** 类型别名](../../source_zh_cn/generic/typealias.html)
	9. [**8\.9\.** 泛型约束](../../source_zh_cn/generic/generic_constraint.html)
17. **9\.** 扩展❱
18. 1. [**9\.1\.** 扩展概述](../../source_zh_cn/extension/extend_overview.html)
	2. [**9\.2\.** 直接扩展](../../source_zh_cn/extension/direct_extension.html)
	3. [**9\.3\.** 接口扩展](../../source_zh_cn/extension/interface_extension.html)
	4. [**9\.4\.** 访问规则](../../source_zh_cn/extension/access_rules.html)
19. **10\.** Collection 类型❱
20. 1. [**10\.1\.** 基础 Collection 类型概述](../../source_zh_cn/Collections/collection_overview.html)
	2. [**10\.2\.** ArrayList](../../source_zh_cn/Collections/collection_arraylist.html)
	3. [**10\.3\.** HashSet](../../source_zh_cn/Collections/collection_hashset.html)
	4. [**10\.4\.** HashMap](../../source_zh_cn/Collections/collection_hashmap.html)
	5. [**10\.5\.** Iterable 和 Collections](../../source_zh_cn/Collections/collection_iterable_collections.html)
21. **11\.** 包❱
22. 1. [**11\.1\.** 包的概述](../../source_zh_cn/package/package_overview.html)
	2. [**11\.2\.** 包的声明](../../source_zh_cn/package/package_name.html)
	3. [**11\.3\.** 顶层声明的可见性](../../source_zh_cn/package/toplevel_access.html)
	4. [**11\.4\.** 包的导入](../../source_zh_cn/package/import.html)
	5. [**11\.5\.** 程序入口](../../source_zh_cn/package/entry.html)
23. **12\.** 异常处理❱
24. 1. [**12\.1\.** 定义异常](../../source_zh_cn/error_handle/exception_overview.html)
	2. [**12\.2\.** throw 和处理异常](../../source_zh_cn/error_handle/handle.html)
	3. [**12\.3\.** 常见运行时异常](../../source_zh_cn/error_handle/common_runtime_exceptions.html)
	4. [**12\.4\.** 使用 Option](../../source_zh_cn/error_handle/use_option.html)
25. **13\.** 并发编程❱
26. 1. [**13\.1\.** 并发概述](../../source_zh_cn/concurrency/concurrency_overview.html)
	2. [**13\.2\.** 创建线程](../../source_zh_cn/concurrency/create_thread.html)
	3. [**13\.3\.** 访问线程](../../source_zh_cn/concurrency/use_thread.html)
	4. [**13\.4\.** 终止线程](../../source_zh_cn/concurrency/terminal_thread.html)
	5. [**13\.5\.** 同步机制](../../source_zh_cn/concurrency/sync.html)
	6. [**13\.6\.** 线程睡眠指定时长 sleep](../../source_zh_cn/concurrency/sleep.html)
27. **14\.** 基础 I/O 操作❱
28. 1. [**14\.1\.** I/O 流概述](../../source_zh_cn/Basic_IO/basic_IO_overview.html)
	2. [**14\.2\.** I/O 节点流](../../source_zh_cn/Basic_IO/basic_IO_source_stream.html)
	3. [**14\.3\.** I/O 处理流](../../source_zh_cn/Basic_IO/basic_IO_process_stream.html)
29. **15\.** 网络编程❱
30. 1. [**15\.1\.** 网络编程概述](../../source_zh_cn/Net/net_overview.html)
	2. [**15\.2\.** Socket 编程](../../source_zh_cn/Net/net_socket.html)
	3. [**15\.3\.** Http 编程](../../source_zh_cn/Net/net_http.html)
	4. [**15\.4\.** Websocket 编程](../../source_zh_cn/Net/net_websocket.html)
31. **16\.** 宏❱
32. 1. [**16\.1\.** 宏的简介](../../source_zh_cn/Macro/macro_introduction.html)
	2. [**16\.2\.** Tokens 相关类型和 quote 表达式](../../source_zh_cn/Macro/Tokens_types_and_quote_expressions.html)
	3. [**16\.3\.** 语法节点](../../source_zh_cn/Macro/sytax_node.html)
	4. [**16\.4\.** 宏的实现](../../source_zh_cn/Macro/implementation_of_macros.html)
	5. [**16\.5\.** 编译、报错与调试](../../source_zh_cn/Macro/compiling_error_reporting_and_debugging.html)
	6. [**16\.6\.** 宏包定义和导入](../../source_zh_cn/Macro/defining_and_importing_macro_package.html)
	7. [**16\.7\.** 内置编译标记](../../source_zh_cn/Macro/builtin_compilation_flags.html)
	8. [**16\.8\.** 实用案例](../../source_zh_cn/Macro/pratical_case.html)
33. **17\.** 反射和注解❱
34. 1. [**17\.1\.** 动态特性](../../source_zh_cn/reflect_and_annotation/dynamic_feature.html)
	2. [**17\.2\.** 注解](../../source_zh_cn/reflect_and_annotation/anno.html)
35. **18\.** 跨语言互操作❱
36. 1. [**18\.1\.** 仓颉\-C 互操作](../../source_zh_cn/FFI/cangjie-c.html)
	2. [**18\.2\.** 仓颉\-Python 互操作](../../source_zh_cn/FFI/cangjie-python.html)
37. **19\.** 编译和构建❱
38. 1. [**19\.1\.** cjc 使用](../../source_zh_cn/Compile-And-Build/cjc_usage.html)
	2. [**19\.2\.** cjpm 介绍](../../source_zh_cn/Compile-And-Build/cjpm_usage.html)
	3. [**19\.3\.** 条件编译](../../source_zh_cn/Compile-And-Build/conditional_compilation.html)
39. **20\.** 附录❱
40. 1. [**20\.1\.** cjc 编译选项](../../source_zh_cn/Appendix/compile_options.html)
	2. [**20\.2\.** Linux 版本工具链的支持与安装](../../source_zh_cn/Appendix/linux_toolchain_install.html)
	3. [**20\.3\.** runtime 环境变量使用手册](../../source_zh_cn/Appendix/runtime_env.html)
	4. [**20\.4\.** 关键字](../../source_zh_cn/Appendix/keyword.html)
	5. [**20\.5\.** 操作符](../../source_zh_cn/Appendix/operator.html)
	6. [**20\.6\.** 操作符函数](../../source_zh_cn/Appendix/operator_function.html)
	7. [**20\.7\.** TokenKind 类型](../../source_zh_cn/Appendix/tokenkind_type.html)




















* Light
* Rust
* Coal
* Navy
* Ayu






仓颉语言用户指南
========




















[throw 和处理异常](#throw-和处理异常)
===========================


上文介绍了如何自定义异常，接下来我们学习如何抛出和处理异常。


* 由于异常是 `class` 类型，只需要按 class 对象的构建方式去创建异常即可。如表达式 `FatherException()` 即创建了一个类型为 `FatherException` 的异常。
* 仓颉语言提供 `throw` 关键字，用于抛出异常。用 `throw` 来抛出异常时，`throw` 之后的表达式必须是 `Exception` 的子类型（同为异常的 `Error` 不可以手动 `throw` ），如 `throw ArithmeticException("I am an Exception!")` （被执行到时）会抛出一个算术运算异常。
* `throw` 关键字抛出的异常需要被捕获处理。若异常没有被捕获，则由系统调用默认的异常处理函数。


异常处理由 `try` 表达式完成，可分为：


* 不涉及资源自动管理的普通 try 表达式；
* 会进行资源自动管理 try\-with\-resources 表达式。


[普通 try 表达式](#普通-try-表达式)
-------------------------


普通 try 表达式包括三个部分：try 块，catch 块和 finally 块。


* try 块，以关键字 `try` 开始，后面紧跟一个由表达式与声明组成的块（用一对花括号括起来，定义了新的局部作用域，可以包含任意表达式和声明，后简称“块”），try 后面的块内可以抛出异常，并被紧随的 catch 块所捕获并处理（如果不存在 catch 块或未被捕获，则在执行完 finally 块后，该异常继续被抛出）。
* catch 块，一个普通 try 表达式可以包含零个或多个 catch 块（当没有 catch 块时必须有 finally 块）。每个 catch 块以关键字 `catch` 开头，后跟一条 `catchPattern` 和一个块，`catchPattern` 通过模式匹配的方式匹配待捕获的异常。一旦匹配成功，则交由其后跟随的块进行处理，并且忽略它后面的其他 catch 块。当某个 catch 块可捕获的异常类型均可被定义在它前面的某个 catch 块所捕获时，会在此 catch 块处报“catch 块不可达”的 warning。
* finally 块，以关键字 `finally` 开始，后面紧跟一个块。原则上，finally 块中主要实现一些“善后”的工作，如释放资源等，且要尽量避免在 finally 块中再抛异常。并且无论异常是否发生（即无论 try 块中是否抛出异常），finally 块内的内容都会被执行（若异常未被处理，执行完 finally 块后，继续向外抛出异常）。一个 try 表达式在包含 catch 块时可以不包含 finally 块，否则必须包含 finally 块。


`try` 后面紧跟的块以及每个 `catch` 块的的作用域互相独立。


下面是一个只有 try 块和 catch 块的简单示例：




```
main() {
    try {
        throw NegativeArraySizeException("I am an Exception!")
    } catch (e: NegativeArraySizeException) {
        println(e)
        println("NegativeArraySizeException is caught!")
    }
    println("This will also be printed!")
}

```

执行结果为



```
NegativeArraySizeException: I am an Exception!
NegativeArraySizeException is caught!
This will also be printed!

```

`catchPattern` 中引入的变量作用域级别与 `catch` 后面的块中变量作用域级别相同，在 catch 块中再次引入相同名字会触发重定义错误。例如：



```
main() {
    try {
        throw NegativeArraySizeException("I am an Exception!")
    } catch (e: NegativeArraySizeException) {
        println(e)
        let e = 0 // Error, redefinition
        println(e)
        println("NegativeArraySizeException is caught!")
    }
    println("This will also be printed!")
}

```

下面是带有 finally 块的 try 表达式的简单示例：




```
main() {
    try {
        throw NegativeArraySizeException("NegativeArraySizeException")
    } catch (e: NegativeArraySizeException) {
        println("Exception info: ${e}.")
    } finally {
        println("The finally block is executed.")
    }
}

```

执行结果为



```
Exception info: NegativeArraySizeException: NegativeArraySizeException.
The finally block is executed.

```

try 表达式可以出现在任何允许使用表达式的地方。try 表达式的类型的确定方式，与 `if`、`match` 表达式等多分支语法结构的类型的确定方式相似，为 finally 分支除外的所有分支的类型的最小公共父类型。例如下面代码中的 try 表达式和变量 `x` 的类型均为 E 和 D 的最小公共父类型 D；finally 分支中的 `C()` 并不参与公共父类型的计算（若参与，则最小公共父类型会变为 `C`）。


另外，当 `try` 表达式的值没有被使用时，其类型为 `Unit`，不要求各分支的类型有最小公共父类型。




```
open class C { }
open class D <: C { }
class E <: D { }
main () {
    let x = try {
        E()
    } catch (e: Exception) {
        D()
    } finally {
        C()
    }
    0
}

```

[Try\-with\-resources 表达式](#try-with-resources-表达式)
---------------------------------------------------


Try\-with\-resources 表达式主要是为了自动释放非内存资源。不同于普通 try 表达式，try\-with\-resources 表达式中的 catch 块和 finally 块均是可选的，并且 try 关键字其后的块之间可以插入一个或者多个 `ResourceSpecification` 用来申请一系列的资源（`ResourceSpecification` 并不会影响整个 try 表达式的类型）。这里所讲的资源对应到语言层面即指对象，因此 `ResourceSpecification` 其实就是实例化一系列的对象（多个实例化之间使用“,”分隔）。使用 try\-with\-resources 表达式的例子如下所示：




```
class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}

main() {
    try (r = R()) {
        println("Get the resource")
    }
}

```

程序输出结果为：



```
Get the resource

```

`try` 关键字和 `{}` 之间引入的名字，其作用域与 `{}` 中引入的变量作用域级别相同，在 `{}` 中再次引入相同名字会触发重定义错误。



```
class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}

main() {
    try (r = R()) {
        println("Get the resource")
        let r = 0 // Error, redefinition
        println(r)
    }
}

```

Try\-with\-resources 表达式中的 `ResourceSpecification` 的类型必须实现 Resource 接口，并且尽量保证其中的 `isClosed` 函数不要再抛异常：



```
interface Resource {
    func isClosed(): Bool
    func close(): Unit
}

```

需要说明的是，try\-with\-resources 表达式中一般没有必要再包含 catch 块和 finally 块，也不建议用户再手动释放资源。因为 try 块执行的过程中无论是否发生异常，所有申请的资源都会被自动释放，并且执行过程中产生的异常均会被向外抛出。但是，如果需要显式地捕获 try 块或资源申请和释放过程中可能抛出的异常并处理，仍可在 try\-with\-resources 表达式中包含 catch 块和 finally 块：




```
class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}

main() {
    try (r = R()) {
        println("Get the resource")
    } catch (e: Exception) {
        println("Exception happened when executing the try-with-resources expression")
    } finally {
        println("End of the try-with-resources expression")
    }
}

```

程序输出结果如下：



```
Get the resource
End of the try-with-resources expression

```

Try\-with\-resources 表达式的类型是 `Unit`。


[CatchPattern 进阶介绍](#catchpattern-进阶介绍)
---------------------------------------


大多数时候，我们只想捕获某一类型和其子类型的异常，这时候我们使用 CatchPattern 的**类型模式**来处理；但有时也需要所有异常做统一处理（如此处不该出现异常，出现了就统一报错），这时可以使用 CatchPattern 的**通配符模式**来处理。


类型模式在语法上有两种格式：


* `Identifier: ExceptionClass`。此格式可以捕获类型为 `ExceptionClass` 及其子类的异常，并将捕获到的异常实例转换成 `ExceptionClass`，然后与 `Identifier` 定义的变量进行绑定，接着就可以在 catch 块中通过 Identifier 定义的变量访问捕获到的异常实例。
* `Identifier: ExceptionClass_1 | ExceptionClass_2 | ... | ExceptionClass_n`。此格式可以通过连接符 `|` 将多个异常类进行拼接，连接符 `|` 表示“或”的关系：可以捕获类型为 `ExceptionClass_1` 及其子类的异常，或者捕获类型为 `ExceptionClass_2` 及其子类的异常，依次类推，或捕获类型为 `ExceptionClass_n` 及其子类的异常（假设 n 大于 1）。当待捕获异常的类型属于上述“或”关系中的任一类型或其子类型时，此异常将被捕获。但是由于无法静态地确定被捕获异常的类型，所以被捕获异常的类型会被转换成由 `|` 连接的所有类型的最小公共父类，并将异常实例与 `Identifier` 定义的变量进行绑定。因此在此类模式下，catch 块内只能通过 `Identifier` 定义的变量访问 `ExceptionClass_i（1 <= i <= n）` 的最小公共父类中的成员变量和成员函数。当然，也可以使用通配符代替类型模式中的 `Identifier`，差别仅在于通配符不会进行绑定操作。


示例如下：




```
main(): Int64 {
    try {
        throw IllegalArgumentException("This is an Exception!")
    } catch (e: OverflowException) {
        println(e.message)
        println("OverflowException is caught!")
    } catch (e: IllegalArgumentException | NegativeArraySizeException) {
        println(e.message)
        println("IllegalArgumentException or NegativeArraySizeException is caught!")
    } finally {
        println("finally is executed!")
    }
    return 0
}

```

执行结果：



```
This is an Exception!
IllegalArgumentException or NegativeArraySizeException is caught!
finally is executed!

```

关于“被捕获异常的类型是由 `|` 连接的所有类型的最小公共父类”的示例：




```
open class Father <: Exception {
    var father: Int32 = 0
}

class ChildOne <: Father {
    var childOne: Int32 = 1
}

class ChildTwo <: Father {
    var childTwo: Int32 = 2
}

main() {
    try {
        throw ChildOne()
    } catch (e: ChildTwo | ChildOne) {
        println("ChildTwo or ChildOne?")
    }
}

```

执行结果：



```
ChildTwo or ChildOne?

```

**通配符模式**的语法是 `_`，它可以捕获同级 try 块内抛出的任意类型的异常，等价于类型模式中的 `e: Exception`，即捕获 Exception 子类所定义的异常。示例：



```
// Catch with wildcardPattern.
try {
    throw OverflowException()
} catch (_) {
    println("catch an exception!")
}

```






























