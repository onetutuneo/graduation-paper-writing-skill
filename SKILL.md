---
name: "thesis-writer"
description: "Write graduation thesis for Chinese universities in transportation, logistics, location-allocation, operations research, and machine learning domains. Invoke when user asks to write, draft, revise, or format Chinese graduation thesis with LaTeX template."
version: "1.0.0"
author: "Custom"
license: "MIT"
tags: "Academic Writing Chinese Thesis LaTeX Graduation Transportation Logistics Operations Research Benders Decomposition Location-Allocation"
---

# 中文毕业论文写作助手（交通运输与运筹学领域）

Expert-level guidance for writing graduation thesis targeting Chinese universities in the domains of **transportation engineering, logistics, location-allocation problems, operations research, and machine learning applications**. This skill combines writing philosophy from leading researchers with practical tools: LaTeX template integration, citation verification, and university formatting checklists.

## 核心哲学：协作式写作

[](#core-philosophy-collaborative-writing)

**论文写作是协作过程，但 AI 应主动交付初稿。**

典型工作流从用户提供的研究材料开始：代码、实验结果、已有稿件、数据文件。AI 的角色是：

1. **理解项目**：探索代码库、结果、已有文档
2. **交付完整初稿**：当对贡献有足够信心时
3. **搜索文献**：使用网络搜索和 API 查找相关引用
4. **迭代修改**：根据用户反馈 refine
5. **仅在真正不确定时才提问**

**核心原则**：主动交付。如果项目和结果清晰，直接交付完整初稿。不要每步都等确认——用户很忙。先给出具体可修改的草稿，然后根据反馈迭代。

---

## 目录结构与工作流规范

[](#directory-structure-and-workflow)

### Skill 内部结构

本 Skill 仅包含核心代码和写作参考文档：

```
thesis-writer/                          # Skill 目录（只读）
├── SKILL.md                            # 本文件（核心指令）
└── references/                         # 写作参考文档
    ├── checklist.md                    # 论文提交前检查清单
    ├── writing-guide.md                # 写作哲学与最佳实践
    └── chinese-academic-style.md       # 中文学术写作规范（GB/T 7714-2015）
```

### 用户项目目录结构

用户在自己的项目目录下创建以下目录（**与 Skill 分离**）：

```
my-thesis-project/                      # 用户项目根目录
├── .agents/
│   └── skills/
│       └── thesis-writer/              # ← Skill 代码（只读，不修改）
│           ├── SKILL.md
│           └── references/
├── templates/                          # ← 用户创建：LaTeX 模板目录
│   └── <template-name>/                #   每个模板一个子目录
│       ├── Thesis.tex
│       ├── *.cls
│       ├── *.bst
│       ├── chapters/
│       ├── reference/
│       │   └── ref.bib
│       └── figures/
├── examples/                           # ← 用户创建：参考稿件目录
│   └── <example-name>/                 #   每个示例一个子目录
│       ├── draft.tex                   #   已有稿件
│       ├── notes.md                    #   研究笔记
│       └── results/                    #   实验结果
└── paper_output/                       # ← AI 输出：论文项目目录
    └── <thesis-name>/                  #   每篇论文一个子目录
        ├── Thesis.tex
        ├── chapters/                   #   AI 生成的章节
        └── reference/
            └── ref.bib                 #   AI 添加的参考文献
```

### 核心原则

| 目录 | 位置 | 用途 | 操作 |
|------|------|------|------|
| `thesis-writer/` | `.agents/skills/` | Skill 代码和写作指南 | **只读**，不修改 |
| `templates/` | 用户项目根目录 | 存放原始 LaTeX 模板 | **只读**，不修改 |
| `examples/` | 用户项目根目录 | 存放参考稿件、笔记、结果 | **只读**，供 AI 参考 |
| `paper_output/` | 用户项目根目录 | 生成的论文项目 | **写入**，所有撰写在此进行 |

### 工作流

```
1. 用户安装 Skill 到 .agents/skills/thesis-writer/
2. 用户在项目根目录创建 templates/、examples/、paper_output/ 目录
3. 用户将 LaTeX 模板放入 templates/<template-name>/
4. 用户将参考材料放入 examples/<example-name>/（可选）
5. AI 从 templates/ 复制到 paper_output/<thesis-name>/
6. AI 在 paper_output/<thesis-name>/ 中撰写论文
7. 用户审核 paper_output/ 中的内容
8. 用户在 paper_output/ 目录中编译生成 PDF
```

### 快速初始化

用户可运行以下命令初始化项目结构：

```bash
# 在项目根目录执行
mkdir -p templates examples output
```

**重要**：
- Skill 代码（`thesis-writer/`）与用户数据（`templates/`、`examples/`、`paper_output/`）完全分离
- 永远不要直接修改 `templates/` 中的原始模板文件
- 所有撰写和修改都在 `paper_output/` 目录中进行
- 一个 Skill 可服务多个论文项目，只需在不同项目目录下使用即可

---

## ⚠️ 关键原则：绝不编造参考文献

[](#️-critical-never-hallucinate-citations)

**这是 AI 辅助学术写作的第一原则。**

### 问题

[](#the-problem)

AI 生成的引用有 **约 40% 的错误率**。编造的参考文献（不存在的论文、错误作者、错误年份、伪造 DOI）是严重的学术不端行为，可能导致论文被拒或撤销。

### 规则

[](#the-rule)

**绝不允许凭记忆生成参考文献。必须通过搜索验证。**

| 操作 | ✅ 正确 | ❌ 错误 |
|------|--------|--------|
| 添加引用 | 搜索 → 验证 → 获取 BibTeX | 凭记忆写 BibTeX |
| 不确定某文献 | 标记 `[待验证]` | 猜测参考文献 |
| 找不到原文 | 注明 `TODO: 需人工核实` | 捏造相似文献 |

### 无法验证引用时

[](#when-you-cant-verify-a-citation)

如果无法通过程序验证引用，你必须：

```latex
% 明确标记 - 需要人工验证
\cite{PLACEHOLDER_作者2024_待验证}  % TODO: 验证此文献是否存在
```

**必须告知用户**："我已标记 [X] 条引用为待验证状态，无法确认这些论文是否存在。"

### 推荐：学术文献搜索方法

[](#recommended-academic-search)

使用网络搜索进行学术文献检索：

```
搜索策略：
- "[主要技术] + [应用领域]"
- "[基线方法] 对比"
- "[问题名称] 研究现状"
- 现有引用中的作者名
```

然后通过语义学术搜索或 DOI 验证并获取 BibTeX。

---

## 工作流 0：从研究材料开始

[](#workflow-0-starting-from-research-materials)

开始论文写作时，首先理解项目：

```
项目理解清单：
- [ ] 步骤 1：探索项目结构
- [ ] 步骤 2：阅读已有文档、说明和关键结果
- [ ] 步骤 3：与用户确认主要贡献
- [ ] 步骤 4：查找代码库中已引用的文献
- [ ] 步骤 5：搜索补充相关文献
- [ ] 步骤 6：共同确定论文结构
- [ ] 步骤 7：迭代撰写各章节
```

**步骤 1：探索项目结构**

```bash
# 理解项目结构
ls -la
find . -name "*.py" | head -20
find . -name "*.md" -o -name "*.txt" -o -name "*.docx" | xargs grep -l -i "result\|conclusion\|finding\|结果\|结论"
```

查找：

- `README.md`、`建模说明指南.md` — 项目概述和声明
- `results/`、`outputs/`、`experiments/` — 关键发现
- `configs/` — 实验设置
- 现有 `.bib` 文件或引用
- 任何草稿或笔记（`.docx`、`.md`）

**步骤 2：识别已有引用**

检查代码库中已引用的论文：

```bash
# 查找已有引用
grep -r "arxiv\|doi\|cite\|参考文献" --include="*.md" --include="*.bib" --include="*.py" --include="*.tex"
find . -name "*.bib"
```

这些是 Related Work 的高信号起点——用户已认为它们相关。

**步骤 3：明确贡献**

在撰写之前，明确与用户确认：

> "根据我对项目的理解，主要贡献似乎是 [X]。关键结果显示 [Y]。这是你想要的论文框架吗，还是应该强调不同方面？"

**绝不假设叙事——始终与用户验证。**

**步骤 4：搜索补充文献**

使用网络搜索查找相关论文：

```
搜索查询示例：
- "[主要技术] + [应用领域]"
- "[基线方法] 对比"
- "[问题名称] 研究现状/最新进展"
- 现有引用中的作者名
```

然后使用下面的引用工作流验证并获取 BibTeX。

**步骤 5：交付初稿**

**主动交付——交付完整初稿而非逐节请求许可。**

如果项目提供清晰结果且贡献明确：

1. 从头到尾撰写完整初稿
2. 提交完整草稿供反馈
3. 根据用户回复迭代

如果确实不确定框架或主要声明：

1. 自信地撰写你能写的部分
2. 标记具体不确定处："我将 X 框架为主要贡献——如果你更想强调 Y 请告诉我"
3. 继续撰写而非阻塞

**随草稿提出的问题**（而非之前）：

- "我将 X 作为主要贡献——如需调整请告知"
- "我突出了结果 A、B、C——如果有其他更重要的请告诉我"
- "文献综述包含 [论文]——如有遗漏请补充"

---

## 何时使用本 Skill

[](#when-to-use-this-skill)

当以下情况时使用：

- **从研究材料开始**撰写论文
- **起草或修改**特定章节
- **查找和验证**文献综述的引用
- **按照 LaTeX 模板格式化**论文
- **迭代修改**草稿
- **润色**已有稿件

**始终记住**：初稿是讨论的起点，不是最终输出。

---

## 平衡主动性与协作

[](#balancing-proactivity-and-collaboration)

**默认行为：主动交付初稿，然后迭代。**

| 置信度 | 行为 |
|--------|------|
| **高**（项目清晰、贡献明确） | 撰写完整初稿，交付，根据反馈迭代 |
| **中**（部分模糊） | 撰写初稿并标记不确定处，继续 |
| **低**（重大未知） | 问 1-2 个针对性问题，然后撰写 |

**先写草稿，随草稿提问**（而非之前）：

| 章节 | 可自主撰写 | 随草稿标记 |
|------|-----------|-----------|
| 摘要 | 是 | "贡献框架为 X——如需调整请告知" |
| 引言 | 是 | "强调问题 Y——如有误请纠正" |
| 模型/方法 | 是 | "包含细节 A、B、C——补充缺失部分" |
| 实验 | 是 | "突出结果 1、2、3——如需重排请告知" |
| 文献综述 | 是 | "引用论文 X、Y、Z——补充遗漏" |

**仅在以下情况阻塞等待输入：**

- 论文题目或研究方向不明确
- 多个相互矛盾的框架似乎同等有效
- 结果看起来不完整或不一致
- 用户明确要求先审核再继续

**不要因以下原因阻塞：**

- 措辞选择
- 章节排序
- 展示哪些具体结果（做选择，标记它）
- 引用完整性（用你找到的撰写，标记缺口）

---

## 叙事原则

[](#the-narrative-principle)

**最关键的洞察**：你的论文不是实验的堆砌——而是一个有明确贡献支撑的技术故事。

每篇成功的运筹学/物流工程论文都围绕一个核心叙事：一个简短、严谨、有证据支持的技术故事，带有读者关心的结论。

**三大支柱（必须在引言结尾清晰表达）：**

| 支柱 | 说明 | 示例 |
|------|------|------|
| **是什么** | 1-3 个具体创新点，围绕统一主题 | "提出改进的 Benders 分解算法，在大规模 WSAA 问题上加速 X 倍" |
| **为什么** | 支持声明的严谨实验证据 | 强基线对比、区分假设的实验 |
| **有何意义** | 为什么读者应该关心 | 与实际物流/选址问题的联系 |

**如果你不能用一句话陈述你的贡献，你就还没有一篇论文。**

---

## 论文结构工作流

[](#paper-structure-workflow)

### 工作流 1：撰写完整论文（迭代式）

[](#workflow-1-writing-complete-paper-iterative)

复制此清单并跟踪进度。**每步涉及：初稿 → 反馈 → 修改：**

```
论文撰写进度：
- [ ] 步骤 1：确定一句话贡献（与用户确认）
- [ ] 步骤 2：绘制核心图表 → 获取反馈 → 修改
- [ ] 步骤 3：撰写摘要 → 获取反馈 → 修改
- [ ] 步骤 4：撰写引言 → 获取反馈 → 修改
- [ ] 步骤 5：撰写文献综述 → 获取反馈 → 修改
- [ ] 步骤 6：撰写问题描述与模型 → 获取反馈 → 修改
- [ ] 步骤 7：撰写算法设计 → 获取反馈 → 修改
- [ ] 步骤 8：撰写实验分析 → 获取反馈 → 修改
- [ ] 步骤 9：撰写结论与展望 → 获取反馈 → 修改
- [ ] 步骤 10：完成论文检查清单（必须）
- [ ] 步骤 11：最终审查和提交
```

**步骤 1：确定一句话贡献**

**此步骤需要用户的明确确认。**

在撰写任何内容之前，明确表达并验证：

- 你的论文贡献的唯一核心是什么？
- 在你的工作之前，什么是不明显或不存在的？

> "我建议将贡献框架为：'[一句话]'。这抓住了你看到的主要结论吗？我们应该调整重点吗？"

**步骤 2：绘制核心图表**

核心图表（通常是算法流程图或主要结果对比图）值得特别关注——许多读者直接跳到它。

- 传达核心思想、方法或最令人信服的结果
- 使用矢量图形（PDF/EPS 用于图表）
- 编写可独立理解的图注
- 确保黑白可读（8% 男性有色觉缺陷）

**步骤 3：撰写摘要（5 句公式）**

改编自 Sebastian Farquhar 的公式：

```
1. 你做了什么："本文提出/设计/构建了..."
2. 为什么这个问题重要且困难
3. 你如何做（包含专业关键词以便检索）
4. 你有什么证据
5. 你最突出的数据/结果
```

**删除**空洞开头如"随着经济发展，物流行业..."

**示例（好的摘要）：**

```
本文针对带随机需求的选址-路径问题（WSAA），提出一种改进的
Benders 分解算法。[做了什么]
传统 Benders 分解在处理大规模随机场景时收敛缓慢，
限制了其在实际物流规划中的应用。[为什么困难且重要]
本文引入懒约束生成、并行子问题求解和 Pareto 最优割平面
三种加速策略，显著提升算法收敛速度。[如何做，含关键词]
通过在多组标准测试集上的实验验证，[证据]
改进算法相比传统方法平均加速 3.2 倍，
最大实例规模达到 50 个候选设施、200 个客户点。[最突出结果]
```

**步骤 4：撰写引言（1-1.5 页）**

必须包含：

- 2-4 条贡献列表（每条 1-2 行）
- 清晰的问题陈述
- 方法概述
- 模型/方法部分应在第 2-3 页开始

**步骤 5：文献综述**

按主题组织，不要逐篇罗列：

**好：** "一类研究基于 Floogledoodle 假设 [引用]，而本文采用 Doobersnoddle 假设，原因是..."

**差：** "Snap 等人引入了 X，而 Crackle 等人引入了 Y。"

广泛引用——评审老师可能撰写过相关论文。

**步骤 6：问题描述与模型构建**

- 问题定义和假设
- 符号说明（使用统一符号表）
- 数学模型（目标函数、约束条件）
- 模型复杂度分析

**步骤 7：算法设计**

- 算法原理
- 加速策略（懒约束、并行、Pareto cut 等）
- 算法流程（使用 algorithm 环境）
- 收敛性分析

**步骤 8：实验分析**

对每个实验，明确说明：

- 它支持什么声明
- 如何与主要贡献关联
- 实验设置（细节可放附录）
- 观察什么："蓝色曲线显示 X，这表明 Y"

要求：

- 误差棒及方法说明（标准差 vs 标准误）
- 参数搜索范围
- 计算环境（CPU 类型、内存、求解器版本）
- 随机种子设置方法

**步骤 9：结论与展望**

- 总结主要贡献
- 指出研究局限
- 提出未来研究方向

**步骤 10：论文检查清单**

见 [references/checklist.md](references/checklist.md)。

---

## 中文学术写作哲学

[](#writing-philosophy-for-chinese-thesis)

**本节提炼了中文毕业论文写作的核心原则。** 这些不是可选的风格建议——而是区分优秀论文与普通论文的关键。

> "论文是一个简短、严谨、有证据支持的技术故事，带有读者关心的结论。" — 改编自 Neel Nanda

### 写作原则来源

[](#sources-behind-guidance)

本 skill 综合了以下来源的写作指导：

| 来源 | 核心贡献 | 适用性 |
|------|---------|--------|
| **Neel Nanda** (Google DeepMind) | 叙事原则、What/Why/So What 框架 | 通用学术写作 |
| **Sebastian Farquhar** (DeepMind) | 5 句摘要公式 | 中英文通用 |
| **Gopen & Swan** | 读者期望 7 原则 | 中英文通用 |
| **Zachary Lipton** | 措辞选择、消除模糊 | 需适配中文 |
| **Jacob Steinhardt** (UC Berkeley) | 精确性、术语一致性 | 通用学术写作 |
| **中国学术写作规范** | 中文论文格式、GB/T 7714 | 中文特有 |

**深入阅读：**

- [references/writing-guide.md](references/writing-guide.md) — 完整解释与示例
- [references/chinese-academic-style.md](references/chinese-academic-style.md) — 中文学术写作规范

### 时间分配

[](#time-allocation)

大约**同等时间**投入：

1. 摘要
2. 引言
3. 图表
4. 其余所有内容

**为什么？** 大多数评审在到达方法部分之前就已形成初步判断。读者接触论文的顺序：**标题 → 摘要 → 引言 → 图表 → 可能看其余部分。**

### 中文写作风格指南

[](#chinese-writing-style-guidelines)

#### 句子级清晰度（Gopen & Swan 7 原则的中文适配）

[](#sentence-level-clarity-chinese)

这些原则基于读者实际处理文字的方式。违反它们会迫使读者将认知精力花在结构上而非内容上。

| 原则 | 规则 | 示例 |
|------|------|------|
| **主谓邻近** | 主语和谓语保持接近 | 弱："该模型，在经过大量数据训练和参数调优后，取得了良好效果" → 强："该模型取得了良好效果，经过大量数据训练和参数调优" |
| **强调位置（最后最重要）** | 读者自然强调句末信息 | 弱："使用 Benders 分解后精度提升 15%" → 强："使用 Benders 分解后，求解时间**缩短 15%**" |
| **主题位置（先说背景）** | 句首建立视角 | 弱："一种新的割平面生成方法被提出" → 强："针对收敛缓慢问题，本文提出一种新的割平面生成方法" |
| **旧信息先于新信息** | 熟悉 → 陌生 | 弱："稀疏割平面由 Magnanti 等人提出。标准 Benders 分解的二次复杂度促使了这项工作。" → 强："标准 Benders 分解存在收敛缓慢问题。为此，Magnanti 等人提出了稀疏割平面方法。" |
| **一个单位一个功能** | 每段一个观点 | 如有两点，用两段 |
| **动词表达动作** | 用动词而非名词化 | 弱："我们对结果进行了分析" → 强："我们分析了结果" |
| **背景先于新信息** | 先解释再呈现 | 弱："公式 3 表明当学习率满足...时收敛有保证" → 强："为保证收敛性，学习率须满足公式 3 的条件..." |

#### 中文学术用语规范

[](#chinese-academic-language)

**术语一致性**：同一概念全文使用同一术语。

| 不推荐 | 推荐 |
|--------|------|
| 模型/网络/架构混用 | 统一使用"模型"或"算法" |
| 训练/学习/优化混用 | 统一使用"求解"或"训练" |
| 样本/例子/实例混用 | 统一使用"算例"或"场景" |

**避免的词汇**：

- 删除"实际上"、"有点"、"基本上"、"本质上"
- 删除"非常"、"极其"、"高度"（除非统计意义）
- 这些词暗示不自信，而非强度

**精确性优于简洁性**：

| 模糊 | 精确 |
|------|------|
| 性能提升 | 求解时间缩短 32% |
| 大规模 | 50 个候选设施、200 个客户点 |
| 效果良好 | Gap 在 50 次迭代内降至 1% 以下 |
| 快速收敛 | 平均 35 次迭代收敛 |

**避免暗示增量工作的词汇**：

- 避免："结合"、"修改"、"扩展"
- 使用："提出"、"设计"、"构建"、"引入"

**为什么**："我们结合了 X 和 Y"听起来像是把两个已有想法拼凑在一起。"我们提出一种利用 X 解决 Y 的方法"听起来是真正的贡献。

#### 代词管理

[](#pronoun-management-chinese)

**减少代词使用**（"这"、"它"、"这些"）。当代词必要时，与名词连用：

弱："这表明模型收敛。"
强："这一结果表明模型收敛。"

弱："它提高了性能。"
强："该改进提高了求解性能。"

#### 段落架构

[](#paragraph-architecture-chinese)

- **首句**：明确陈述观点
- **中间句**：用证据支持
- **末句**：强化或过渡

不要把关键信息埋在段落中间。

---

## 数学写作规范

[](#mathematical-writing)

### 通用原则

[](#math-general-principles)

1. **在定理之前正式声明所有假设**
2. **在证明旁边提供直观解释**
3. **全文使用一致的符号**
4. **首次使用时定义符号**

### 符号约定

[](#notation-conventions)

```latex
% 标量：小写斜体
$x$, $y$, $\alpha$, $\beta$
% 向量：小写粗体
$\mathbf{x}$, $\mathbf{v}$
% 矩阵：大写粗体
$\mathbf{W}$, $\mathbf{X}$
% 集合：大写花体
$\mathcal{X}$, $\mathcal{D}$
% 函数：命名函数用正体
$\mathrm{softmax}$, $\mathrm{ReLU}$
```

### 运筹学/物流领域常见符号惯例

[](#or-logistics-notation)

> **说明**：运筹学与物流工程领域**没有严格的统一符号标准**。以下符号为国际经典教材（如 Daskin《Network and Discrete Location》、Snyder 设施选址讲义）及国内权威教材（胡运权《运筹学》）中**广泛使用的惯例**，仅供参考。实际写作中**应以用户具体模型定义为准**，并在论文中首次使用时明确定义所有符号。

#### 集合与索引

| 符号 | 含义 | 常见来源 |
|------|------|---------|
| $I$ 或 $N$ | 客户/需求点集合 | Snyder, Daskin |
| $J$ 或 $M$ | 候选设施/选址点集合 | Snyder, Daskin |
| $S$ | 场景集合（随机规划） | 随机规划文献 |
| $K$ | 车辆/路径集合（VRP） | VRP 文献 |
| $T$ | 时间段集合（多周期） | 动态规划文献 |
| $i, j, k$ | 索引变量 | 通用 |

#### 参数

| 符号 | 含义 | 常见来源 |
|------|------|---------|
| $d_i$ 或 $h_i$ | 客户 $i$ 的需求量 | Daskin ($h_i$), 国内教材 ($d_i$) |
| $f_j$ 或 $F_j$ | 设施 $j$ 的固定建设/运营成本 | Snyder, Daskin |
| $c_{ij}$ | 从设施 $j$ 到客户 $i$ 的单位运输成本 | 通用 |
| $p_s$ | 场景 $s$ 的发生概率 | 随机规划文献 |
| $D_{ij}$ | 节点 $i$ 到 $j$ 的距离 | 网络优化文献 |
| $Q$ | 车辆容量（VRP） | VRP 文献 |
| $C_j$ | 设施 $j$ 的容量 |  Capacitated FLP |

#### 决策变量

| 符号 | 含义 | 常见来源 |
|------|------|---------|
| $x_j \in \{0,1\}$ | 是否在 $j$ 建设设施 | 通用 |
| $y_{ij} \in \{0,1\}$ 或 $\geq 0$ | 设施 $j$ 是否服务客户 $i$（或服务量） | 通用 |
| $z_{ijs}$ | 场景 $s$ 下的分配变量 | 两阶段随机规划 |
| $u_{ij}$ | 弧 $(i,j)$ 上的流量 | 网络流问题 |

#### 线性规划通用符号（参考胡运权《运筹学》）

| 符号 | 含义 |
|------|------|
| $x_j$ | 决策变量 |
| $c_j$ | 价值系数（目标函数系数） |
| $a_{ij}$ | 技术系数（约束矩阵元素） |
| $b_i$ | 右端项（资源限量） |
| $z$ 或 $Z$ | 目标函数值 |
| $\sigma_j$ 或 $c_j - z_j$ | 检验数 |

#### 重要提醒

1. **全文符号一致性**：一旦选定符号体系，全文必须保持一致
2. **首次定义原则**：每个符号在首次出现时必须明确定义
3. **符号表**：建议在论文开头或附录提供符号说明表
4. **避免混淆**：不要在同一模型中用同一符号表示不同含义
5. **用户优先**：如果用户已定义符号体系，严格遵循用户的定义

---

## 图表设计

[](#figure-design)

### 设计原则

[](#figure-design-principles)

1. **核心图表至关重要**：通常是读者在摘要之后首先查看的内容
2. **自包含图注**：读者应无需正文即可理解图表
3. **矢量图形**：PDF/EPS 用于图表，PNG（600 DPI）仅用于照片
4. **图表编号**：按"图 X-X"、"表 X-X"格式（章-序号）

### 可访问性要求

[](#accessibility-requirements)

8% 的男性有色觉缺陷。你的图表必须对他们有效。

**解决方案**：

- 使用色盲安全调色板：Okabe-Ito 或 Paul Tol
- 避免红绿组合
- 验证图表在灰度下有效
- 除颜色外使用不同线型（实线、虚线、点线）

### 工具

[](#figure-tools)

```python
# SciencePlots：出版级样式
import matplotlib.pyplot as plt
plt.style.use(['science', 'ieee'])

# 或使用 seaborn
import seaborn as sns
sns.set_theme(style="whitegrid", font="SimSun")  # 宋体
```

---

## LaTeX 模板集成

[](#latex-template-integration)

### 模板存放规范

模板存放在用户项目根目录下的 `templates/` 目录，每个模板一个子目录：

```
用户项目根目录/
└── templates/
    └── <template-name>/              # 模板名称（如 my-thesis）
        ├── Thesis.tex                # 主文档
        ├── *.cls                     # 文档类定义
        ├── *.bst                     # 参考文献样式
        ├── chapters/                 # 各章节文件
        │   ├── abstract.tex          # 中文摘要
        │   ├── englishabstract.tex   # 英文摘要
        │   ├── chapter01.tex         # 第一章
        │   ├── ...
        │   └── appendix.tex          # 附录
        ├── reference/
        │   └── ref.bib               # 参考文献数据库
        └── figures/                  # 图表目录
```

### 输出目录规范

论文输出到用户项目根目录下的 `paper_output/` 目录，每篇论文一个子目录：

```
paper_output/
└── <thesis-name>/                # 论文名称（如 wsaa-benders-thesis）
    ├── Thesis.tex                # 主文档（从模板复制）
    ├── *.cls                     # 从模板复制
    ├── *.bst                     # 从模板复制
    ├── chapters/                 # AI 撰写的章节
    │   ├── abstract.tex
    │   ├── englishabstract.tex
    │   ├── chapter01.tex         ← AI 生成
    │   ├── chapter02.tex         ← AI 生成
    │   └── ...
    ├── reference/
    │   └── ref.bib               ← AI 添加参考文献
    └── figures/                  # 图表
```

**工作流程**：
1. 从 `templates/<template-name>/` 复制所有文件到 `paper_output/<thesis-name>/`
2. 在 `paper_output/<thesis-name>/` 中撰写和修改
3. **永远不修改 `templates/` 中的原始文件**

### 格式要求检查

[](#format-checklist)

| 项目 | 常见要求 |
|------|---------|
| 文档类 | 使用模板提供的 `.cls` 文件 |
| 正文字号 | 通常小四号 |
| 行距 | 通常 20pt 或 1.5 倍 |
| 公式编号 | 章-序号（如 3-1） |
| 图表编号 | 章-序号（如 4-2） |
| 摘要字数 | 中文约 400 字 |
| 关键词 | 3-5 个，分号分隔 |
| 参考文献格式 | GB/T 7714 |

### 编译说明

[](#compilation-instructions)

```bash
# 标准编译流程
xelatex Thesis.tex
bibtex Thesis.aux      # 或 biber Thesis
xelatex Thesis.tex
xelatex Thesis.tex
```

---

## 参考文献管理

[](#citation-management)

### 使用 BibTeX

[](#using-bibtex)

使用 BibTeX 管理参考文献（推荐）：

- 集中管理，便于维护
- 与 LaTeX 原生集成
- 支持 GB/T 7714 格式

### 引用验证规则

[](#citation-verification-rules)

**严禁凭空生成参考文献！**

| 操作 | ✅ 正确 | ❌ 错误 |
|------|--------|--------|
| 添加引用 | 搜索验证 → 获取 BibTeX → 添加到 .bib 文件 | 凭记忆写 BibTeX |
| 不确定文献 | 标记 `[待验证]` | 编造相似文献 |
| 找不到原文 | 注明 `TODO: 需人工核实` | 捏造论文 |

### 文献搜索方法

[](#literature-search-methods)

1. 使用网络搜索查找学术文献
2. 验证文献真实性（作者、年份、期刊/会议）
3. 生成符合 GB/T 7714 格式的 BibTeX 条目
4. 添加到 `.bib` 文件

### BibTeX 格式示例

[](#bibtex-examples)

```bibtex
@article{作者姓氏+年份首字母,
  author = {作者1 and 作者2},
  title = {论文标题},
  journal = {期刊名},
  volume = {卷号},
  number = {期号},
  pages = {起始页--结束页},
  year = {年份},
  doi = {DOI号}
}

@inproceedings{作者姓氏+年份首字母,
  author = {作者1 and 作者2},
  title = {论文标题},
  booktitle = {会议名称},
  pages = {起始页--结束页},
  year = {年份}
}

@phdthesis{作者姓氏+年份首字母,
  author = {作者姓名},
  title = {论文标题},
  school = {学校名称},
  year = {年份}
}
```

---

## 常见错误避免

[](#common-mistakes-to-avoid)

### 结构错误

[](#structure-mistakes)

| 错误 | 解决方案 |
|------|---------|
| 引言过长（超过 1.5 页） | 将背景移至文献综述 |
| 方法部分埋没（第 3 页之后） | 前置贡献，精简引言 |
| 缺少贡献列表 | 添加 2-4 条具体、可验证的声明 |
| 实验无明确声明 | 说明每个实验验证什么 |

### 写作错误

[](#writing-mistakes)

| 错误 | 解决方案 |
|------|---------|
| 摘要空洞开头 | 以具体贡献开头 |
| 术语不一致 | 每个概念选择一个术语并坚持 |
| 被动语态过度使用 | 使用主动语态："本文提出"而非"被提出" |
| 处处模糊 | 除非真正不确定，否则自信表达 |

### 图表错误

[](#figure-mistakes)

| 错误 | 解决方案 |
|------|---------|
| 图表使用位图 | 使用矢量图（PDF/EPS） |
| 红绿配色方案 | 使用色盲安全调色板 |
| 图注需要正文才能理解 | 使图注自包含 |

### 引用错误

[](#citation-mistakes)

| 错误 | 解决方案 |
|------|---------|
| 逐篇罗列文献综述 | 按主题组织 |
| 遗漏相关引用 | 广泛引用相关文献 |
| AI 生成引用 | 始终通过搜索验证 |
| 引用格式不一致 | 使用 BibTeX 统一管理 |

---

## 预提交检查清单

[](#pre-submission-checklist)

提交前验证：

**叙事**：
- [ ] 能用一句话陈述贡献
- [ ] 三大支柱（是什么/为什么/有何意义）在引言中清晰
- [ ] 每个实验支持具体声明

**结构**：
- [ ] 摘要遵循 5 句公式
- [ ] 引言不超过 1.5 页
- [ ] 模型/方法在第 2-3 页开始
- [ ] 包含 2-4 条贡献列表
- [ ] 包含结论与展望章节

**写作**：
- [ ] 全文术语一致
- [ ] 无空洞开头句
- [ ] 消除不必要的模糊表达
- [ ] 所有图表有自包含图注

**技术**：
- [ ] 所有引用已验证
- [ ] LaTeX 编译无错误
- [ ] 参考文献格式符合 GB/T 7714-2015
- [ ] 图表编号正确（按章节编号）
- [ ] 公式编号正确（按章节编号）
- [ ] 符号首次出现时已定义

---

## 输出要求

[](#output-requirements)

1. 从用户项目目录 `templates/<template-name>/` 复制模板到 `paper_output/<thesis-name>/`
2. 在 `paper_output/<thesis-name>/chapters/` 中生成符合模板的 LaTeX 代码
3. 参考文献添加到 `paper_output/<thesis-name>/reference/ref.bib`
4. 提供编译说明和注意事项
5. 标记需要用户确认或补充的内容

## 注意事项

[](#notes)

1. **首次编译**可能需要安装中文字体
2. **参考文献**编译后需要运行 bibtex/biber 才能正确生成引用
3. **图表**建议使用 PDF 格式
4. **算法伪代码**使用 algorithm + algorithmic 宏包
5. 每次修改后建议完整编译两次以确保交叉引用正确
6. **永远不修改 `templates/` 中的原始文件**
7. 所有撰写和修改在 `paper_output/` 目录中进行
8. 参考文献格式遵循 GB/T 7714-2015 国家标准
