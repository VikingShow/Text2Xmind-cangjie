import sqlite3
import re

# 连接到数据库
conn = sqlite3.connect('markdown.db')
cursor = conn.cursor()

# 定义优化函数
def optimize_content(content):
    # 移除标题
    content = re.sub(r'^(#.*\n)+', '', content)
    # 移除代码块
    content = re.sub(r'```.*?```', '', content, flags=re.DOTALL)
    # 移除多余的空白行
    content = re.sub(r'\n\s*\n', '\n', content)
    return content.strip()

# 更新数据库中的内容
cursor.execute('SELECT id, content FROM documents')
rows = cursor.fetchall()
for row in rows:
    id, content = row
    optimized_content = optimize_content(content)
    cursor.execute('UPDATE documents SET content = ? WHERE id = ?', (optimized_content, id))

conn.commit()
conn.close()
