





条件编译 \- 仓颉语言用户指南




































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




















[条件编译](#条件编译)
=============


开发者可以通过预定义或自定义的条件完成条件编译；仓颉目前支持导入和声明的条件编译。


[导入和声明的条件编译](#导入和声明的条件编译)
-------------------------


仓颉支持使用内置编译标记 `@When` 来完成条件编译，编译条件使用 `[]` 括起来，`[]` 内支持输入一组或多组编译条件。`@When` 可以作用于导入节点和除 `package` 外的声明节点。


### [使用方法](#使用方法)


以内置 os 编译条件为例，其使用方法如下：




```
@When[os == "Linux"]
class mc{}

main(): Int64 {
    var a = mc()
    return 0
}

```

在上面代码中，开发者在 `Linux` 系统中可以正确编译执行；在 `非 Linux` 系统中，则会遇到找不到 `mc` 类定义的编译错误。


值得注意的是：


* 仓颉不支持编译条件嵌套，以下写法均不允许：



```
@When[os == "Windows"]
@When[os == "Linux"]    // Error, illegal nested when conditional compilation
import std.ast.*
@When[os == "Windows"]
@When[os == "Linux"]    // Error, illegal nested when conditional compilation
func A(){}

```
* `@When[...]` 作为内置编译标记，在导入前处理，由宏展开生成的代码中含有 `@When[...]` 会编译报错，如：



```
@M0                     // macro which returns the input
@When[os == "Linux"]    // Error, unexpected when conditional compilation directive
func A(){}

```


[内置编译条件变量](#内置编译条件变量)
---------------------


仓颉提供了五个内置条件变量: `os`、 `backend`、 `cjc_version`、 `debug` 和 `test`。


### [os](#os)


os 表示目标平台的操作系统。`os` 支持 `==` 和 `!=` 两种操作符。支持的操作系统有：`Windows`、`Linux`、`macOS`、`HarmonyOS`。


使用方式如下：




```
@When[os == "Linux"]
func foo() {
    print("Linux, ")
}
@When[os == "Windows"]
func foo() {
    print("Windows, ")
}
@When[os != "Windows"]
func fee() {
    println("NOT Windows")
}
@When[os != "Linux"]
func fee() {
    println("NOT Linux")
}
main() {
    foo()
    fee()
}

```

如果在 `Windows` 环境下编译执行，会得到 `Windows, NOT Linux` 的信息；如果是在 `Linux` 环境下，则会得到 `Linux, NOT Windows` 的信息。


### [backend](#backend)


`backend` 是仓颉内置的条件。仓颉是多后端语言，支持多种后端条件编译。`backend` 条件支持 `==` 和 `!=` 两种操作符。


支持的后端有：`cjnative`、`cjnative-x86`、`cjnative-x86_64`、`cjnative-arm`、`cjnative-aarch64`、`cjvm`、`cjvm-x86`、`cjvm-x86_64`、`cjvm-arm`、`cjvm-aarch64`。


当用户使用的条件为 `cjnative`/`cjvm` 时，arch 信息将会按编译器执行时环境信息自动补全。


使用方式如下：




```
@When[backend == "cjnative"]
func foo() {
    print("cjnative backend, ")
}
@When[backend == "cjvm"]
func foo() {
    print("cjvm backend, ")
}
@When[backend != "cjnative"]
func fee() {
    println("NOT cjnative backend")
}
@When[backend != "cjvm"]
func fee() {
    println("NOT cjvm backend")
}
main() {
    foo()
    fee()
}

```

用 `cjnative` 后端的发布包编译执行，会得到 `cjnative backend, NOT cjvm backend` 的信息；用 `cjvm` 后端的发布包编译执行，则会得到 `cjvm backend, NOT cjnative backend` 的信息。


### [cjc\_version](#cjc_version)


`cjc_version` 是仓颉内置的条件，开发者可以根据当前仓颉编译器的版本选择要编译的代码。`cjc_version` 条件支持 `==`、`!=`、`>`、`<`、`>=`、`<=` 六种操作符，格式为 `xx.xx.xx` 支持每个 `xx` 支持 1\-2 位数字，计算规则为补位 (补齐 2 位) 比较，例如：`0.18.8 < 0.18.11`， `0.18.8 == 0.18.08`。


使用方式如下：




```
@When[cjc_version == "0.18.6"]
func foo() {
    println("cjc_version equals 0.18.6")
}
@When[cjc_version != "0.18.6"]
func foo() {
    println("cjc_version is NOT equal to 0.18.6")
}
@When[cjc_version > "0.18.6"]
func fnn() {
    println("cjc_version is greater than 0.18.6")
}
@When[cjc_version <= "0.18.6"]
func fnn() {
    println("cjc_version is less than or equal to 0.18.6")
}
@When[cjc_version < "0.18.6"]
func fee() {
    println("cjc_version is less than 0.18.6")
}
@When[cjc_version >= "0.18.6"]
func fee() {
    println("cjc_version is greater than or equal to 0.18.6")
}
main() {
    foo()
    fnn()
    fee()
}

```

根据 `cjc` 的版本，上面代码的执行输出结果会有不同。


### [debug](#debug)


`debug` 表示当前是否启用了调试模式即开启 `-g` 编译选项, 可以用于在编译代码时进行调试和发布版本之间的切换。`debug` 条件仅支持逻辑非运算符（`!`）。


使用方式如下：




```
@When[debug]
func foo() {
    println("debug")
}
@When[!debug]
func foo() {
    println("NOT debug")
}
main() {
    foo()
}

```

启用 `-g` 编译执行会得到 `cjc debug` 的信息，如果没有启用 `-g` 编译执行会得到 `NOT debug` 的信息。


### [test](#test)


`test` 表示当前是否启用了单元测试选项 `--test`。`test` 条件仅支持逻辑非运算符（`!`）。可以用于区分测试代码与普通代码。
使用方式如下：




```
@When[test]
@Test
class Tests {
    @TestCase
    public func case1(): Unit {
        @Expect("run", foo())
    }
}

func foo() {
    "run"
}

@When[!test]
main () {
    println(foo())
}

```

使用 `--test` 编译执行得到的测试结果，不使用 `--test` 也可正常完成编译运行得到 `run` 的信息。


[自定义编译条件变量](#自定义编译条件变量)
-----------------------


仓颉允许开发者自定义编译条件变量和取值，自定义的条件变量必须是一个合法的标识符且不允许和内置条件变量同名，其值是一个字符串字面量。自定义条件支持 `==` 和 `!=` 两种运算符。和内置条件变量不同点在于自定义的条件需要开发者在编译时通过 `--cfg` 编译选项或者在配置文件 `cfg.toml` 中定义。


### [配置自定义条件变量](#配置自定义条件变量)


配置自定义条件变量的方式有两种：在编译选项中直接配置键值对或在配置文件配置键值对。


用户可以使用 `--cfg <value>` 以键值对的形式向编译器传递自定义编译条件变量或者指定配置文件 `cfg.toml` 的搜索路径。


* 选项值需要使用双引号括起来
* 若选项值中包含 `=` 则会按照键值对的形式直接进行配置（若路径中包含 `=` 则需要通过 `\` 转义），多个键值对可以使用逗号 `,` 分隔。如：



```
$ cjc --cfg "feature = lion, platform = dsp" source.cj

```
* 允许多次使用 `--cfg` 编译选项配置进行配置, 如：



```
$ cjc --cfg "feature = lion" --cfg "platform = dsp" source.cj

```
* 不允许多次定义同一个条件变量, 如：



```
$ cjc --cfg "feature = lion" --cfg "feature = meta" source.cj

```


```
$ cjc --cfg "feature = lion, feature = meta" source.cj

```

上述两条编译指令都会报错。
* 若选项值中不包含 `=` 或 存在通过 `\` 转义的 `=` 则将选项值作为配置文件 `cfg.toml` 的搜索路径传递给编译器，如：



```
$ cjc --cfg "./cfg" source.cj

```

若 `./cfg` 目录下存在 `cfg.toml` 则在编译时，编译器会将 `./cfg/cfg.toml` 中配置的自定义编译条件传递给编译器。`cfg.toml` 文件中应采用键值对的方式配置自定义条件变量，每个键值对独占一行, 健名是一个合法的标识符, 键值是一个双引号括起来的字符串。如：



```
feature = "lion"
platform = "dsp"

```
* 多次使用 `--cfg` 配置 `cfg.toml` 文件的搜索路径时，按照传入的顺序依次搜索`cfg.toml` 文件，若在所有传入的搜索路径下都没有找到 `cfg.toml` 文件，则在默认路径下搜索配置文件 `cfg.toml`。
* 多次使用 `--cfg` 编译选项进行配置时，若某次以键值对的形式直接进行配置，则会忽略配置文件 `cfg.toml` 中的配置。
* 若没有使用 `--cfg` 编译选项，编译器会在默认路径（通过`--package` 或 `-p` 指定的 `package` 目录或 `cjc` 执行目录）下搜索配置文件 `cfg.toml`。


[多条件编译](#多条件编译)
---------------


仓颉条件编译允许开发者自由组合多个条件编译选项。支持逻辑运算符组合多个条件，支持括号运算符明确优先级。


使用方式如下：



```
//source.cj
@When[(test || feature == "lion") && !debug]
func fee() {
    println("feature lion")
}
main() {
    fee()
}

```

使用如下编译命令编译运行上段代码，



```
$ cjc --cfg="feature=lion" source.cj -o runner.out

```

会得到输出结果如下：



```
platform lion

```






























