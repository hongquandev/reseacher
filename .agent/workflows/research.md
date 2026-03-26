---
description: Quy trình kích hoạt một Research Agent để nghiên cứu chuyên sâu một topic
---

# 🔬 Research Agent Activation

Workflow này hướng dẫn cách kích hoạt (hoặc tạo mới) một Research Agent để nghiên cứu chuyên sâu một chủ đề.

## Bước 1: Đọc System Context
- Đọc file `/Users/mac/AI Projects/reseacher/AGENTS.md` để nắm nguyên tắc hệ thống
- Đọc file `/Users/mac/AI Projects/reseacher/orchestrator/QUALITY_RUBRIC.md` để nắm tiêu chuẩn chất lượng

## Bước 2: Xác định Topic
- Xác nhận topic nghiên cứu từ user
- Tạo slug: `kebab-case` (VD: "Veo 3" → `veo-3`)
- Xác định research depth: `quick_scan` | `deep` | `comprehensive`

## Bước 3: Kiểm tra Agent tồn tại
- Kiểm tra thư mục `agents/{slug}/` đã tồn tại chưa
- Nếu đã tồn tại → Đọc `CONTEXT_MANIFEST.md` trước → nhảy sang Bước 5
- Nếu chưa → Bước 4

## Bước 4: Tạo Agent mới (nếu cần)
// turbo-all
1. Tạo thư mục `agents/{slug}/`
2. Copy template `AGENT.template.md` → `agents/{slug}/AGENT.md`, thay thế các placeholder:
   - `{{TOPIC_NAME}}` → tên topic
   - `{{TOPIC_SLUG}}` → slug
   - `{{CREATED_DATE}}` → ngày hiện tại (ISO format)
   - `{{LAST_ACTIVE_DATE}}` → ngày hiện tại
   - `{{KEY_AREA_1/2/3}}` → các lĩnh vực chính phù hợp
3. Copy template `config.template.json` → `agents/{slug}/config.json`, thay thế placeholder
4. Tạo memory files từ templates:
   - `agents/{slug}/memory/episodic.md`
   - `agents/{slug}/memory/semantic.md`
   - `agents/{slug}/memory/learnings.md`
5. Tạo Context Manifest từ template:
   - `agents/{slug}/CONTEXT_MANIFEST.md`
6. Tạo thư mục output: `agents/{slug}/research/raw/` và `agents/{slug}/research/knowledge/`

### Bước 4.1: Template Validation ✅
- Grep cho pattern `{{.*}}` trong TẤT CẢ generated files
- Nếu còn unreplaced placeholder → STOP và báo lỗi
- Verify checklist:
  - [ ] `AGENT.md` title chứa đúng topic name
  - [ ] `config.json` agent_id = slug
  - [ ] Memory files có đúng topic name trong header
  - [ ] `CONTEXT_MANIFEST.md` có đúng topic name

## Bước 5: Load Context (Lazy Loading Strategy)

### 5a. Đọc Context Manifest TRƯỚC
- Đọc `agents/{slug}/CONTEXT_MANIFEST.md` — file nhỏ (~1KB) chứa compressed overview
- Từ manifest, xác định:
  - Đã có bao nhiêu sessions?
  - Key areas nào đã covered / chưa covered?
  - Research gaps nào đang mở?

### 5b. Đọc Full Memory (chỉ khi cần)
- Đọc `agents/{slug}/AGENT.md` — prompt & identity của agent
- Đọc `agents/{slug}/memory/semantic.md` — knowledge đã tích lũy
- Đọc `agents/{slug}/memory/learnings.md` — methodology insights
- Đọc `agents/{slug}/memory/episodic.md` — lịch sử research gần nhất (5 sessions gần nhất)
  - Nếu file có >5 sessions: chỉ đọc 5 sessions cuối + `episodic-archive.md` summary

## Bước 5.5: Context Checkpoint ✅ (CRITICAL)

**KHÔNG ĐƯỢC bỏ qua bước này.** Trước khi nghiên cứu, agent PHẢI output:

```markdown
## 📍 Context Checkpoint

### Sessions trước đó
- Total: {n} sessions
- Session gần nhất: #{n} ({date}) — "{topic}"
- Sessions liên quan đến research directive hiện tại: #{list}

### Knowledge gaps (từ semantic memory)
- Gap 1: {mô tả}
- Gap 2: {mô tả}

### Conflict check
- Research directive mới: "{directive}"
- Knowledge đã có liên quan: {list hoặc "không có"}
- Potential overlaps: {list hoặc "không có"}

### Decision
- [ ] **EXTEND** — Mở rộng knowledge hiện có (topic mới, chưa covered)
- [ ] **DEEPEN** — Đi sâu hơn vào topic đã có overview
- [ ] **VERIFY** — Kiểm chứng lại data cũ (>30 ngày hoặc market changed)
- [ ] **FRESH** — Agent mới, nghiên cứu từ đầu
```

