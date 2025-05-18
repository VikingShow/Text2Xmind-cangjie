package Magic

import magic.dsl.*
import magic.prelude.*
import magic.config.Config
import std.fs.*
import std.log.*

const MARKDOWNIFY_DIR = "markdownify-mcp"
const INPUT = "input"
const MARKDOWN_OUTPUT_DIR = "markdown_output"
const XMINDMARK_OUTPUT_DIR = "xmindmark_output"
const XMIND_OUTPUT_DIR = "xmind_output"

// var logger = SimpleLogger()
// func logInfo(message: String) {
//     logger.info(message)
//     println(message)
// }

// func logError(message: String, e: Exception? = null) {
//     logger.error(message, e)
//     println("ERROR: $message")
//     if (e != null) {
//         println(e.stackTraceToString())
//     }
// }

@agent[
    model: "deepseek:deepseek-chat",
    executor: "naive",
    rag: { source: "markdown.db" }
]
class QABot {
    @prompt[pattern: ERA] (
        expectation: "代码块被标签 ```cangjie 和 ```包裹",
        role: "简单问答助手",
        action: "搜索 markdown.db 中的内容获取仓颉编程语言的文档并用仓颉语言回答问题"
    )
}

@agent[
    model: "deepseek:deepseek-chat",
    executor: "naive",
    // tools: [PDFToMarkdownTool]
    mcp: [
        { command: "node", args: [ "${MARKDOWNIFY_DIR}/dist/index.js"] },
        // stdio("node ${MARKDOWNIFY_DIR}/dist/index.js args"),
        // tools(pdf-to-markdown)
    ]
]
class pdf2markdown {
    @prompt[pattern: ERA] (
        expectation: "生成逻辑严谨、内容流畅的，适合于 xmind 软件的 markdown 文档",
        role: "其他格式的文件转成 markdown 文档的助手",
        action: "利用mcp工具将其他格式的文件转为 markdown 文档"
    )
}

@agent[
    model: "deepseek:deepseek-chat",
]
class markdown2xmindmarkdown {
    @prompt[pattern: ERA] (
        expectation: "生成逻辑严谨、适用于 xmind 软件的 xmindmark 文档",
        role: "markdown 转为 xmindmark 格式的助手",
        action: "根据数据库中的内容将 markdown 有逻辑有条理地转换为 xmindmark 格式"
    )
}

@agent[
    model: "deepseek:deepseek-chat",
    mcp: [
        { command: "xmindmark", args: [ "${XMINDMARK_OUTPUT_DIR}"]}
    ]
]
class xmindmarkdown2xmind {
    @prompt[pattern: ERA] (
        expectation: "生成逻辑严谨，每个节点不重复、不遗漏的 xmind 思维导图",
        role: "xmindmark 转 xmind 思维导图",
        action: "将 xmindmark 转为 xmind 思维导图，确保逻辑清晰，同时将 xmindmark 的大标题转成思维导图的主节点的名称"
    )
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


func Convertor(path: String, agent: Agent, outputDir: String, description: String, suffix: String) {
    if(!Directory.exists(path)){
        println("错误：输入路径不存在 - ${path}")
        File.writeTo("error.log", "File not found: ${path}\n".toArray())
        return
    }
    // if (!File(path, Open(true,false)).canRead()){
    //     println("错误：无法读取文件 - ${path}")
    //     File.writeTo("error.log", "Permission denied: ${path}\n".toArray())
    //     return
    // }
    try {
        if (!Directory.exists(outputDir)) {
            Directory.create(outputDir, recursive:true)
            println("已创建输出目录：${outputDir}")
        }
    } catch (e: Exception) {
        println("创建目录失败：${e.message}")
        File.writeTo("error.log", "Directory creation failed: ${e.message}\n".toArray())
        return
    }
    
    for (file in path) {
        try {
            let agent = agent
            let content = File.readFrom(String.fromUtf8(file))
            let request = AgentRequest(content.toString())
            let result = agent.asyncChat(request)
            let fileName = getFileNameWithoutExtension(file.toString())
            let outputPath = "${outputDir}/${fileName}.${suffix}"
            File.writeTo(outputPath, result.content.toArray())
            println("${description}阶段的${file}转换成功！")
        } catch(e: Exception){
            // var errorDetails = while {
            //     e is FileNotFoundException -> "文件未找到"

            // }
            let errorMessage = "${description}出现错误，" + e.message
            println(errorMessage)
            File.writeTo("error.log", "${errorMessage}\n".toArray())
        }
    }
}

    
main() {
    Config.env["DEEPSEEK_API_KEY"] = "sk-fa13582775314772a81935ab04d056e5"
    // Config.env["DEEPSEEK_API_KEY"] = System.getenv("DEEPSEEK_API_KEY")
    Config.defaultEmbeddingModel = ModelManager.createEmbeddingModel("ollama:nomic-embed-text")

    var agents = ArrayList(
        pdf2markdown(),
        markdown2xmindmarkdown(),
        xmindmarkdown2xmind()
    )

    Convertor(INPUT, agents[0], MARKDOWN_OUTPUT_DIR,"PDF转markdown", "md")
    Convertor(MARKDOWN_OUTPUT_DIR, agents[1], XMINDMARK_OUTPUT_DIR, "markdown转xmindmark", "xmindmark")
    Convertor(XMINDMARK_OUTPUT_DIR, agents[2], XMIND_OUTPUT_DIR, "xmindmark转xmind", "xmind")

    if (File.exists("error.log")) {
        let errorContent = File.readFrom("error.log").toString()
        let codeContent = File.readFrom("src/main.cj").toString()
        let qaBot = QABot()
        let request = AgentRequest(errorContent+"出现上述问题，我该如何解决，下面是我的代码，请给出代码优化建议，请用中文回答："+codeContent)
        let result = qaBot.asyncChat(request)
        // println("QABot建议： \n" + result.content.toString())
        for (chunk in result) {
            print(chunk)
        }
        println("\n---end---")
        if (let Some(info) <- result.execInfo) {
            for (info in info.retrievalInfo) {
                for (doc in info.retrieval.sources) {
                    println(doc.metadata)
                }
            }
        }
    }
    
}
