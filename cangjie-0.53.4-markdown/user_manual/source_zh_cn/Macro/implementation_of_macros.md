





宏的实现 \- 仓颉语言用户指南




































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




















[宏的实现](#宏的实现)
=============


本章节介绍仓颉宏的定义和使用，仓颉宏可以分为[非属性宏](#%E9%9D%9E%E5%B1%9E%E6%80%A7%E5%AE%8F)和[属性宏](#%E5%B1%9E%E6%80%A7%E5%AE%8F)。同时本章节还会介绍宏出现嵌套时的行为。


[非属性宏](#非属性宏)
-------------


非属性宏只接受被转换的代码，不接受其他参数（属性），其定义格式如下：



```
import std.ast.*

public macro MacroName(args: Tokens): Tokens {
    ... // Macro body
}

```

宏的调用格式如下：



```
@MacroName(...)

```

宏调用使用 `()` 括起来。括号里面可以是任意合法 `tokens`，也可以是空。


当宏作用于声明时，一般可以省略括号。参考下面例子



```
@MacroName func name() {}        // Before a FuncDecl
@MacroName struct name {}        // Before a StructDecl
@MacroName class name {}         // Before a ClassDecl
@MacroName var a = 1             // Before a VarDecl
@MacroName enum e {}             // Before a Enum
@MacroName interface i {}        // Before a InterfaceDecl
@MacroName extend e <: i {}      // Before a ExtendDecl
@MacroName mut prop i: Int64 {}  // Before a PropDecl
@MacroName @AnotherMacro(input)  // Before a macro call

```

宏展开过程作用于仓颉语法树，宏展开后，编译器会继续进行后续的编译过程，因此，用户需要保证宏展开后的代码依然是合法的仓颉代码，否则可能引发编译问题。当宏用于声明时，如果省略括号，宏的输入必须是语法合法的声明，IDE 也会提供相应的语法检查和高亮。


下面是几个宏应用的典型示例。


* 示例 1


宏定义文件 `macro_definition.cj`



```
macro package macro_definition

import std.ast.*

public macro TestDef(input: Tokens): Tokens {
    println("I'm in macro body")
    return input
}

```

宏调用文件 `macro_call.cj`



```
package macro_calling

import macro_definition.*

main(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    return 0
}

```

上述代码的编译过程可以参考[宏的编译和使用](./compiling_error_reporting_and_debugging.html#%E5%AE%8F%E7%9A%84%E7%BC%96%E8%AF%91%E5%92%8C%E4%BD%BF%E7%94%A8)。


我们在用例中添加了打印信息，其中宏定义中的 `I'm in macro body` 将在编译 `macro_call.cj` 的期间输出，即对宏定义求值。同时，宏调用点被展开，如编译如下代码：



```
let a: Int64 = @TestDef(1 + 2)

```

编译器将宏返回的 `Tokens` 更新到调用点的语法树上，得到如下代码：



```
let a: Int64 = 1 + 2

```

也就是说，可执行程序中的代码实际变为了：



```
main(): Int64 {
    println("I'm in function body")
    let a: Int64 = 1 + 2
    println("a = ${a}")
    return 0
}

```

`a` 经过计算得到的值为 3，在打印 `a` 的值时插值为 3。至此，上述程序的运行结果为：



```
I'm in function body
a = 3

```


下面看一个更有意义的用宏处理函数的例子，这个宏 ModifyFunc 宏的作用是给 MyFunc 增加 Composer 参数，并在`counter++`前后插入一段代码。


* 示例 2


宏定义文件 `macro_definition.cj`



```
// file macro_definition.cj
macro package macro_definition

import std.ast.*

public macro ModifyFunc(input: Tokens): Tokens {
    println("I'm in macro body")
    let funcDecl = FuncDecl(input)
    return quote(
    func $(funcDecl.identifier)(id: Int64) {
        println("start ${id}")
        $(funcDecl.block.nodes)
        println("end")
    })
}

```

宏调用文件 `macro_call.cj`



```
package macro_calling

import macro_definition.*

var counter = 0

@ModifyFunc
func MyFunc() {
    counter++
}

func exModifyFunc() {
    println("I'm in function body")
    MyFunc(123)
    println("MyFunc called: ${counter} times")
    return 0
}

```

同样的，上述两段代码分别位于不同文件中，先编译宏定义文件 `macro_definition.cj`，再编译宏调用 `macro_call.cj` 生成可执行文件。


这个例子中，ModifyFunc 宏的输入是一个函数声明，因此可以省略括号：



```
@ModifyFunc
func MyFunc() {
    counter++
}

```

经过宏展开后，得到如下代码：



```
func MyFunc(id: Int64) {
    println("start ${id}")
    counter++
    println("end")
}

```

MyFunc 会在 main 中调用，它接受的实参也是在 main 中定义的，从而形成了一段合法的仓颉程序。运行时打印如下：



```
I'm in function body
start 123
end
MyFunc called: 1 times

```


[属性宏](#属性宏)
-----------


和非属性宏相比，属性宏的定义会增加一个 Tokens 类型的输入，这个增加的入参可以让开发者输入额外的信息。比如开发者可能希望在不同的调用场景下使用不同的宏展开策略，则可以通过这个属性入参进行标记位设置。同时，这个属性入参也可以传入任意 Tokens，这些 Tokens 可以与被宏修饰的代码进行组合拼接等。下面是一个简单的例子：



```
// Macro definition with attribute
public macro Foo(attrTokens: Tokens, inputTokens: Tokens): Tokens {
    return attrTokens + inputTokens  // Concatenate attrTokens and inputTokens.
}

```

如上面的宏定义，属性宏的入参数量为 2，入参类型为 `Tokens`，在宏定义内，可以对 `attrTokens` 和 `inputTokens` 进行一系列的组合、拼接等变换操作，最后返回新的 `Tokens`。


带属性的宏与不带属性的宏的调用类似，属性宏调用时新增的入参 attrTokens 通过 \[] 传入，其调用形式为：



```
// attribute macro with parentheses
var a: Int64 = @Foo[1+](2+3)

// attribute macro without parentheses
@Foo[public]
struct Data {
    var count: Int64 = 100
}

```

* 宏 Foo 调用，当参数是 `2+3` 时，与 `[]` 内的属性 `1+` 进行拼接，经过宏展开后，得到 `var a: Int64 = 1+2+3` 。
* 宏 Foo 调用，当参数是 struct Data 时，与 `[]` 内的属性 `public` 进行拼接，经过宏展开后，得到



```
public struct Data {
    var count: Int64 = 100
}

```


关于属性宏，需要注意以下几点：


* 带属性的宏，与不带属性的宏相比，能修饰的 AST 是相同的，可以理解为带属性的宏对可传入参数做了增强。
* 要求属性宏调用时，`[]` 内中括号匹配，且可以为空。中括号内只允许对中括号的转义 `\[` 或 `\]`，该转义中括号不计入匹配规则，其他字符会被作为 Token，不能进行转义。



```
@Foo[[miss one](2+3) // Illegal
@Foo[[matched]](2+3) // Legal
@Foo[](2+3)          // Legal, empty in []
@Foo[\[](2+3)        // Legal, use escape for [
@Foo[\(](2+3)        // Illegal, only [ and ] allowed in []

```
* 宏的定义和调用的类型要保持一致：如果宏定义有两个入参，即为属性宏定义，调用时必须加上 `[]`，且内容可以为空；如果宏定义有一个入参，即为非属性宏定义，调用时不能使用 `[]`。


[嵌套宏](#嵌套宏)
-----------


仓颉语言不支持宏定义的嵌套；有条件地支持在宏定义和宏调用中嵌套宏调用。


### [宏定义中嵌套宏调用](#宏定义中嵌套宏调用)


下面是一个宏定义中包含其他宏调用的例子。


宏包 `pkg1` 中定义 `GetIdent` 宏：



```
macro package pkg1

import std.ast.*

public macro GetIdent(attr:Tokens, input:Tokens):Tokens {
    return quote(
        let decl = (parseDecl(input) as VarDecl).getOrThrow()
        let name = decl.identifier.value
        let size = name.size - 1
        let $(attr) = Token(TokenKind.IDENTIFIER, name[0..size])
    )
}

```

宏包 `pkg2` 中定义 `Prop` 宏，其中嵌套了 `GetIdent` 宏的调用：



```
macro package pkg2

import std.ast.*
import pkg1.*

public macro Prop(input:Tokens):Tokens {
    let v = parseDecl(input)
    @GetIdent[ident](input)
    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}

```

宏调用包 `pkg3` 中调用 `Prop` 宏：



```
package pkg3

import pkg2.*
class A {
    @Prop
    private let a_: Int64 = 1
}

main() {
    let b = A()
    println("${b.a}")
}

```

注意，按照宏定义必须比宏调用点先编译的约束，上述 3 个文件的编译顺序必须是：pkg1 \-\> pkg2 \-\> pkg3。pkg2 中的 `Prop` 宏定义：



```
public macro Prop(input:Tokens):Tokens {
    let v = parseDecl(input)
    @GetIdent[ident](input)
    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}

```

会先被展开成如下代码，再进行编译。



```
public macro Prop(input: Tokens): Tokens {
    let v = parseDecl(input)

    let decl = (parseDecl(input) as VarDecl).getOrThrow()
    let name = decl.identifier.value
    let size = name.size - 1
    let ident = Token(TokenKind.IDENTIFIER, name[0 .. size])

    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}

```

### [宏调用中嵌套宏调用](#宏调用中嵌套宏调用)


嵌套宏的常见场景，是宏修饰的代码块中，出现了宏调用。一个具体的例子如下：


`pkg1` 包中定义 `Foo` 和 `Bar` 宏：



```
macro package pkg1

import std.ast.*

public macro Foo(input: Tokens): Tokens {
    return input
}

public macro Bar(input: Tokens): Tokens {
    return input
}

```

`pkg2` 包中定义 `AddToMul` 宏：



```
macro package pkg2

import std.ast.*

public macro AddToMul(inputTokens: Tokens): Tokens {
    var expr: BinaryExpr = match (parseExpr(inputTokens) as BinaryExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    var op0: Expr = expr.leftExpr
    var op1: Expr = expr.rightExpr
    return quote(($(op0)) * ($(op1)))
}

```

`pkg3` 包中使用上面定义的三个宏：



```
package pkg3

import pkg1.*
import pkg2.*
@Foo
struct Data {
    let a = 2
    let b = @AddToMul(2+3)

    @Bar
    public func getA() {
        return a
    }

    public func getB() {
        return b
    }
}

main(): Int64 {
    let data = Data()
    var a = data.getA() // a = 2
    var b = data.getB() // b = 6
    println("a: ${a}, b: ${b}")
    return 0
}

```

如上代码所示，宏 `Foo` 修饰了 `struct Data`，而在 `struct Data` 内，出现了宏调用 `AddToMul` 和 `Bar`。这种嵌套场景下，代码变换的规则是：将嵌套内层的宏 (`AddToMul` 和 `Bar`) 展开后，再去展开外层的宏 (`Foo`)。允许出现多层宏嵌套，代码变换的规则总是由内向外去依次展开宏。


嵌套宏可以出现在带括号和不带括号的宏调用中，二者可以组合，但用户需要保证没有歧义，且明确宏的展开顺序：



```
var a = @Foo(@Foo1(2 * 3)+@Foo2(1 + 3))  // Foo1, Foo2 have to be defined.

@Foo1 // Foo2 expands first, then Foo1 expands.
@Foo2[attr: struct] // Attribute macro can be used in nested macro.
struct Data{
    @Foo3 @Foo4[123] var a = @Bar1(@Bar2(2 + 3) + 3)  // Bar2, Bar1, Foo4, Foo3 expands in order.
    public func getA() {
        return @Foo(a + 2)
    }
}

```

### [嵌套宏之间的消息传递](#嵌套宏之间的消息传递)


这里指的是宏调用的嵌套。


内层宏可以调用库函数 `assertParentContext` 来保证内层宏调用一定嵌套在特定的外层宏调用中。如果内层宏调用这个函数时没有嵌套在给定的外层宏调用中，该函数将抛出一个错误。库函数 `InsideParentContext` 同样用于检查内层宏调用是否嵌套在特定的外层宏调用中，该函数返回一个布尔值。下面是一个简单的例子。


宏定义如下：



```
public macro Outer(input: Tokens): Tokens {
    return input
}

public macro Inner(input: Tokens): Tokens {
    assertParentContext("Outer")
    return input
}

```

宏调用如下：



```
@Outer var a = 0
@Inner var b = 0 // Error, The macro call 'Inner' should with the surround code contains a call 'Outer'.

```

如上代码所示，`Inner` 宏在定义时使用了 `assertParentContext` 函数用于检查其在调用阶段是否位于 `Outer` 宏中，在代码示例的宏调用场景下，由于 `Outer` 和 `Inner` 在调用时不存在这样的嵌套关系，因此编译器将报告一个错误。


内层宏也可以通过发送键/值对的方式与外层宏通信。当内层宏执行时，通过调用标准库函数 `setItem` 向外层宏发送信息；随后，当外层宏执行时，调用标准库函数 `getChildMessages` 接收每一个内层宏发送的信息（一组键/值对映射）。下面是一个简单的例子。


宏定义如下：



```
macro package define

import std.ast.*

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")

    let getTotalFunc = quote(public func getCnt() {
                       )
    for (m in messages) {
        let identName = m.getString("identifierName")
        // let value = m.getString("key")            // 接收多组消息
        getTotalFunc.append(Token(TokenKind.IDENTIFIER, identName))
        getTotalFunc.append(quote(+))
    }
    getTotalFunc.append(quote(0))
    getTotalFunc.append(quote(}))
    let funcDecl = parseDecl(getTotalFunc)

    let decl = (parseDecl(input) as ClassDecl).getOrThrow()
    decl.body.decls.append(funcDecl)
    return decl.toTokens()

}

public macro Inner(input: Tokens): Tokens {
    assertParentContext("Outer")
    let decl = parseDecl(input)
    setItem("identifierName", decl.identifier.value)
    // setItem("key", "value")                      // 可以通过不同的key值传递多组消息
    return input
}

```

宏调用如下：



```
import define.*

@Outer
class Demo {
    @Inner var state = 1
    @Inner var cnt = 42
}

main(): Int64 {
    let d = Demo()
    println("${d.getCnt()}")
    return 0
}

```

在上面的代码中，`Outer` 接收两个 `Inner` 宏发送来的变量名，自动为类添加如下内容：



```
public func getCnt() {
    state + cnt + 0
}

```

具体流程为：内层宏 `Inner` 通过 `setItem` 向外层宏发送信息；`Outer` 宏通过 `getChildMessages` 函数接收到 `Inner` 发送的一组信息对象（`Outer` 中可以调用多次 `Inner`）；最后通过该信息对象的 `getString` 函数接收对应的值。































