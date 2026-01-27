---
tags:
  - 教程
  - github
---

<div class="rich-link-card-container"><a class="rich-link-card" href="https://github.com/Blaizzy/mlx-audio" target="_blank">
	<div class="rich-link-image-container">
		<div class="rich-link-image" style="background-image: url('https://github.com/fluidicon.png')">
	</div>
	</div>
	<div class="rich-link-card-text">
		<h1 class="rich-link-card-title">GitHub - Blaizzy/mlx-audio: A text-to-speech (TTS), speech-to-text (STT) and speech-to-speech (STS) library built on Apple's MLX framework, providing efficient speech analysis on Apple Silicon.</h1>
		<p class="rich-link-card-description">
		A text-to-speech (TTS), speech-to-text (STT) and speech-to-speech (STS) library built on Apple's MLX framework, providing efficient speech analysis on Apple Silicon. - Blaizzy/mlx-audio
		</p>
		<p class="rich-link-href">
		https://github.com/Blaizzy/mlx-audio
		</p>
	</div>
</a></div>

**MLX-Audio** 是一个专为 **Apple Silicon**（M1/M2/M3/M4 系列芯片）原生优化的全能型音频 AI 处理库。

它基于苹果官方的 **MLX 框架**构建，目标是在 Mac 电脑上实现极致的运行速度和极低的显存占用，让用户无需复杂的配置或昂贵的云端服务，就能在本地流畅处理音频。

### 核心功能模块

该项目将音频 AI 分为三个主要方向：

- **TTS (文字转语音)：** 将文字转换为极其自然的语音。支持 **Kokoro**、**Qwen3-TTS** 等主流模型，并具备声音克隆（只需一段参考音频即可模仿）和情感控制功能。
    
- **STT (语音转文字)：** 进行高效的语音识别。集成了 OpenAI 的 **Whisper** 以及支持说话人区分（自动识别是谁在说话）的 **VibeVoice-ASR** 等模型。
    
- **STS (语音转语音)：** 包含语音增强（一键去噪）和音源分离（如从嘈杂背景中提取人声）等高级处理。
    

### 为什么它值得关注？

- **极致性能：** 针对 Mac 硬件深度优化，推理速度远超通用的 Python 库。
    
- **低内存门槛：** 支持 **4-bit/8-bit 量化**，即使是 8GB 内存的入门款 Mac 也能运行大型语音模型。
    
- **易于集成：** 提供 **OpenAI 兼容的 API 接口**，开发者可以将其作为本地后端，无缝替换现有的云端 AI 语音服务。
    
- **开箱即用：** 自带一个美观的 **Web 交互界面**（支持 3D 音效可视化），适合普通用户快速上手体验。

---


### 准备工作：环境清理

在开始之前，请关闭 Mac 上所有不必要的软件（如 Chrome 的多余标签页、微信、办公软件等），为 AI 计算腾出宝贵的“统一内存”。

---

### 第一步：安装基础环境

打开**终端 (Terminal)**，依次输入以下命令：

1. **安装 Node.js (运行网页界面必需):**
    
    如果你电脑没装过 Node.js，最快的方法是去 [nodejs.org](https://nodejs.org/) 下载并安装 **LTS 版本**。
    
2. **创建项目文件夹并进入:**
    
    Bash
    
    ```
    mkdir mlx_ui && cd mlx_ui
    ```
    
3. **克隆项目源码:**
    
    Bash
    
    ```
    git clone https://github.com/Blaizzy/mlx-audio.git
    cd mlx-audio
    ```
    

---

### 第二步：配置 Python 虚拟环境

为了防止库冲突，我们建立一个独立的空间：

1. **创建虚拟环境:**
    
    Bash
    
    ```
    python3 -m venv venv
    ```
    
2. **激活环境:**
    
    Bash
    
    ```
    source venv/bin/activate
    ```
    
3. **安装开发版依赖 (包含 UI 所需组件):**
    
    Bash
    
    ```
    pip install -e ".[dev]"
    ```
    

---

### 第三步：启动后端服务器 (窗口 A)

在当前终端窗口中，启动 AI 处理后端：

Bash

```
mlx_audio.server
```

- **注意:** 看到终端显示 `Uvicorn running on http://0.0.0.0:8000` 之后，**不要关闭这个窗口**。
    

---

### 第四步：启动前端网页 (窗口 B)

现在，我们需要再开一个终端窗口来运行网页：

1. **打开新终端窗口**，再次进入项目目录：
    
    Bash
    
    ```
    cd mlx_ui/mlx-audio/mlx_audio/ui
    ```
    
2. **安装前端依赖:**
    
    Bash
    
    ```
    npm install
    ```
    
3. **启动开发服务器:**
    
    Bash
    
    ```
    npm run dev
    ```
    

- **提示:** 看到 `Ready in ... ms` 并出现 `http://localhost:3000` 网址时，说明启动成功。
    

---

### 第五步：浏览器操作与内存优化

1. **访问页面:** 在浏览器（推荐用 Safari，它在 Mac 上比 Chrome 更省内存）输入 `http://localhost:3000`。
    
2. **选择模型 (关键):**
    
    - 在界面顶部的模型选择框中，**手动输入**或选择 `mlx-community/Kokoro-82M-bf16`。
        
    - **千万不要**一上来就选带 `Large` 或 `1.7B` 以上的模型，否则 8GB 内存会瞬间爆掉。
        
3. **开始生成:** 输入一段文字，点击 **Generate**。
    

### 总结与排错

- **如果网页打不开:** 检查终端窗口 A 是否显示了错误，通常是端口占用或模型下载失败。
    
- **如果点击生成后卡住:** 观察窗口 A 的日志，第一次运行会下载模型（约几百 MB），请耐心等待下载完成。
    
- **内存监控:** 你可以打开 Mac 自带的 **“活动监视器”**，切换到 **“内存”** 分页。如果“内存压力”变红，请立刻关闭后端服务器。
    
