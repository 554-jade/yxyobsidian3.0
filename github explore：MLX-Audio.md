
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