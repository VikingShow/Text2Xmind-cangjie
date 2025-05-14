





Linux 版本工具链的支持与安装 \- 仓颉语言用户指南




































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




















[Linux 版本工具链的支持与安装](#linux-版本工具链的支持与安装)
=======================================


仓颉工具链当前基于以下 Linux 发行版进行了完整功能测试：
\| Linux 发行版 \|
\| \-\- \|
\| SLES 12\-SP5 \|
\| Ubuntu 18\.04 \|
\| Ubuntu 20\.04 \|
\| EulerOS R11 \|


[适用于各 Linux 发行版的仓颉工具链依赖安装命令](#适用于各-linux-发行版的仓颉工具链依赖安装命令)
---------------------------------------------------------



> **注意：**
> 
> 
> 当前仓颉工具链依赖的部分工具在一些 Linux 发行版上可能无法通过系统默认软件源直接安装，你可以参考下一节“编译安装依赖工具”进行手动安装。


### [SLES 12\-SP5](#sles-12-sp5)



```
$ zypper install \
         binutils \
         glibc-devel \
         gcc-c++

```

此外，还需要安装 OpenSSL 3，安装方法请参考\[编译安装依赖工具](\#\# 编译安装依赖工具)。


### [Ubuntu 18\.04](#ubuntu-1804)



```
$ apt-get install \
          binutils \
          libc-dev \
          libc++-dev \
          libgcc-7-dev \

```

此外，还需要安装 OpenSSL 3，安装方法请参考\[编译安装依赖工具](\#\# 编译安装依赖工具)。


### [Ubuntu 20\.04](#ubuntu-2004)



```
$ apt-get install \
          binutils \
          libc-dev \
          libc++-dev \
          libgcc-9-dev \

```

此外，还需要安装 OpenSSL 3，安装方法请参考\[编译安装依赖工具](\#\# 编译安装依赖工具)。


**EulerOS R11**



```
$ yum install binutils \
              glibc-devel \
              gcc

```

### [其他 Linux 发行版](#其他-linux-发行版)


根据使用的 Linux 发行版的不同，你可能需要参考以上系统的依赖安装命令，使用你的系统包管理工具安装对应依赖。若你使用的系统没有提供相关软件包，你可能需要自行安装链接工具、C 语言开发工具、C\+\+ 开发工具、GCC 编译器、以及 OpenSSL 3 以正常使用仓颉工具链。


[编译安装依赖工具](#编译安装依赖工具)
---------------------


当前仓颉工具链中的部分标准库（以及部分工具）使用了 OpenSSL 3 开源软件。对于系统包管理工具未提供 OpenSSL 3 的场景，用户可能需要源码编译安装 OpenSSL 3，本节提供了 OpenSSL 3 源码编译的方法和步骤。


### [OpenSSL 3](#openssl-3)


从以下链接可以下载到 OpenSSL 3 的源码：


* https://www.openssl.org/source/
* https://www.openssl.org/source/old/


建议使用 openssl\-3\.0\.7 或更高版本。



> **注意：**
> 
> 
> 请在执行以下编译和安装命令前仔细阅读注意事项，并根据实际情况调整命令。不正确的配置和安装可能会导致系统其他软件不可用。如果在编译安装过程中遇到问题或希望进行额外的安装配置，请参考 OpenSSL 源码中的 `INSTALL` 文件或 OpenSSL 的 [FAQ](https://www.openssl.org/docs/faq.html)。


此处以 openssl\-3\.0\.7 为例，下载后使用以下命令解压压缩包：



```
$ tar xf openssl-3.0.7.tar.gz

```

解压完成后进入目录：



```
$ cd openssl-3.0.7

```

编译 OpenSSL：



> **注意：**
> 
> 
> 如果你的系统已经安装了 OpenSSL，建议使用 `--prefix=<path>` 选项指定一个自定义安装路径，例如 `--prefix=/usr/local/openssl-3.0.7` 或你的个人目录。在系统目录已经存在 OpenSSL 的场景下直接使用以下命令编译安装可能会使系统 OpenSSL 被覆盖，并导致依赖系统 OpenSSL 的应用不可用。



```
$ ./Configure --libdir=lib
$ make

```

测试 OpenSSL：



```
$ make test

```

将 OpenSSL 安装至系统目录（或你先前指定的 `--prefix` 目录），你可能需要提供 root 权限以成功执行以下命令：



```
$ make install

```

或



```
$ sudo make install

```

如果先前编译 OpenSSL 时没有通过 `--prefix` 设置自定义安装路径，你的 OpenSSL 安装已经完成了。如果先前通过 `--prefix` 指定了自定义的安装路径，你还需要设置以下变量，以使仓颉工具链可以找到 OpenSSL 3。



> **注意：**
> 
> 
> 如果你的系统中原先存在其他版本的 OpenSSL，通过以下方式配置后，除了仓颉工具链外，你的其他编译开发工具默认使用的 OpenSSL 版本也可能受到影响。如果使用其他编译开发工具时出现 OpenSSL 不兼容的情况，请仅为仓颉开发环境配置以下变量。


*请将 `<prefix>` 替换为你指定的自定义安装路径。*



```
$ export LIBRARY_PATH=<prefix>/lib:$LIBRARY_PATH
$ export LD_LIBRARY_PATH=<prefix>/lib:$LD_LIBRARY_PATH

```

通过以上方式所配置的环境变量仅在当前执行命令的 `shell` 会话窗口有效。若希望 `shell` 每次启动时都自动配置，你可以在 `$HOME/.bashrc`、`$HOME/.zshrc` 或其他 `shell` 配置文件（依你的 `shell` 种类而定）加入以上命令。


若希望配置可以默认对所有用户生效，你可以执行以下命令：


*请将 `<prefix>` 替换为你指定的自定义安装路径。*



```
$ echo "export LIBRARY_PATH=<prefix>/lib:$LIBRARY_PATH" >> /etc/profile
$ echo "<prefix>/lib" >> /etc/ld.so.conf
$ ldconfig

```

执行完毕后重新打开 `shell` 会话窗口即可生效。


至此，OpenSSL 3 已经成功安装，你可以回到原来的章节继续阅读或尝试运行仓颉编译器了。































