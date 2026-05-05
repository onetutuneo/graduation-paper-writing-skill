# thesis-writer

> AI 辅助中文毕业论文写作 Skill，面向交通运输、物流工程、选址、运筹学与机器学习领域。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![AI Agent](https://img.shields.io/badge/AI%20Agent-Skill-green)](https://github.com/onetutuneo/graduation-paper-writing-skill)
[![Domain](https://img.shields.io/badge/Domain-Transportation%20%7C%20Logistics%20%7C%20OR-blue)](https://github.com/)

---

## 简介

> 本 Skill 改自 [Orchestra-Research/AI-Research-SKILLs - ML Paper Writing](https://github.com/Orchestra-Research/AI-Research-SKILLs/tree/main/20-ml-paper-writing)，针对中文毕业论文场景进行了全面适配。

`thesis-writer` 是一个 AI 辅助论文写作 Skill，专注于中文毕业论文写作，适用于 Claude Code、Cursor、Windsurf 等支持 SKILL.md 格式的 AI 编程助手。它在原版 ML 顶会论文写作 Skill 的基础上，综合了顶尖研究者（Neel Nanda、Sebastian Farquhar、Karpathy 等）的写作哲学，并针对中文学术写作规范进行了深度适配。

**核心特点**：

- **中文毕设适配**：基于 GB/T 7714-2015 等国家标准，适配中文毕业论文写作规范
- **通用设计**：不绑定任何具体项目，适配任意 LaTeX 模板
- **领域专精**：内置交通运输、物流工程、选址、运筹学领域写作指南
- **引用验证**：严禁编造参考文献，必须搜索验证后添加
- **主动交付**：默认主动生成初稿，然后迭代修改，而非步步询问
- **职责分离**：Skill 代码与用户数据完全分离，支持多项目复用

---

## 架构设计

### Skill 与用户项目分离

本 Skill 采用**代码与数据分离**的架构：

```
┌─────────────────────────────────────────────────────────────┐
│                    Skill 目录（只读）                          │
│  .agents/skills/thesis-writer/                               │
│  ├── SKILL.md                    # 核心指令                   │
│  └── references/                 # 写作参考文档               │
│      ├── checklist.md            # 论文检查清单               │
│      ├── writing-guide.md        # 写作哲学                   │
│      └── chinese-academic-style.md  # 中文写作规范            │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                  用户项目目录（可读写）                         │
│  my-thesis-project/                                          │
│  ├── templates/                  # LaTeX 模板（用户放入）      │
│  ├── examples/                   # 参考稿件（用户放入）        │
│  └── paper_output/               # 论文输出（AI 生成）         │
└─────────────────────────────────────────────────────────────┘
```

**优势**：

- 一个 Skill 可服务多个论文项目
- Skill 可独立版本管理和更新
- 用户项目可独立管理，不污染 Skill 代码

---

## 安装

### 前置要求

- 支持 SKILL.md 的 AI 编程助手（[Claude Code](https://claude.ai/code)、[Cursor](https://cursor.sh)、[Windsurf](https://codeium.com/windsurf) 等）
- LaTeX 环境（推荐 TeX Live 或 MiKTeX）
- 中文字体支持

### 安装步骤

1. **克隆或下载本仓库**

```bash
git clone https://github.com/onetutuneo/graduation-paper-writing-skill.git
```

2. **将 Skill 复制到你的项目**

```bash
# 复制到项目目录
cp -r thesis-writer /path/to/your/project/.agents/skills/thesis-writer
```

3. **初始化项目目录结构**

```bash
# 在项目根目录执行
cd /path/to/your/project/
mkdir -p templates examples paper_output
```

4. **重启 AI 助手**

Skill 会在下次对话时自动加载。

---

## 快速开始

### 第一步：准备模板

将你的 LaTeX 模板放入项目根目录下的 `templates/` 目录：

```bash
# 在项目根目录执行
mkdir -p templates/my-thesis
cp -r /path/to/your/latex/template/* templates/my-thesis/
```

**重要**：不要直接修改模板文件。Skill 会从模板复制并在新目录中生成论文。

### 第二步：准备研究材料（可选）

将已有稿件、研究笔记、实验结果放入项目根目录下的 `examples/` 目录：

```bash
mkdir -p examples/wsaa-benders
cp your-draft.tex examples/wsaa-benders/
cp research-notes.md examples/wsaa-benders/
```

### 第三步：触发 Skill

在 AI 助手中，使用以下任一方式触发：

```
写论文，使用模板 thesis
撰写毕业论文，研究方向是xxxx
生成论文初稿，参考 examples/wsaa-benders 中的材料
```

---

## 标准化工作流

### 工作流概览

```
┌─────────────────────────────────────────────────────────────┐
│                    论文撰写工作流                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. 安装 Skill ──→ .agents/skills/thesis-writer/             │
│       │                                                     │
│       ▼                                                     │
│  2. 初始化目录 ──→ mkdir templates examples paper_output           │
│       │                                                     │
│       ▼                                                     │
│  3. 放入模板 ──→ templates/<template-name>/                  │
│       │                                                     │
│       ▼                                                     │
│  4. 放入材料 ──→ examples/<example-name>/（可选）             │
│       │                                                     │
│       ▼                                                     │
│  5. AI 复制模板 ──→ paper_output/<thesis-name>/                    │
│       │                                                     │
│       ▼                                                     │
│  6. AI 撰写 ──→ paper_output/<thesis-name>/chapters/*.tex          │
│       │                                                     │
│       ▼                                                     │
│  7. 人工审核 ──→ 修改、补充                                   │
│       │                                                     │
│       ▼                                                     │
│  8. 编译输出 ──→ paper_output/<thesis-name>/Thesis.pdf             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 详细说明

#### 1. 安装 Skill

将 Skill 复制到 `.agents/skills/` 目录：

```bash
cp -r thesis-writer /path/to/your/project/.agents/skills/thesis-writer
```

#### 2. 初始化项目目录

```bash
cd /path/to/your/project/
mkdir -p templates examples paper_output
```

#### 3. 准备模板

将学校提供的 LaTeX 模板放入 `templates/` 目录，每个模板一个子目录：

```
templates/
├── my-thesis/             # 我的论文模板
├── another-template/      # 另一个模板
└── ...
```

**模板应包含**：

- `Thesis.tex`（主文档）
- `*.cls`（文档类定义）
- `*.bst`（参考文献样式）
- `chapters/`（章节目录）
- `reference/ref.bib`（参考文献数据库）
- `figures/`（图表目录）

#### 4. 准备研究材料

将研究材料放入 `examples/` 目录（放置于此目录即可，不限制格式）：

```
examples/
└── wsaa-benders/
    ├── draft.docx           # 已有稿件（Word 格式）
    ├── draft.tex            # 已有稿件（LaTeX 格式）
    ├── notes.md             # 研究笔记
    ├── results/             # 实验结果
    │   ├── comparison.xlsx
    │   └── convergence.png
    └── code/                # 相关代码（可选）
        └── algorithm.py
```

#### 5-6. AI 撰写

触发 Skill 后，AI 会：

1. 从 `templates/<template-name>/` 复制模板到 `paper_output/<thesis-name>/`
2. 分析 `examples/` 中的研究材料
3. 理解主要贡献和创新点
4. 按照模板格式生成 LaTeX 代码
5. 保存到 `paper_output/<thesis-name>/chapters/` 对应文件
6. 添加验证过的参考文献到 `ref.bib`

#### 7. 人工审核

检查 AI 生成的内容：

- [ ] 贡献陈述是否准确
- [ ] 实验数据是否正确
- [ ] 参考文献是否验证
- [ ] 格式是否符合学校要求

#### 8. 编译输出

```bash
cd paper_output/<thesis-name>/
xelatex Thesis.tex
bibtex Thesis.aux
xelatex Thesis.tex
xelatex Thesis.tex
```

---

## 使用场景

### 场景 1：从零开始撰写

```
用户：写论文，使用模板 thesis
     研究方向：带随机需求的选址-路径问题（WSAA）
     主要贡献：提出改进的 Benders 分解算法，加速 3.2 倍
```

### 场景 2：基于已有稿件修改

```
用户：按照模板格式修改论文
     参考稿件：examples/wsaa-benders/draft.docx
     使用模板：my-thesis
```

### 场景 3：撰写特定章节

```
用户：写第三章，问题描述与模型构建
     参考 examples/wsaa-benders/ 中的模型描述
```

### 场景 4：整理参考文献

```
用户：整理参考文献，查找 Benders 分解加速策略的相关论文
     添加到 paper_output/wsaa-benders-thesis/reference/ref.bib
```

### 场景 5：润色已有内容

```
用户：润色 paper_output/wsaa-benders-thesis/chapters/chapter01.tex
     要求：消除模糊表达，增强精确性
```

---

## 核心原则

### 1. 绝不编造参考文献

| 操作       | ✅ 正确                   | ❌ 错误      |
| ---------- | ------------------------- | ------------ |
| 添加引用   | 搜索验证 → 获取 BibTeX   | 凭记忆写     |
| 不确定文献 | 标记 `[待验证]`         | 编造相似文献 |
| 找不到原文 | 注明 `TODO: 需人工核实` | 捏造论文     |

### 2. 主动交付初稿

- **高置信度**：直接生成完整初稿
- **中置信度**：生成初稿并标记不确定处
- **低置信度**：问 1-2 个关键问题，然后撰写

### 3. 叙事原则

论文不是实验堆砌，而是一个有明确贡献的技术故事：

| 支柱               | 说明             |
| ------------------ | ---------------- |
| **是什么**   | 1-3 个具体创新点 |
| **为什么**   | 严谨实验证据支持 |
| **有何意义** | 与实际问题的联系 |

### 4. 职责分离

| 目录               | 用途                     | 操作权限                         |
| ------------------ | ------------------------ | -------------------------------- |
| `thesis-writer/` | Skill 代码和写作指南     | **只读**，不修改           |
| `templates/`     | 存放原始 LaTeX 模板      | **只读**，不修改           |
| `examples/`      | 存放参考稿件、笔记、结果 | **只读**，供 AI 参考       |
| `paper_output/`  | 生成的论文项目           | **写入**，所有撰写在此进行 |

---

## 写作指南

详细的写作指南请参考 Skill 内 `references/` 目录下的文件：

| 文件                                                           | 内容               | 依据标准                       |
| -------------------------------------------------------------- | ------------------ | ------------------------------ |
| [writing-guide.md](references/writing-guide.md)                   | 写作哲学与最佳实践 | Neel Nanda, Karpathy 等        |
| [chinese-academic-style.md](references/chinese-academic-style.md) | 中文学术写作规范   | GB/T 7714-2015, GB/T 6447-1986 |
| [checklist.md](references/checklist.md)                           | 论文提交前检查清单 | 各高校毕业论文管理办法         |

### 摘要公式（5 句）

1. 你做了什么："本文提出/设计/构建了..."
2. 为什么这个问题重要且困难
3. 你如何做（含专业关键词）
4. 你有什么证据
5. 你最突出的数据/结果

### 常见错误

| 错误         | 解决方案                   |
| ------------ | -------------------------- |
| 摘要空洞开头 | 以具体贡献开头             |
| 术语不一致   | 每个概念选择一个术语并坚持 |
| 逐篇罗列文献 | 按主题组织                 |
| 模糊表达     | 使用具体数据替代           |

---

## 符号规范

运筹学与物流工程领域**没有严格的统一符号标准**。Skill 中提供了国际经典教材（Daskin、Snyder）和国内权威教材（胡运权《运筹学》）中广泛使用的符号惯例作为参考。

**重要原则**：

1. 全文符号一致性
2. 首次使用时明确定义
3. 建议在论文开头或附录提供符号说明表
4. 如果用户已定义符号体系，严格遵循用户的定义

---

## 参考文献规范

> 依据：GB/T 7714-2015《信息与文献 参考文献著录规则》

### 基本要求

- 国内论文普遍采用**顺序编码制**
- 正文中按引用先后顺序用方括号标注序号，如 [1]、[2-4]
- 文后参考文献表按序号排列

### 数量要求

| 类型         | 最低要求         |
| ------------ | ---------------- |
| 参考文献总数 | 一般不少于 10 篇 |
| 学术期刊     | 不少于 5 篇      |
| 外文文献     | 不少于 2 篇      |

---

## 常见问题

### Q: 如何添加新模板？

A: 在项目根目录的 `templates/` 下创建新子目录，放入完整的 LaTeX 模板文件即可。

### Q: 可以在多个项目中使用同一个 Skill 吗？

A: 可以。Skill 安装在每个项目的 `.agents/skills/` 或 `.claude/skills/` 目录下，各项目的 Skill 独立。

### Q: 支持哪些 LaTeX 发行版？

A: 支持 TeX Live、MiKTeX、MacTeX 等主流发行版。

### Q: 如何处理中文编码？

A: 模板应使用 UTF-8 编码，配合 `xeCJK` 宏包处理中文。

### Q: 参考文献格式如何适配？

A: Skill 默认使用 GB/T 7714-2015 格式。如需其他格式，修改模板的 `.bst` 文件。

---

## 贡献指南

欢迎提交 Issue 和 Pull Request！

### 提交 Bug

请提供：

- 问题描述
- 复现步骤
- 预期行为
- 实际行为

### 功能建议

请说明：

- 功能描述
- 使用场景
- 预期效果

### 代码规范

- 遵循现有代码风格
- 添加必要的注释
- 更新相关文档

---

## 许可证

本项目采用 [MIT License](LICENSE) 开源。

---

## 致谢

本 Skill 的写作哲学综合了以下来源：

| 来源                           | 贡献                            |
| ------------------------------ | ------------------------------- |
| Neel Nanda (Google DeepMind)   | 叙事原则、What/Why/So What 框架 |
| Sebastian Farquhar (DeepMind)  | 5 句摘要公式                    |
| Gopen & Swan                   | 读者期望 7 原则                 |
| Zachary Lipton                 | 措辞选择、消除模糊              |
| Jacob Steinhardt (UC Berkeley) | 精确性、术语一致性              |

本 Skill 的中文写作规范参考了以下标准：

| 标准                   | 说明                            |
| ---------------------- | ------------------------------- |
| GB/T 7714-2015         | 《信息与文献 参考文献著录规则》 |
| GB/T 6447-1986         | 《文摘编写规则》                |
| 各高校毕业论文管理办法 | 武汉大学、深圳大学等            |

---

## Star History

如果这个工具对你有帮助，欢迎 Star 支持开发！

[![Star History Chart](https://api.star-history.com/svg?repos=onetutuneo/graduation-paper-writing-skill&type=Date)](https://star-history.com/#onetutuneo/graduation-paper-writing-skill&Date)
