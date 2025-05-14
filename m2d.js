const fs = require('fs');
const path = require('path');
const sqlite = require('better-sqlite3');

// 打开数据库
const db = sqlite('markdown.db');

// 创建表格
db.prepare(`
  CREATE TABLE IF NOT EXISTS documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    path TEXT,
    content TEXT
  )
`).run();

// 遍历目录并插入数据
function insertMarkdownFiles(dir) {
  const files = fs.readdirSync(dir);
  files.forEach(file => {
    const fullPath = path.join(dir, file);
    const stats = fs.statSync(fullPath);
    if (stats.isDirectory()) {
      insertMarkdownFiles(fullPath); // 递归子目录
    } else if (file.endsWith('.md')) {
      const content = fs.readFileSync(fullPath, 'utf-8');
      db.prepare('INSERT INTO documents (path, content) VALUES (?, ?)').run(fullPath, content);
    }
  });
}

// 开始插入数据
insertMarkdownFiles('C:/Users/SowrJam/workspace/Magic/cangjie-0.53.4-markdown');

// 关闭数据库
db.close();
