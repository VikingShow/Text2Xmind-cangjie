package Magic

import magic.dsl.*
import magic.prelude.*
import magic.config.Config
import std.fs.*

const MARKDOWNIFY_DIR = "markdownify-mcp"
const INPUT = "input"
const MARKDOWN_OUTPUT_DIR = "markdown_output"
// const XMINDMARK_OUTPUT_DIR = "xmindmark_output"
// const XMIND_OUTPUT_DIR = "xmind_output"

@agent[
    model: "deepseek:deepseek-chat",
    executor: "naive",
    rag: {
        source: "source/tutorial.md",
        mode: "static"
    }
]
class QABot {
    @prompt[pattern: ERA] (
        expectation: "代码块被标签 ```cangjie 和 ```包裹",
        role: "简单问答助手",
        action: "搜索文档获取知识并回答问题"
    )
}

@agent[
    model: "deepseek:deepseek-chat",
    executor: "naive",
    // tools: [pdf-to-markdown]
    mcp: [
        { command: "node", args: [ "${MARKDOWNIFY_DIR}/dist/index.js"] },
        // stdio("node ${MARKDOWNIFY_DIR}/dist/index.js args"),
        // tools(pdf-to-markdown)
    ]
]
class pdf2markdown {
    @prompt[pattern: ERA] (
        expectation: "生成逻辑严谨、内容流畅的，适合于xmind软件的markdown文档",
        role: "其他格式的文件转成markdown文档的助手",
        action: "利用mcp工具将其他格式的文件转为markdown文档"
    )
}



func Convertor(path: String, agent: Agent, outputPath: String, description: String) {
    if(!File.exists(path)){
        println("错误：输入路径不存在 - ${path}")
        return
    }
    if (!Directory.exists(outputPath)) {
        Directory.create(outputPath, recursive:true)
        println("已创建输出目录：${outputPath}")
    }
    if (!File(path, Open(true,false)).canRead()){
        println("错误：无法读取文件 - ${path}")
        return
    }
    for (file in path) {
        try {
            let agent = agent
            let content = File.readFrom(String.fromUtf8(file))
            let request = AgentRequest(content.toString())
            let result = agent.asyncChat(request)
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
    Config.defaultEmbeddingModel = ModelManager.createEmbeddingModel("ollama:nomic-embed-text")

    let agent1 = pdf2markdown()
    Convertor(INPUT, agent1, "${MARKDOWN_OUTPUT_DIR}","PDF转markdown")

    if (File.exists("error.log")) {
        let errorContent = File.readFrom("error.log").toString()
        let codeContent = File.readFrom("src/main.cj").toString()
        let qaBot = QABot()
        let request = AgentRequest(errorContent+"出现上述问题，我该如何解决，下面是我的代码，请给出代码优化建议："+codeContent)
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
