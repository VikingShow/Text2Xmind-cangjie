





附录 \- 仓颉语言编程规范




































1. [**1\.** 概述](../source_zh_cn/Chapter_01_Overview.html)
2. [**2\.** 编码风格](../source_zh_cn/Chapter_02_Code_Style.html)
3. [**3\.** 编程实践](../source_zh_cn/Chapter_03_Programming_Practices.html)
4. [**4\.** 附录](../source_zh_cn/Chapter_04_Appendix.html)




















* Light
* Rust
* Coal
* Navy
* Ayu






仓颉语言编程规范
========




















[附录](#附录)
=========


[命令注入相关特殊字符](#命令注入相关特殊字符)
-------------------------


表 3 shell 脚本中常用的与命令注入相关的特殊字符。




| 分类 | 符号 | 功能描述 |
| --- | --- | --- |
| 管道 | `|` | 连结上个指令的标准输出，作为下个指令的标准输入 |
| 内联命令 | `;` | 连续指令符号 |
| 内联命令 | `&` | 单一个 \& 符号，且放在完整指令列的最后端，即表示将该指令列放入后台中工作 |
| 逻辑操作符 | `$` | 变量替换 (Variable Substitution) 的代表符号 |
| 表达式 | `$` | 可用在 ${} 中作为变量的正规表达式 |
| 重定向操作 | `>` | 将命令输出写入到目标文件中 |
| 重定向操作 | `<` | 将目标文件的内容发送到命令当中 |
| 反引号 | ``` 对 | 可在 ``` 和 ``` 之间构造命令内容并返回当前执行命令的结果 |
| 倒斜线 | `\` | 在交互模式下的 escape 字元，有几个作用；放在指令前，有取消 aliases 的作用；放在特殊符号前，则该特殊符号的作用消失；放在指令的最末端，表示指令连接下一行 |
| 感叹号 | `!` | 事件提示符 (Event Designators), 可以引用历史命令 |
| 换行符 | `\n` | 可以用在一行命令的结束，用于分隔不同的命令行 |



上述字符也可能以组合方式影响命令拼接，如管道符 “\|\|”，“\>\>” ，“\<\<”，逻辑操作符 “\&\&” 等，由于基于单个危险字符的检测可以识别这部分组合字符，因此不再列出。另外可以表示账户的 home 目录 “\~”，可以表示上层目录的符号“..”，以及文件名通配符 “?” (匹配文件名中除 null 外的单个字元)，“\*” (匹配文件名的任意字元) 由于只影响命令本身的语义，不会引入额外的命令，因此未列入命令注入涉及的特殊字符，需根据业务本身的逻辑进行处理。


[可能产生整数溢出的数学操作符](#可能产生整数溢出的数学操作符)
---------------------------------




| 操作符 | 溢出 | 操作符 | 溢出 | 操作符 | 溢出 | 操作符 | 溢出 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `+` | Y | `-=` | Y | `<<` | N | `<` | N |
| `-` | Y | `*=` | Y | `>>` | N | `>` | N |
| `*` | Y | `/=` | Y | `&` | N | `>=` | N |
| `/` | Y | `%=` | N | `|` | N | `<=` | N |
| `%` | N | `<<=` | N | `^` | N | `==` | N |
| `++` | Y | `>>=` | N | `~` | N |  |  |
| `--` | Y | `&=` | N | `!` | N |  |  |
| `=` | N | `\|=` | N | `!=` | N |  |  |
| `+=` | Y | `^=` | N | `**` | Y |  |  |



[基础类型映射关系表](#基础类型映射关系表)
-----------------------




| CangJie Type | C Type | Size |
| --- | --- | --- |
| Unit | void | 0 |
| Bool | bool | 1 |
| Int8 | int8\_t | 1 |
| UInt8 | uint8\_t | 1 |
| Int16 | int16\_t | 2 |
| UInt16 | uint16\_t | 2 |
| Int32 | int32\_t | 4 |
| UInt32 | uint32\_t | 4 |
| Int64 | int64\_t | 8 |
| UInt64 | uint64\_t | 8 |
| IntNative | `-` | \* platform dependent |
| UIntNative | `-` | \* platform dependent |
| Float32 | float | 4 |
| Float64 | double | 8 |
| struct | struct | field dependent |



[参考文档](#参考文档)
-------------


1. [Kotlin 编码规范](https://www.kotlincn.net/docs/reference/coding-conventions.html)
2. [Swift 编码规范](https://google.github.io/swift/)
3. [华为 Java 编码规范 V5\.0](https://w3.huawei.com/ipd/tsl/#!tsl_new/standard/standard.html?standardId=202536)
4. [华为 C\+\+ 语言编程规范 V5\.0(试行)](https://w3.huawei.com/ipd/tsl/#!tsl_new/standard/standard.html?standardId=202538)





























