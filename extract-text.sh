#!/bin/bash
# 提取硬编码英文文本的脚本

echo "Extracting hardcoded text from Vue files..."

# 创建临时文件
> /tmp/extracted_text.txt

# 提取文本内容（简化版）
find pages components -name "*.vue" -type f | while read file; do
    # 提取标签之间的文本
    grep -oP '>\K[^<>]+(?=<)' "$file" | grep -v "^[[:space:]]*$" >> /tmp/extracted_text.txt
done

# 去重并排序
sort -u /tmp/extracted_text.txt > /tmp/unique_text.txt

echo "Extracted text saved to /tmp/unique_text.txt"
echo "Total unique text strings: $(wc -l < /tmp/unique_text.txt)"

# 显示前20个
head -20 /tmp/unique_text.txt
