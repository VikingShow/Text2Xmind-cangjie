





编码风格 \- 仓颉语言编程规范




































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




















[代码风格](#代码风格)
=============


代码风格一般包含标识符的命名风格、注释风格及排版风格。一致的编码习惯与风格，会使代码更容易阅读、理解，更容易维护。


[命名](#命名)
---------


有意义地、恰当地命名在编程中是一个较难的事。好的命名特征有：能清晰地表达意图，避免造成误导。
少用缩写，但常见词以及业务线的领域词汇都是允许的，比如 response：resp，request：req，message：msg。
使用仓颉语言编程建议各种形式的名字使用统一的命名风格且仅使用纯 ASCII 字符（除 DSL、或从外部库导入等情况），具体如下：




| 类别 | 命名风格 | 形式 |
| --- | --- | --- |
| 包名和文件名 | unix\_like：单词全小写，用下划线分割 | aaa\_bbb |
| 接口，类，结构体，枚举和类型别名 | 大驼峰：首字母大写，单词连在一起，不同单词间通过单词首字母大写分开，可包含数字 | AaaBbb |
| 变量，函数，函数参数 | 小驼峰：首字母小写，单词连在一起，不同单词间通过单词首字母大写分开。例外：测试函数可有下划线 `_`，循环变量，try\-catch 中的异常变量，允许单个小写字母 | aaaBbb |
| let 全局变量, static let 成员变量 | 建议全大写，下划线分割 | AAA\_BBB |
| 泛型类型变量 | 单个大写字母，或单个大写字母加数字，或单个大写字母接下划线、大写字母和数字的组合，例如 E, T, T2, E\_IN, E\_OUT, T\_CONS | A |



下表是一些易混淆的单个字符，当作为标识符时，需留意：




| 易混淆的字符 | 易误导的字符 |
| --- | --- |
| O (大写的 o), D (大写的 d) | 0 (zero) |
| I (大写的 i), l (小写 L) | 1 (one) |
| Z (大写的 z) | 2 (two) |
| S (大写的 s) | 5 (five) |
| b (小写的 B) | 6 (six) |
| B (大写的 b) | 8 (eight) |
| q（小写的 Q） | 9 (nine) |
| h (小写的 H) | n (小写的 N) |
| m (小写的 M) | rn (小写的 RN) |
| `_`（下划线） | 连续多个时很难分辨究竟有几个 |



另外，在使用大、小驼峰命名风格时若遇到 JSON，HTTP 等首字母缩略词，
应将整个缩略词看做普通单词处理，服从命名风格的大小写规定，而不要维持全大写的写法。
如大驼峰风格中：`XmlHttpRequest`，小驼峰风格中：`jsonObject`。


### [包名和文件名](#包名和文件名)


#### [G.NAM.01 包名采用全小写单词，允许包含数字和下划线](#gnam01-包名采用全小写单词允许包含数字和下划线)


【级别】建议


【描述】


* 包名字母全小写，如果有多个单词使用下划线分隔；
* 包名允许有数字，例如 org.apache.commons.lang3；
* 带限定前缀的包名必须和当前包与源代码根目录的相对路径对应，建议以 Internet 域名反转的规则开头，再加上产品名称和模块名称。


【正例】




| 域名 | 包名 |
| --- | --- |
| my\_product.example.com | com.example.my\_product |
| my\_product.example.org | org.example.my\_product |



#### [G.NAM.02 源文件名采用全小写加下划线风格](#gnam02-源文件名采用全小写加下划线风格)


【级别】建议


【描述】


* 文件名不采用驼峰的原因是：不同系统对文件名大小写处理不同（如 Windows 系统不区分大小写，但是 Unix/Linux, Mac 系统则默认区分）。
* 如果文件只包含一个包外部可见的顶层元素，那么选择该顶层元素的名称，以此命名。否则，选择能代表主要内容的元素名称作为文件名。源文件名称使用全小写加下划线风格。


【正例】



```
// my_class.cj
public class MyClass {
    // CODE
}

```

【反例】



```
// MyClass.cj  文件名不符合：使用了驼峰命名
public class MyClass {
    // CODE
}

```

### [接口、类、struct、enum 和类型别名](#接口类structenum-和类型别名)


#### [G.NAM.03 接口、类、struct、enum 类型和 enum 构造器、类型别名、采用大驼峰命名](#gnam03-接口类structenum-类型和-enum-构造器类型别名采用大驼峰命名)


【级别】建议


【描述】


1. 类型定义通常是名词或名词短语，其中接口名还可以是形容词或形容词短语，都应采用大驼峰命名。
2. enum 构造器采用大驼峰命名风格。
3. 测试类命名时推荐以被测试类名开头，并以 Test 结尾。例如，HashTest 或 HashIntegrationTest。
4. 建议异常类加 `Exception`/`Error` 后缀。


例外：


在 UI 场景下，一些配置需要用 enum 的成员构造来实现，html 里的一些配置习惯用小驼峰，对于领域内有约定的场景，允许例外。


【正例】



```
// 符合：类名使用大驼峰
class MarcoPolo {
    // CODE
}
// 符合：enum 类型和 enum 构造器使用大驼峰
enum ThreadState {
    New | Runnable | Blocked | Terminated
}

// 符合：接口名使用大驼峰
interface TaPromotable {
    // CODE
}

// 符合：类型别名使用大驼峰
type Point2D = (Float64, Float64)

// 符合：抽象类名使用大驼峰
abstract class AbstractAppContext {
    // CODE
}

```

【反例】



```
// 不符合：类名使用小驼峰
class marcoPolos {
    // CODE
}
// 不符合：enum 类型名使用小驼峰
enum timeUnit {
    Year | Month | Day | Hour
}

```

### [函数](#函数)


#### [G.NAM.04 函数名称应采用小驼峰命名](#gnam04-函数名称应采用小驼峰命名)


【级别】建议


【描述】


1. 函数名称采用小驼峰命名风格。例如，sendMessage 或 stopServer。


格式如下：


	* 建议优先将 field 对外的接口实现成属性，而不是 getXXX/setXXX，会更简洁。
	* 布尔属性名建议加 is 或 has, 例如：isEmpty。
	* 函数名称建议使用以下格式：has \+ 名词 / 形容词 ()、动词 ()、动词 \+ 宾语 ()。
	* 回调函数（callback）允许介词 \+ 动词形式命名，如: onCreate, onDestroy, toString
	其中动词主要用在动作的对象自身上，如 document.print()。
2. 下划线可能出现在单元测试函数名称中，用于分隔名称的逻辑组件，每个组件都使用小驼峰命名法。例如，一种典型的模式是 `<methodUnderTest>_<state>`，又例如 `pop_emptyStack`，命名测试函数没有唯一的正确方法。


【正例】



```
// 符合：函数名使用小驼峰
func addExample(start: Int64, size: Int64) {
    return start + size
}

// 符合：函数名使用小驼峰
func printAdd(add: (Int64, Int64) -> Int64): Unit {
    println(add(1, 2))
}

```

【反例】



```
// 不符合：函数名使用大驼峰
func GenerateChildren(page: Int64) {
     println(page.toString())
}

```

### [变量](#变量)


#### [G.NAM.05 const 变量的名称采用全大写](#gnam05-const-变量的名称采用全大写)


【级别】建议


【描述】


const 变量表示在编译时完成求值，并且在运行时不可改变的变量，使用下划线分隔的全大写单词来命名。


【反例】:



```
// 不符合 : const 变量没有使用下划线分隔的全大写单词命名
const MAXUSERNUM = 200

class Weight {
    static const GramsPerKg = 1000
}

```

【正例】



```
// 符合 : const 变量使用下划线分隔的全大写单词命名
const MAX_USER_NUM = 200

class Weight {
    static const GRAMS_PER_KG = 1000
}

```

#### [G.NAM.06 变量的名称采用小驼峰](#gnam06-变量的名称采用小驼峰)


【级别】建议


【描述】


变量、属性、函数参数、pattern 等均采用小驼峰命名风格。


例外：


* 泛型类型变量，允许单个大写字母，或单个大写字母加数字，或单个大写字母接下划线、大写字母和数字的组合，例如 E, T, T2, E\_IN, E\_OUT, T\_CONS
* 函数内使用的数值常量，不要使用魔鬼数字，用 let 声明有意义的局部变量代替，此时局部变量名可以使用全大写下划线的风格命名，强调是常量


不应该取 NUM\_FIVE \= 5 或 NUM\_5 \= 5 这样的 “魔鬼常量”。如果被粗心大意地改为 NUM\_5 \= 50 或 55 等，很容易出错。


【反例】:



```
// 不符合：变量名使用无意义单个字符
var i: Array<Item> = ...
// 不符合：类型参数使用小写字母
class Map<key, val> { ... }

```

【正例】



```
// 变量名使用小驼峰命名
let menuItems: Array<Item> = ...
let names: Array<String> = ...
let menuItemsArray: Array<Item> = ...
let menuItems: Set<Item> = ...
let rememberedSet: Set<Address> = ...
let waitingQue: Queue<Thread> = ...
let lookupTable: Array<Int64> = ...
let word2WordIdMap: Map<Stirng, Int> = ...

class MyPage <: Page {
    var pageNo = StateInt64(1)                 // 实例成员变量使用小驼峰命名
    var imagePath = StateArray(images)         // 实例成员变量使用小驼峰命名
    init() {
        ...
    }
}

// 参数名使用小驼峰命名
func getColumnMoreDataColumn(pageType: String, idxColumn: Int64, outIndex: Int64) {
    ...
}

// 类型参数使用大写字母
class Map<KEY, VAL> { ... }

// 类型参数使用大写字母与数字
class Pair<T1, T2> { ... }

```

[格式](#格式)
---------


尽管有些编程的排版风格因人而异，但是我们强烈建议和要求在同一个项目中使用统一的编码风格，以便所有人都能够轻松的阅读和理解代码，增强代码的可维护性。


### [编码格式](#编码格式)


#### [G.FMT.01 源文件编码格式（包括注释）必须是 UTF\-8](#gfmt01-源文件编码格式包括注释必须是-utf-8)


【级别】要求


【描述】


对于源文件，应统一采用 UTF\-8 进行编码。仓颉编译器目前仅支持 UTF\-8 编码。


### [文件](#文件)


#### [G.FMT.02 一个源文件按顺序包含版权、package、import、顶层元素四类信息，且不同类别之间用空行分隔](#gfmt02-一个源文件按顺序包含版权packageimport顶层元素四类信息且不同类别之间用空行分隔)


【级别】建议


【描述】


一个源文件会包含以下几个可选的部分，应按顺序组织，且每个部分之间用空行隔开：


1. 许可证或版权信息；
2. package 声明，且不换行；
3. import 声明，且每个 import 不换行；
4. 顶层元素。


【正例】



```
// 第一部分，版权信息
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */

// 第二部分，package 声明
package com.huawei.myproduct.mymodule

// 第三部分，import 声明
import std.collection.HashMap   // 标准库

// 第四部分，public 元素定义
public class ListItem <: Component {
   // ...
}

// 第五部分，internal 元素定义
class Helper {
    // CODE
}

```

#### [G.FMT.03 import 包应该按照包所归属的组织或分类进行分组](#gfmt03-import-包应该按照包所归属的组织或分类进行分组)


【级别】建议


【描述】


说明：import 导入包根据归属组织或分类进行分组：本公司 (例如华为公司 com.huawei.)，其它商业组织 (com.)，其它开源第三方、net/org 开源组织、标准库。两个分组之间使用空行分隔。


【正例】



```
import com.huawei.* // 华为公司

import com.google.common.io.Files // 其它商业组织

import harmonyos.* // 开源
import mitmproxy.* // 其它开源第三方
import textual.* // 开源
import net.sf.json.* // 开源组织
import org.linux.apache.server.SoapServer // 开源组织

import std.io.* // 标准库
import std.socket.*

```

#### [G.FMT.04 一个类、接口或 struct 的声明部分应当按照静态变量、实例变量、构造函数、成员函数的顺序出现，且用空行分隔](#gfmt04-一个类接口或-struct-的声明部分应当按照静态变量实例变量构造函数成员函数的顺序出现且用空行分隔)


【级别】建议


【描述】


一个类或接口的声明部分应当按照以下顺序出现：


* 静态变量
* 实例变量
* 构造函数，如果有主构造函数，则主构造函数在其它构造函数之前
* 属性
* 成员函数


实例变量、构造函数，均按访问修饰符从大到小排列：public、protected、private。静态变量要按初始化顺序来，可以不遵循按访问修饰符从大到小排列的建议。


**说明：**


1. 对于自注释字段之间可以不加空行；
2. 非自注释字段应该加注释且字段间空行隔开；
3. enum 没有成员变量，按照 enum 构造器，属性，成员函数的顺序出现；


### [行宽](#行宽)


#### [G.FMT.05 行宽不超过 120 个窄字符](#gfmt05-行宽不超过-120-个窄字符)


【级别】建议


【描述】


一个宽字符占用两个窄字符的宽度。除非另有说明，否则任何超出此限制的行都应该换行，如 \[换行](\# 换行) 一节中所述。
每个 Unicode 代码点都计为一个字符，即使其显示宽度大于或小于一个字符。如果使用 [全角字符](https://en.wikipedia.org/wiki/Halfwidth_and_fullwidth_forms)，可以选择比此规则建议的位置更早地换行。
字符的 “宽” 与“窄”由它的 [*east asian width* Unicode 属性](https://unicode.org/reports/tr11/) 定义。通常，窄字符也称 “半角” 字符，ASCII 字符集中的所有字符，包括字母（如：`a`、`A`）、数字（如：`0`、`3`）、标点（如'`,`'、'`{`'）、空格，都是窄字符；
宽字符也称 “全角” 字符，汉字（如：`中`、`文`）、中文标点（'`，'`、'`、`'）、全角字母和数字（如 `Ａ`、`３`）等都是宽字符，算 2 个窄字符。


**例外：**


* `package` 和 `import` 声明；
* 对于换行导致内容截断，不方便查找、拷贝的字符（如长 URL、命令行等）可以不换行。


### [换行](#换行)


换行是将代码分隔到多个行的行为，否则它们都会堆积到同一行。


如需换行，建议在以下位置进行换行：


1. 函数参数列表（包括形参和实参），两个参数之间，在逗号后换行；
2. 函数返回类型，在 `:` 后换行；
3. 泛型参数列表（包括泛型形参和泛型实参），两个泛型参数之间，在逗号后换行；
4. 泛型约束条件列表，两个约束条件之间，在 `&` 或逗号后换行；
5. 类型声明时，父类和实现接口列表，在 `&` 后换行；
6. lambda 表达式的 `=>` 后换行；
7. 如果需要在二元操作符 `+`、`-` 号的位置换行，应在操作符之后换行以避免歧义；


举个例子，下面这个复杂的函数声明，建议在箭头（`^`）所指的位置进行换行：



```
public func codeStyleDemo<T, M>(param1: String, param2: String): String where T <: String, M <: String { ... }
//                          ^                  ^                ^                         ^

```

#### [G.FMT.06 表达式中不要插入空白行](#gfmt06-表达式中不要插入空白行)


【级别】建议


【描述】


1. 当表达式过长，或者可读性不佳时，需要在合适的地方换行。表达式换行后的缩进要跟上一行的表达式开头对齐。
2. 可以在表达式中间插入注释行
3. 不要在表达式中间插入空白行


【正例】



```
func foo(s: String) {
    s
}

func bar(s: String) {
    s
}

/* 符合，表达式中可以插入注释进行说明 */
main() {
    let s = "Hello world"
        /* this is a comment */
        |> foo
        |> bar
}

```

【反例】



```
func foo(s: String) {
    s
}

func bar(s: String) {
    s
}

/* 不符合，表达式中不应插入空白行 */
main() {
    let s = "Hello world"
        |> foo


        |> bar
}

```

#### [G.FMT.07 一行只有一个声明或表达式](#gfmt07-一行只有一个声明或表达式)


【级别】建议


【描述】声明或表达式应该单独占一行，更加利于阅读和理解代码。


【反例】



```
func foo() {
    // 不符合：多个变量声明需要分开放在多行
    var length = 0; var result = false

    // 不符合: 多个表达式需分开放在多行
    result = true; result
}

```

【正例】



```
func foo() {
    // 符合：多个变量声明需要分开放在多行
    var length = 0
    var result = false

    // 符合: 多个表达式分开放在多行
    result = true
    result
}

```

### [缩进](#缩进)


#### [G.FMT.08 采用一致的空格缩进](#gfmt08-采用一致的空格缩进)


【级别】建议


【描述】


建议使用空格进行缩进，每次缩进 4 个空格。避免使用制表符（`\t`）进行缩进。


对于 UI 等多层嵌套使用较多的产品，可以统一使用 2 个空格缩进。


【正例】



```
class ListItem  {
    var content: Array<Int64>   // 符合：相对类声明缩进 4 个空格
    init(
        content: Array<Int64>,  // 符合：函数参数相对函数声明缩进 4 个空格
        isShow!: Bool = true,
        id!: String = ""
    ) {
        this.content = content
    }
}

```

### [大括号](#大括号)


#### [G.FMT.09 使用统一的大括号换行风格](#gfmt09-使用统一的大括号换行风格)


【级别】建议


【描述】


选择并统一使用一种大括号换行风格，避免多种风格并存。


对于非空块状结构，大括号推荐使用 K\&R 风格：


* 左大括号不换行；
* 右大括号独占一行，除非后面跟着同一表达式的剩余部分，如 `do-while` 表达式中的 `while`，或者 `if` 表达式中的 `else` 和 `else if` 等。


【正例】



```
enum TimeUnit {             // 符合：跟随声明放行末，前置 1 空格
    Year | Month | Day | Hour
}                           // 符合：右大括号独占一行

class A {                   // 符合：跟随声明放行末，前置 1 空格
    var count = 1
}

func fn(a: Int64): Unit {       // 符合：跟随声明放行末，前置 1 空格
    if (a > 0) {            // 符合：跟随声明放行末，前置 1 空格
        // CODE
    } else {                  // 符合：右大括号和 else 在同一行
        // CODE
    }                         // 符合：右大括号独占一行
}

// lambda 函数
let add = { base: Int64, bonus: Int64 =>     // 符合: lambda 表达式中非空块遵循 K&R 风格
    print("符合 news")
    base + bonus
}

```

【反例】



```
func fn(count: Int64)
{                           // 不符合：左大括号不应该单独一行
    if (count > 0)
    {                         // 不符合：左大括号不应该单独一行
        // CODE
    }                         // 不符合：右大括号后面还有跟随的 else，应该和 else 放同一行
    else {
        print("count <= 0")}        // 不符合：右大括号后面没有跟随的部分，应该独占一行
}

```

**例外：** 对于空块既可遵循前面的 K\&R 风格，也可以在大括号打开后立即关闭，产品应考虑使用统一的风格。


【正例】



```
open class Demo {}    // 符合: 空块，左右大括号在同一行

```

### [空行和水平空格](#空行和水平空格)


#### [G.FMT.10 用空格突出关键字和重要信息](#gfmt10-用空格突出关键字和重要信息)


【级别】建议


【描述】


水平空格应该突出关键字和重要信息。单个空格应该分隔关键字与其后的左括号、与其前面的右大括号，出现在二元操作符 / 类似操作符的两侧。行尾和空行不应用空格 space。总体规则如下：


* **建议** 加空格的场景：


	+ 条件表达式（if 表达式），循环表达式（for\-in 表达式，while 表达式和 do\-while 表达式），模式匹配表达式（match 表达式）和 try 表达式中关键字与其后的左括号，或与其前面的右括号之间
	+ 赋值运算符（包括复合）前后，例如 `=`、`*=` 等
	+ 逗号 `,`、enum 定义中的 `|` 符号、变量声明 / 函数定义 / 命名参数传值中的冒号 `：` 之后，例如 `let a: Int64`
	+ 二元操作符、泛型约束的 `＆` 符号、声明父类父接口或实现 / 扩展接口的 `<:` 符号、`range` 操作符步长的冒号 `：` 前后两侧，例如 `base + offset`，`Int64 * Int64` 等
	+ lambda 表达式中的箭头前后，例如 `{str => str.length()}`
	+ 条件表达式、循环表达式等场景下的 `)` 与 `{` 之间加空格，例如：`if (i > 0) {`。
	+ 函数、类型等声明的 `{` 之前加空格，例如：`class A {`
* **不建议** 加空格的场景：


	+ 成员访问操作符（`instance.member`）前后, 问号操作符 `?` 前后
	+ `range` 操作符（`0..num`、`0..=num` 这 2 种区间）前后
	+ 圆括号、方括号内两侧
	+ 一元操作符前后，例如 `cnt++`
	+ 函数声明或者函数调用的左括号之前
	+ 逗号 `,` 和变量声明 / 函数定义 / 命名参数传值中的冒号 `：` 之前
	+ 下标访问表达式中，`[` 和它之前的 token 之间


推荐示例如下：



```
var isPresent: Bool = false  // 符合：变量声明冒号之后有一个空格
func method(isEmpty!: Bool):Unit { /* ... */ } // 符合：函数定义（命名参数 / 返回类型）中的冒号之后有一个空格

func test() {
    method(isEmpty: isPresent) // 符合: 命名参数传值中的冒号之后有一个空格

    const MAX_COUNT = 100
    0..MAX_COUNT : -1 // 符合: range 操作符区间前后没有空格，步长冒号前后两侧有一个空格

    var hundred = 0
    do { // 符合：关键字 do 和后面的括号之间有一个空格
        hundred++ // 符合：一元操作符和操作数之间不留空格
    } while (hundred < 100) // 符合：关键字 while 和前面的括号之间有一个空格

    let listOne: Array<Int64> = [1, 2, 3, 4] // 符合：方括号和圆括号内部两侧不出现空格

    let (base, bonus) = (1, 2)
    let salary = base + bonus // 符合：二元操作符左右两侧留空格
}

func fn(paramName1: Int, paramName2: Int) { // 符合：圆括号和内部相邻字符之间不出现空格
    //...
    for (i in 1..4) { // 符合：range 操作符左右两侧不留空格
        //...
    }
}

```

#### [G.FMT.11 减少不必要的空行，保持代码紧凑](#gfmt11-减少不必要的空行保持代码紧凑)


【级别】建议


【描述】


减少不必要的空行，可以显示更多的代码，方便代码阅读。建议：


* 根据上下内容的相关程度，合理安排空行；
* 类型定义和顶层函数定义与前后顶层元素之间至少空一行；
* 函数内部、类型定义内部、表达式内部，不使用连续空行；
* 不使用连续 3 个或更多空行；
* 大括号内的代码块行首之前和行尾之后不要加空行。


【反例】



```
class MyApp <: App {
    let album = albumCreate()
    let page: Router
    // 空行
    // 空行
    // 空行
    init() {           // 不符合：类型定义内部使用连续空行
        this.page = Router("album", album)
    }

    override func onCreate(): Unit {

        println( "album Init." )  // 不符合：大括号内部首尾存在空行

    }
}

```

### [修饰符](#修饰符)


#### [G.FMT.12 修饰符关键字按照一定优先级排列](#gfmt12-修饰符关键字按照一定优先级排列)


【级别】建议


【描述】


以下是推荐的所有修饰符排列的优先级：



```
public/protected/private
open/abstract/static/sealed
override/redef
unsafe/foreign
const/mut

```

另外，因为 sealed 已经蕴含了 public 和 open 的语义，不推荐 sealed 与 public 或 open 同时使用。


[注释](#注释)
---------


注释是为了帮助阅读者快速读懂代码，所以要从读者的角度出发，按需注释。


注释内容要简洁、明了、无二义性，信息全面且不冗余。


注释跟代码一样重要。


CangJie 中注释的语法有以下几种：单行注释（`//`）、多行注释（`/*...*/`）。本节介绍如何规范使用这些注释。


### [文件头注释](#文件头注释)


#### [G.FMT.13 文件头注释应该包含版权许可](#gfmt13-文件头注释应该包含版权许可)


【级别】建议


【描述】


文件头注释必须放在 package 和 import 之前，必须包含版权许可信息，如果需要在文件头注释中增加其他内容，可以在后面以相同格式补充。版本许可不应该使用单行样式的注释，必须从文件顶头开始。如果包含 “关键资产说明 “类注释，则应紧随其后。


版权许可内容及格式必须如下：


中文版：



```
/*
 * 版权所有 (c) 华为技术有限公司 2019-2021
 */

```

英文版：



```
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2019-2021. All rights reserved.
 */

```

关于版本说明，应注意：


* 2019\-2021 根据实际需要可以修改。


2019 是文件首次创建年份，而 2021 是文件修改最后年份。二者可以一样，如 "2021\-2021"。


对文件有重大修改时，必须更新后面年份，如特性扩展，重大重构等。
* 版权说明可以使用华为子公司。


​ 如：版权所有 (c) 海思半导体 2012\-2020


​ 或英文： Copyright (c) Hisilicon Technologies Co., Ltd. 2019\-2021\. All rights reserved.


### [代码注释](#代码注释)


#### [G.FMT.14 代码注释放于对应代码的上方或右边](#gfmt14-代码注释放于对应代码的上方或右边)


【级别】建议


【描述】


* 代码上方的注释与被注释的代码行间无空行，保持与代码一样的缩进。
* 代码右边的注释，与代码之间至少留有 1 个空格。代码右边的注释，无需插入空格使其强行对齐。


选择并统一使用如下风格：



```
var foo = 100 // 放右边的注释
var bar = 200 /* 放右边的注释 */

```
* 当右置的注释超过行宽时，请考虑将注释至于代码上方。同一个 block 中的代码注释不用插入空格使其强行对齐。


【正例】



```
class Column <: Div {
    var reverse: Bool = false
    var justifyContent: JustifyContent = JustifyContent.flexStart
    var alignItems: AlignItems = AlignItems.stretch  // 注释和代码间留一个空格
    var alignSelf: AlignSelf = AlignSelf.auto  // 上下两行注释无需插入空格强行对齐
    init() {
        ...
    }
}

```
* `if else if` 为了更清晰，考虑注释放在 `else if` 同行或者在块内都行，但不是在 `else if` 之前，避免以为注释是关于它所在块的。


【反例】



```
func test() {
    var nr = 100
    if (nr % 15 == 0) {
        println("fizzbuzz")
        // 当 nr 只能被 3 整除，不能被 5 整除不符合。
    } else if (nr % 3 == 0) {
        println("fizz")
    }
}

```

上述错误示例的注释是 `if` 分支的还是 `else if` 分支的，容易造成误解。


【正例】



```
func test() {
    var nr = 100
    if (nr % 15 == 0) {
        println("fizzbuzz")
    } else if (nr % 3 == 0) {
        // 当 nr 只能被 3 整除，不能被 5 整除不符合。
        println("fizz")
    }
}

```































