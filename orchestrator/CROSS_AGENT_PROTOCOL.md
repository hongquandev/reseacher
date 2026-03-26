# 🔗 Cross-Agent Research Protocol

> **Version**: 1.0.0  
> **Created**: 2026-03-26  
> Quy trình phối hợp khi nghiên cứu liên quan đến nhiều agents.

---

## Khi nào kích hoạt

1. **Comparison request**: User yêu cầu so sánh 2+ topics (VD: "Veo 3 vs Runway Gen-4.5")
2. **Cross-topic insight**: Một agent phát hiện knowledge thuộc domain agent khác
3. **Synthesis request**: User muốn tổng hợp findings từ nhiều agents

## Quy trình

### Bước 1: Orchestrator Phân tích Request

```
Input: "So sánh chi tiết Veo 3 với Runway Gen-4.5"
↓
Agents involved: [veo-3, runway-gen4]
Comparison dimensions: [visual quality, audio, pricing, API, ecosystem]
Lead agent: veo-3 (có data nhiều hơn)
Secondary agent: runway-gen4 (cần tạo/activate)
```

### Bước 2: Parallel Agent Research

- Mỗi agent nghiên cứu **phần của mình** theo research protocol riêng
- Orchestrator cung cấp **shared comparison framework** để đảm bảo data format thống nhất:

```json
{
  "comparison_framework": {
    "dimensions": ["visual_quality", "audio", "pricing", "api", "ecosystem"],
    "rating_scale": "1-5 stars",
    "evidence_required": true,
    "source_per_dimension": "minimum 1"
  }
}
```

### Bước 3: Data Collection

Orchestrator thu thập relevant sections từ mỗi agent:
- `agents/{slug}/memory/semantic.md` → sections liên quan
- `agents/{slug}/research/knowledge/*.md` → findings cụ thể

### Bước 4: Conflict Resolution

Khi 2 agents đánh giá khác nhau:

| Conflict Type | Resolution |
|--------------|------------|
| **Factual** (số liệu khác nhau) | Ưu tiên Tier 1 source → verify bằng web search |
| **Qualitative** (đánh giá khác nhau) | Giữ cả 2 perspectives, ghi rõ lý do |
| **Temporal** (data cũ vs mới) | Ưu tiên data mới nhất, flag data cũ |

### Bước 5: Synthesis & Packaging

Output: `knowledge-base/cross-topic/{date}-{topic1}-vs-{topic2}.md`

```markdown
# 📦 Cross-Topic Analysis: {Topic1} vs {Topic2}

> **Agents**: [{slug1}, {slug2}]
> **Date**: {date}
> **Confidence**: {overall}

## Comparison Matrix
| Dimension | {Topic1} | {Topic2} | Winner |
|-----------|----------|----------|--------|
| ... | ... | ... | ... |

## Detailed Analysis
### By {Agent1}: ...
### By {Agent2}: ...

## Conflicts & Resolutions
- ...

## Combined Insights
- ...
```

### Bước 6: Cross-Pollination

Sau khi synthesis xong:
1. Mỗi agent nhận "cross-topic learnings" vào `memory/learnings.md`
2. Update `related_agents` trong `config.json` của cả 2 agents
3. Update `knowledge-base/INDEX.md` với tag `cross-topic`

## Communication Format

### Orchestrator → Agent:
```markdown
## Cross-Agent Research Directive

**Directive ID**: CROSS-{date}-{id}
**Your Role**: Lead / Secondary
**Comparison Topic**: {topic}
**Your Focus**: {specific dimensions}
**Partner Agent**: {other agent slug}
**Output Format**: Use comparison framework (attached)
**Deadline**: {if any}
```

### Agent → Orchestrator:
```markdown
## Cross-Agent Response

**Directive ID**: CROSS-{date}-{id}
**Dimensions Covered**: [list]
**Confidence per Dimension**: {table}
**Conflicts Noted**: {if found data contradicting partner agent}
**Data Ready**: ✅
```

## Constraints

- Không cho agent A trực tiếp edit memory của agent B
- Orchestrator là trung gian duy nhất
- Cross-topic packages luôn lưu trong `knowledge-base/cross-topic/`, KHÔNG trong agent's `research/knowledge/`
- Mỗi cross-topic analysis phải reference IDs của source knowledge packages
