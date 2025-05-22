# agents 目录

本目录用于收录各类 AI Agent 项目，推荐每个 agent 建立独立子目录，内容包括：简介、核心特性、典型 Use Case、效果评估、安装与使用、相关链接等。

## 如何添加新 Agent

1. 复制 `agent-template` 目录，重命名为你的 agent 名称（如 fellou、manus 等）。
2. 按模板完善各项内容。
3. 欢迎通过 PR 提交。

## 目录结构示例

```
agents/
├── agent-template/           # 模板目录（请勿直接修改）
│   └── README.md
├── fellou/                  # Fellou agent 示例
│   └── README.md
├── manus/                   # Manus agent 示例
│   └── README.md
└── ...                      # 其他 agent
```

## 已收录 Agent

- [Fellou（Agentic 浏览器）](./fellou/)
  > 全球首个 Agentic 浏览器，支持智能浏览、自动执行任务、跨应用集成，适合高效信息处理和自动化办公。
- [Manus（通用 AI Agent）](./manus/)
  > 通用型 AI Agent，支持多领域自动化任务，适用于数据分析、教育、B2B 研究等多场景。

> 每个 agent 目录下的 README.md 详见具体内容。



