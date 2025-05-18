package Magic

import magic.dsl.*
import magic.prelude.*
import magic.config.Config
import std.fs.*
import std.log.*

// const MARKDOWNIFY_DIR = "markdownify-mcp"
// const INPUT = "input"
// const MARKDOWN_OUTPUT_DIR = "markdown_output"
// const XMINDMARK_OUTPUT_DIR = "xmindmark_output"
// const XMIND_OUTPUT_DIR = "xmind_output"


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



main() {
    Config.env["DEEPSEEK_API_KEY"] = "sk-fa13582775314772a81935ab04d056e5"
    // Config.env["DEEPSEEK_API_KEY"] = System.getenv("DEEPSEEK_API_KEY")
    Config.defaultEmbeddingModel = ModelManager.createEmbeddingModel("ollama:nomic-embed-text")

    let bot = QABot()
    let aresp = bot.asyncChat("搜索 markdown.db 中的内容,并告诉我怎么用仓颉语言实现pdf转markdown")
    for (chunk in aresp) {
        print(chunk)
    }
    println("\n---end---")
    if (let Some(info) <- aresp.execInfo) {
        for (info in info.retrievalInfo) {
            for (doc in info.retrieval.sources) {
                println(doc.metadata)
            }
        }
    }

}