## Bước 6: Tiến hành Nghiên cứu
- **Tuân thủ Research Protocol** trong `AGENT.md`:
  1. **Discovery**: Web search, thu thập thông tin tổng quan
  2. **Deep Dive**: Phân tích chi tiết từng khía cạnh
  3. **Synthesis**: Tổng hợp, đánh giá, đóng gói

## Bước 6.5: Quality Gate ✅

Trước khi đóng gói knowledge, tự đánh giá theo `/orchestrator/QUALITY_RUBRIC.md`:

```markdown
## 📊 Quality Gate Assessment

| Metric | Rating | Notes |
|--------|--------|-------|
| Source Quality | ⭐⭐⭐/⭐⭐/⭐ | {n} Tier 1, {n} Tier 2, {n} Tier 3 |
| Data Freshness | ⭐⭐⭐/⭐⭐/⭐ | Data age: {duration} |
| Analysis Depth | ⭐⭐⭐/⭐⭐/⭐ | {n} subtopics, {n}+ words |
| Cross-verification | ⭐⭐⭐/⭐⭐/⭐ | {n}/{total} findings verified |
| Overall Confidence | **High/Medium/Low** | {justification} |

### Gate Decision:
- [ ] ✅ PASS — Đủ chất lượng để package
- [ ] ⚠️ PASS WITH FLAGS — Package nhưng ghi rõ limitations
- [ ] ❌ FAIL — Cần nghiên cứu thêm trước khi package
```

Nếu FAIL → quay lại Bước 6 với search queries bổ sung.

## Bước 7: Ghi nhận Memory

### Episodic Memory (append):
```markdown
## Session #{n} — {DATE}

**Mục tiêu**: {mục tiêu phiên nghiên cứu}
**Phương pháp**: {cách tiếp cận}
**Nguồn chính**: {danh sách nguồn}
**Phát hiện chính**:
- {finding 1}
- {finding 2}
**Đánh giá**: {nhận xét về chất lượng data thu được}
```

**⚠️ Memory Limit Check**:
- Nếu file episodic.md có >5 sessions:
  1. Move sessions cũ nhất vào `memory/episodic-archive.md` (compressed format)
  2. Giữ 5 sessions gần nhất trong `episodic.md`
  3. Archive format: 1 dòng summary per session

### Semantic Memory (update):
- Cập nhật các section tương ứng với knowledge mới
- Thêm sources mới vào danh sách
- **⚠️ Nếu file >200 lines**: Compress sections cũ, giữ data mới nhất

### Learnings (append nếu có):
- Pattern mới phát hiện
- Source assessment updates
- **⚠️ Nếu file >100 lines**: Group, merge duplicates

## Bước 8: Đóng gói Knowledge (Draft → Published)

### 8a. Tạo Draft
Tạo file `research/knowledge/{DATE}-{topic}.md` với format từ `templates/knowledge-package.template.md`.

**Đây là DRAFT** — staged trong agent's local directory.

### 8b. Publish
Copy knowledge package sang `knowledge-base/{slug}/` — đây là **canonical published version**.

> **Rule**: Từ thời điểm publish, chỉ sửa file trong `knowledge-base/`. File trong `research/knowledge/` được giữ nguyên như bản draft gốc (không cập nhật).

## Bước 8.5: Integrity Check ✅

```markdown
## 🔍 Integrity Check

- [ ] Knowledge package tồn tại trong cả `research/knowledge/` VÀ `knowledge-base/{slug}/`
- [ ] INDEX.md package count = tổng số file thực tế trong `knowledge-base/`
- [ ] INDEX.md đã list package mới
- [ ] Cross-topic connections đã cập nhật (nếu có)
- [ ] Research gaps đã cập nhật (remove gaps đã covered, thêm gaps mới)
- [ ] Config.json `knowledge_packages` count khớp thực tế
```

## Bước 9: Cập nhật Config & Manifest
- Tăng `research_sessions` count
- Tăng `knowledge_packages` count
- Update `last_active` date
- Thêm entry vào `research_history` array
- **Regenerate `CONTEXT_MANIFEST.md`** — cập nhật:
  - Quick Status (session count, last session)
  - Key Areas Coverage (status updates)
  - Memory Summary (compressed latest)
  - Knowledge Packages Index
  - Open Research Gaps
  - Unresolved Questions

## Bước 10: Cập nhật Orchestrator Log

Append vào `orchestrator/log.md` với structured format:

```markdown
## [{DATE} {TIME}] {Action Type} — {agent slug}

<!-- META: action={type} agent={slug} status={status} session={n} packages={list} -->

| Field | Value |
|-------|-------|
| Action | CREATE / ACTIVATE / RESEARCH |
| Agent | `{slug}` |
| Session | #{n} |
| Topic | {research topic} |
| Status | ✅ SUCCESS / ❌ FAILED / ⚠️ PARTIAL |
| Packages Created | `{filename}` |
| Quality | {confidence level} |

**Details**: {brief description}
```

## Bước 11: Báo cáo cho User
- Tóm tắt kết quả nghiên cứu bằng Tiếng Việt
- Highlight những phát hiện quan trọng nhất
- Report quality assessment results
- Đề xuất hướng nghiên cứu tiếp theo
