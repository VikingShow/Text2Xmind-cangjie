package Magic

import magic.dsl.*
import magic.prelude.*
import magic.config.Config
import std.fs.*



@agent[
    model: "deepseek:deepseek-chat",
]
class Text2Xmind {
    @prompt[pattern: ARM](
        analyze: "请分析文章的整体结构，将其划分为若干主题及子主题。",
        refining: "请针对每个主题与子主题，提炼目录结构及每部分的关键内容。",
        toMap: "请将提炼结果转换为符合 Markdown 格式的思维导图内容，适用于 XMind 软件导入，注意 Markdown 语法和层级结构正确。"
    )
}

@promptPattern
class ARM {
    @element[description: "分析文章结构，将文章按主题和子主题进行内容划分"]
    let analyze: String

    @element[description: "按照分析出的文章主题与子主题，提炼出文章的目录及每个主题下的概述内容"]
    let refining: String

    @element[description: "按照抽象出的目录，写出符合 Markdown 格式的思维导图"]
    let toMap: String

    public func toString(): String {
        return "分析：${analyze}\n提炼：${refining}\n生成思维导图：${toMap}"
        // return "...${analyze}...${refining}...${toMap}..."
    }
}


main() {
    Config.env["DEEPSEEK_API_KEY"] = "sk-fa13582775314772a81935ab04d056e5"
    let inputPath = "C:/Users/SowrJam/workspace/Magic/input/18课.md"
    let outputPath = "C:/Users/SowrJam/workspace/Magic/output/思维导图.md"

    let input = File.readFrom(inputPath)
    let agent = Text2Xmind()
    let result = agent.chat("请根据以下文章内容生成符合 Markdown 格式的思维导图，适用于 XMind 导入：\n\n" + input.toString())

    // println(result)

    File.writeTo(outputPath, result.toArray())
    println("转换成功！思维导图已输出至：" + outputPath)
}
