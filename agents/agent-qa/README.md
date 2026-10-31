# agent-qa（AI 应用测试 Agent）

## 简介

[agent-qa](https://vostride.com) 面向开发者与 QA 团队，用自然语言描述用户旅程，在 Web、Android 和 iOS 应用上执行测试并保留运行证据。可通过 CLI、MCP 与编码智能体配合使用。

## 核心特性

- **memidex 持久记忆**：把经过运行验证的事实与操作流程保存为可审查的仓库文件，供后续测试参考。
- **经验证的自我改进**：验证运行中获得的经验、淘汰过时知识，并通过反馈修正判断。
- **可审查证据**：保留截图、日志和运行产物，便于定位失败原因与复查结果。
- **CLI / MCP**：让编码智能体编写和运行测试、读取证据、反馈结果与管理知识。

## 典型 Use Case

以下为官方文档中的工作流示例。

- **购物车总价校验**：[Quickstart](https://vostride.com/docs/agent-qa/quickstart) 提供公开演示商店及带有已知缺陷的购物车测试，展示自然语言断言与证据检查。
- **失败归因与反馈**：通过 [MCP](https://vostride.com/docs/agent-qa/mcp) 读取运行概览、截图和日志，再对误报或确认的缺陷进行标记。

## 效果评估

发布方公开的报告：

- [AndroidWorld](https://vostride.com/benchmark/android-world)：100% pass@1，116/116 项任务。
- [AppControlBench](https://vostride.com/benchmark/app-control-bench)：99.6% 完成度，114.5/115 分；部分完成按半分计算。

两份报告均使用 gpt-6-sol，关闭记忆与自我改进。本条目引用发布方结果，未新增独立复测数据。

## 安装与使用

需要 Node.js 24+。在测试项目中安装：

```sh
npm install -D agent-qa
```

按 [Quickstart](https://vostride.com/docs/agent-qa/quickstart) 配置模型、浏览器或设备及测试目标后，可在同一目录启动 stdio MCP 服务：

```sh
npx agent-qa mcp
```

运行时许可证为 FSL-1.1-ALv2；模型与外部服务费用随配置和用量变化。

## 相关链接

- [官网](https://vostride.com)
- [GitHub](https://github.com/vostride/agent-qa)
- [MCP 文档](https://vostride.com/docs/agent-qa/mcp)
- [memidex](https://vostride.com/docs/agent-qa/memory)
- [自我改进](https://vostride.com/docs/agent-qa/self-improvement)

本条目由 agent-qa / vostride 提交。
