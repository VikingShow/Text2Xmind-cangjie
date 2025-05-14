import os
from html_to_markdown import convert_to_markdown # type: ignore

def convert_html_files_to_markdown(input_dir, output_dir):
    for root, dirs, files in os.walk(input_dir):
        for file in files:
            if file.lower().endswith('.html'):
                input_path = os.path.join(root, file)
                relative_path = os.path.relpath(root, input_dir)
                output_subdir = os.path.join(output_dir, relative_path)
                os.makedirs(output_subdir, exist_ok=True)
                output_file = os.path.splitext(file)[0] + '.md'
                output_path = os.path.join(output_subdir, output_file)

                try:
                    with open(input_path, 'r', encoding='utf-8') as f:
                        html_content = f.read()
                    markdown_content = convert_to_markdown(html_content)
                    with open(output_path, 'w', encoding='utf-8') as f:
                        f.write(markdown_content)
                    print(f"转换成功: {input_path} -> {output_path}")
                except Exception as e:
                    print(f"转换失败: {input_path}，错误信息: {e}")

# 使用示例
input_directory = 'cangjie-0.53.4-docs-html'   # 替换为实际的输入目录路径
output_directory = 'cangjie-0.53.4-markdown' # 替换为实际的输出目录路径
convert_html_files_to_markdown(input_directory, output_directory)
