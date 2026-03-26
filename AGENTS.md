# 🧠 Researcher Agents System

> **Version**: 2.0.0  
> **Architecture**: Orchestrator-Worker + Hierarchical (inspired by Anthropic Research, Google ADK)  
> **Created**: 2026-03-26  
> **Last Updated**: 2026-03-26 (Context Engineering Audit v1)

---

## 🎯 Mục đích
Hệ thống multi-agent chuyên nghiên cứu chuyên sâu (Deep Research).
Mỗi agent con là một chuyên gia độc lập với memory, learning, và knowledge output riêng.

## 🏗️ Kiến trúc tổng quan

```
User Request → Orchestrator → Spawn/Activate Agent → Context Checkpoint → Research → Quality Gate → Package Knowledge
```

### ⚡ Background Execution (Spawning)
Hệ thống hỗ trợ cơ chế "giao việc và quên" (Assign and Forget):
1. **Lệnh**: Sử dụng script `scripts/spawn-agent.sh {topic}`.
2. **Cơ chế**: Orchestrator khởi tạo một instance CLI mới chạy trong tab/tiến trình riêng.
3. **Ưu điểm**: Xử lý đa nhiệm, không chiếm dụng phiên chat hiện tại.
4. **Theo dõi**: Kiểm tra `orchestrator/log.md` hoặc các file memory của agent tương ứng.

### Thành phần chính:
1. **Orchestrator** (`orchestrator/`): Điều phối, phân tích yêu cầu, tạo/kích hoạt agent
   - `AGENT.md` — Orchestrator prompt & decision framework
   - `log.md` — Structured log (có META tags cho machine parsing)
   - `QUALITY_RUBRIC.md` — Tiêu chuẩn chất lượng nghiên cứu
   - `CROSS_AGENT_PROTOCOL.md` — Quy trình phối hợp multi-agent
2. **Research Agents** (`agents/{topic}/`): Agent chuyên biệt cho từng chủ đề
3. **Knowledge Base** (`knowledge-base/`): Tri thức đã đóng gói (**canonical/published**)
   - `knowledge-base/{topic}/` — Per-topic published knowledge
   - `knowledge-base/cross-topic/` — Cross-agent synthesis
4. **Templates** (`templates/`): Mẫu để tạo agent mới nhanh chóng

## 📋 Quy trình hoạt động

### Kích hoạt Research Agent:
1. User yêu cầu nghiên cứu topic X
2. Orchestrator kiểm tra agent X đã tồn tại chưa
3. Nếu chưa → tạo agent mới từ template + **validate templates** (no unreplaced placeholders)
4. **Load context via CONTEXT_MANIFEST.md** (lazy loading — đọc 1KB manifest trước)
5. **Context Checkpoint** — verify agent đã hiểu đúng context, xác định EXTEND/DEEPEN/VERIFY/FRESH
6. Agent tiến hành nghiên cứu:
   - Thu thập dữ liệu (web search, docs, APIs)
   - Ghi nhận vào episodic memory
   - Tổng hợp vào semantic memory
   - Rút ra learnings
7. **Quality Gate** — đánh giá theo `QUALITY_RUBRIC.md` trước khi package
8. Đóng gói tri thức: Draft → `research/knowledge/` → Published → `knowledge-base/{topic}/`
9. **Integrity Check** — verify INDEX, file counts, cross-references
10. **Regenerate CONTEXT_MANIFEST.md** cho session tiếp theo
11. Cập nhật agent memory + config cho lần nghiên cứu tiếp

### Agent Memory System:
| Layer | File | Mô tả | Limits |
|-------|------|--------|--------|
| Episodic | `memory/episodic.md` | Log từng phiên nghiên cứu | Max 5 sessions (cũ → archive) |
| Episodic Archive | `memory/episodic-archive.md` | Sessions cũ, compressed | 1 dòng summary/session |
| Semantic | `memory/semantic.md` | Facts & knowledge tích lũy | Max 200 lines |
| Learnings | `memory/learnings.md` | Meta-learnings, patterns, insights | Max 100 lines |
| **Context Manifest** | `CONTEXT_MANIFEST.md` | **Compressed overview (~1KB)** | Auto-regenerated |

### Knowledge Flow (Draft → Published):
```
Agent Research
    ↓
research/knowledge/{date}-{topic}.md  ← DRAFT (snapshot gốc, không sửa)
    ↓
knowledge-base/{topic}/{date}-{topic}.md  ← PUBLISHED (canonical, sửa tại đây)
    ↓
knowledge-base/INDEX.md  ← Updated
```

### Cross-Agent Research:
Xem chi tiết tại `orchestrator/CROSS_AGENT_PROTOCOL.md`

## 🔧 Conventions

- Agent slug: `kebab-case` (e.g., `veo-3`, `quantum-computing`)
- Tất cả output dùng Markdown
- Knowledge packages luôn có metadata (date, sources, confidence)
- Agent prompt trong `AGENT.md` — KHÔNG chỉnh sửa runtime
- Memory files được append-only (chỉ thêm, không xóa) với **size limits**
- Template validation: grep `{{.*}}` → 0 matches trước khi finalize
- Orchestrator log: mỗi entry có `<!-- META: ... -->` tag
- Agent lifecycle: `active` → `paused` → `archived` → `merged`
- Config `research_history` phải được cập nhật sau mỗi session

## 📏 Quality Standards

Xem chi tiết tại `orchestrator/QUALITY_RUBRIC.md`

**Quick reference**:
- **High confidence**: ≥3 sources, ≥1 Tier 1, <1 week old
- **Medium confidence**: 2 sources, Tier 2/3, 1-4 weeks old
- **Low confidence**: <2 sources, >1 month old

## 🎨 User Preferences
- Ngôn ngữ giao tiếp: Tiếng Việt
- Code/Technical terms: giữ nguyên tiếng Anh
- Output style: structured, chi tiết, có sources
