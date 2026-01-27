---
tags:
  - 教程
  - github
---

<div class="rich-link-card-container"><a class="rich-link-card" href="https://github.com/VectifyAI/PageIndex" target="_blank">
	<div class="rich-link-image-container">
		<div class="rich-link-image" style="background-image: url('https://github.com/fluidicon.png')">
	</div>
	</div>
	<div class="rich-link-card-text">
		<h1 class="rich-link-card-title">GitHub - VectifyAI/PageIndex: 📑 PageIndex: Document Index for Vectorless, Reasoning-based RAG</h1>
		<p class="rich-link-card-description">
		📑 PageIndex: Document Index for Vectorless, Reasoning-based RAG - VectifyAI/PageIndex
		</p>
		<p class="rich-link-href">
		https://github.com/VectifyAI/PageIndex
		</p>
	</div>
</a></div>

**PageIndex** 是一个极具创新性的开源项目，它的核心目标是解决传统 AI 在阅读长篇、专业文档（如百页财报、法律条文）时“找不准”的问题。

简单来说，它的口号是 **“摒弃向量数据库（Vectorless）”**，改用 **“逻辑推理（Reasoning-based）”** 的方式来读文档。

---

### 一、 它实现了什么功能？

1. **构建“超级语义目录”**：它能将本地的 PDF 或 Markdown 文档转换成一个层级分明的**树状索引（PageIndex Tree）**。这不仅仅是抓取目录，而是为每个章节生成逻辑摘要。
    
2. **类人检索（Human-like Retrieval）**：它模拟专家翻书的过程。当你问一个问题，AI 不会在全书乱搜关键词，而是先看目录，确定在哪个大章，再进入小节，最后定位到精准的段落。
    
3. **高精度知识提取**：在金融问答基准测试（FinanceBench）中，它达到了 **98.7%** 的准确率，远超目前市面上大多数主流的 AI 读书工具。
    
4. **视觉感知（Vision-based）**：它支持直接识别 PDF 页面图像，不需要 OCR 预处理也能理解带有图表、复杂布局的文档。
    

---

### 二、 它是怎么做到的？（技术原理）

PageIndex 的工作流程分为两个核心阶段：

#### 1. 索引阶段：建立树状结构

它利用大语言模型（LLM）的分析能力，将长文档转化为类似树的结构：

- **非机械分块**：它不按字数硬切，而是按文档的自然章节（标题、子标题）来划分。
    
- **语义节点**：每一个节点（章节）都会包含标题、起止页码以及一段简短的摘要。这样 LLM 就能通过阅读摘要，快速判断这部分是否包含用户想要的答案。
    

#### 2. 检索阶段：逻辑路径导航

这是它与众不同的地方。它采用了类似 **AlphaGo 的树搜索（Tree Search）** 逻辑：

- **第一步（宏观定位）**：LLM 先阅读根节点的摘要，决定去哪一个主章节。
    
- **第二步（微调搜索）**：顺着选中的主章节，进入子章节继续推理，直到锁定最相关的原文片段。
    
- **第三步（生成回答）**：只将选中的那个精准片段喂给 AI，生成带有明确**页码参考**的回答。
---
安装 **PageIndex** 并配置 **Gemini API** 的流程非常清晰。由于你的 Mac 是 8GB 内存，这种依赖云端 API 的方案非常适合你，因为它几乎不消耗本地硬件资源。

以下是为您整理的详细步骤：

### 1. 环境准备

确保你的 Mac 已安装 **Python**（建议 3.9 或更高版本）和 **Git**。

1. **打开终端 (Terminal)**。
    
2. **创建并进入项目目录**：
    
    Bash
    
    ```
    mkdir my_pageindex && cd my_pageindex
    ```
    
3. **克隆项目源码**：
    
    Bash
    
    ```
    git clone https://github.com/VectifyAI/PageIndex.git
    cd PageIndex
    ```
    

---

### 2. 创建并激活虚拟环境

这是为了保持系统整洁，防止依赖冲突：

1. **创建环境**：
    
    Bash
    
    ```
    python3 -m venv venv
    ```
    
2. **激活环境**：
    
    Bash
    
    ```
    source venv/bin/activate
    ```
    

---

### 3. 安装依赖包

运行以下命令安装项目所需的库：

Bash

```
pip3 install --upgrade -r requirements.txt
```

---

### 4. 配置 Gemini API Key

PageIndex 默认配置为 OpenAI，但你可以通过以下方式使用 Gemini（或通过中转工具使其兼容 OpenAI 格式）。

1. **获取 Gemini Key**：前往 [Google AI Studio](https://aistudio.google.com/) 申请免费 Key。
    
2. **创建配置文件**：
    
    在项目根目录下创建一个名为 `.env` 的文件。
    
3. **写入配置**：
    
    如果项目已支持 Gemini，则写入：
    
    Plaintext
    
    ```
    GOOGLE_API_KEY=你的_GEMINI_KEY
    ```
    
    _注：如果该项目当前版本仍仅严格支持 `CHATGPT_API_KEY` 变量名，你可能需要配合 API 中转地址（如 One API）来将 Gemini 伪装成 OpenAI。_
    

---

### 5. 运行项目处理本地 PDF

一切就绪后，你可以运行脚本来分析你的 PDF 文件了。

**基本运行命令**：

Bash

```
python3 run_pageindex.py --pdf_path /你的/文件路径/document.pdf
```

**针对 8GB 内存的优化参数**：

你可以通过以下可选参数来微调处理过程，建议初次尝试使用 `gemini-1.5-flash` 模型，它速度最快且免费额度高：

Bash

```
python3 run_pageindex.py --pdf_path test.pdf --model gemini-1.5-flash
```

---

### 运行后你会得到什么？

- **语义树索引**：脚本运行完后，会生成一个 JSON 格式的“树状目录”。
    
- **知识整理**：之后你可以基于这个生成的索引，通过提问让 AI 精准提取 PDF 中的知识点，它会告诉你这些信息具体在第几页。
    

