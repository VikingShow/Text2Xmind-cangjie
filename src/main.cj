package Magic

import magic.dsl.*
import magic.prelude.*
import magic.config.Config
import std.fs.File
import std.fs.Directory

const MARKDOWNIFY_DIR = "node_modules/@opendocsg/pdf2md"
const INPUT_DIR = "input"
const OUTPUT_DIR = "output"
const MAP_OUTPUT_DIR = "map_output"
const XMIND_OUTPUT_DIR = "xmind_output"

@agent[
    model: "deepseek:deepseek-chat",
    executor: "react",
    mcp: [
        stdio("npx ${MARKDOWNIFY_DIR} --inputFolderPath=${INPUT_DIR} --outputFolderPath=${OUTPUT_DIR} --recursive")
        // {
        //     command: "npx",
        //     args: [
        //         "${MARKDOWNIFY_DIR}",
        //         // "--max-old-space-size=4096",
        //         "--inputFolderPath=${INPUT_DIR}",
        //         "--outputFolderPath=${OUTPUT_DIR}",
        //         "--recursive"
        //     ]
        // }
    ]
]
class TextAssistant {
    @prompt[pattern: RACE](
        role: "你是一个pdf文档转markdown文档助手。",
        action: "你需要将${INPUT_DIR}中的pdf文档输出为${OUTPUT_DIR}中的markdown文档。",
        context: "你转换出的markdown文档，之后会转换为思维导图，适用于 Xmind 软件导入。",
        expectation: "输出的 Markdown 格式的文件，注意不要有错别字，注意 Markdown 语法和层级结构正确。"
    )
}

@agent[
    model: "deepseek:deepseek-chat",
]
class Text2Xmind {
    @prompt[pattern: ARM](
        analyze: "请分析文章的整体结构，将其划分为若干主题及子主题。",
        refining: "请针对每个主题与子主题，提炼目录结构及每部分的关键内容。这个结构不必须按照文章的先后顺序，要符合内容的逻辑顺序，同时每个小点下面要有对应的文章原文",
        toMap: "请将提炼结果转换为符合 Markdown 格式的思维导图内容，适用于 XMind 软件导入，注意 Markdown 语法和层级结构正确。"
    )
}

@agent[
    model: "deepseek:deepseek-chat",
    executor: "react",
    mcp: [
        stdio("xmindmark ${MAP_OUTPUT_DIR}")
        // {
        //     command: "xmindmark",
        //     args: [
        //         "${MAP_OUTPUT_DIR}"
        //     ]
        // }
    ]
]
class XmindAssistant {
    @prompt[pattern: ERA](
        expectation: "使思维导图中的每个节点不重复、不遗漏，有逻辑、有条理地展现出内容",
        role: "你是一个思维导图优化助手",
        action: "将${OUTPUT_DIR}中的 .xmindmark 适当进行逻辑优化，并根据命令，将 .xmindmark 转换为 .xmind 格式"
    )
}

@promptPattern
class ARM {
    @element[description: "分析文章结构，将文章按主题和子主题进行内容划分，总标题保留原来的文章标题"]
    let analyze: String

    @element[description: "按照分析出的文章主题与子主题，提炼出文章的目录及每个主题下的概述内容"]
    let refining: String

    @element[description: "按照抽象出的目录，写出符合 Markdown 格式的思维导图"]
    let toMap: String

    public func toString(): String {
        return "分析：${analyze}\n提炼：${refining}\n生成思维导图：${toMap}"
    }
}

func getFileNameWithoutExtension(filePath: String): String {
    let parts = filePath.split("\\")
    let filename = parts[parts.size - 1]
    let nameParts = filename.split(".")
    if (nameParts.size > 1) {
        return nameParts[0]
    } else {
        return filename
    }
}

func createDirectoryIfNotExists(path: String): Unit {
    if (!Directory.exists(path)) {
        Directory.create(path, recursive: true)
    }
}

func processPdfToMarkdown(agent: TextAssistant): Unit {
    println("开始：PDF 转 Markdown")
    let dir = Directory(INPUT_DIR)
    let pdfFiles = dir.fileList()
    for (filePath in pdfFiles) {
        let content = File.readFrom(filePath.path)
        try {
            let text = String.fromUtf8(content)
            let result = agent.chat("请将以下 PDF 内容转换为 Markdown 格式：\n\n" + text)
            let fileName = getFileNameWithoutExtension(filePath.path.toString())
            let outputFilePath = "${OUTPUT_DIR}/${fileName}.md"
            File.writeTo(outputFilePath, result.toArray())
            println("已处理文件：${fileName}.pdf")
        } catch (e: Exception) {
            println("转换 PDF 内容时发生错误： " + e.message)
        }
    }
    println("完成：PDF 转 Markdown")
}

func processMarkdownToXmind(agent: Text2Xmind): Unit {
    println("开始：Markdown 转思维导图")
    let dir = Directory(OUTPUT_DIR)
    let markdownFiles = dir.fileList()
    for (filePath in markdownFiles) {
        let content = File.readFrom(filePath.path)
        try {
            let text = String.fromUtf8(content)
            let result = agent.chat("请根据以下文章内容生成符合 Markdown 格式的思维导图，适用于 XMind 导入，要对整体进行逻辑优化：\n\n" + text)
            let fileName = getFileNameWithoutExtension(filePath.path.toString())
            let outputFilePath = "${MAP_OUTPUT_DIR}/${fileName}.xmindmark"
            File.writeTo(outputFilePath, result.toArray())
            println("已处理文件：${fileName}.md")
        } catch (e: Exception) {
            println("转换为思维导图时发生错误： " + e.message)
        }
    }
    println("完成：Markdown 转思维导图")
}

func processXmindmarkToXmind(agent: XmindAssistant): Unit {
    println("开始：生成 XMind 文件")
    let dir = Directory(MAP_OUTPUT_DIR)
    let xmindmarkFiles = dir.fileList()
    for (filePath in xmindmarkFiles) {
        let content = File.readFrom(filePath.path)
        try {
            let text = String.fromUtf8(content)
            let result = agent.chat("请将以下内容转换为 .xmind 文件，要逻辑严谨，要保证思维导图每个节点不重复、不遗漏：\n\n" + text)
            let fileName = getFileNameWithoutExtension(filePath.path.toString())
            let outputFilePath = "${XMIND_OUTPUT_DIR}/${fileName}.xmind"
            File.writeTo(outputFilePath, result.toArray())
            println("已处理文件：${fileName}.xmindmark")
        } catch (e: Exception) {
            println("生成 XMind 文件时发生错误： " + e.message)
        }
    }
    println("完成：生成 XMind 文件")
}

main(): Unit {
    Config.env["DEEPSEEK_API_KEY"] = "sk-fa13582775314772a81935ab04d056e5"

    createDirectoryIfNotExists(INPUT_DIR)
    createDirectoryIfNotExists(OUTPUT_DIR)
    createDirectoryIfNotExists(MAP_OUTPUT_DIR)
    createDirectoryIfNotExists(XMIND_OUTPUT_DIR)

    let agent1 = TextAssistant()
    processPdfToMarkdown(agent1)

    let agent2 = Text2Xmind()
    processMarkdownToXmind(agent2)

    let agent3 = XmindAssistant()
    processXmindmarkToXmind(agent3)

    println("全部处理完成！")
}
