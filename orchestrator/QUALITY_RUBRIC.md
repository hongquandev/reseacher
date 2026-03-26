# 📏 Research Quality Rubric

> **Version**: 1.0.0  
> **Created**: 2026-03-26  
> Tiêu chuẩn đánh giá chất lượng nghiên cứu — áp dụng cho tất cả agents.

---

## Confidence Scoring

### Rubric

| Level | Criteria | Khi nào dùng |
|-------|----------|-------------|
| **High** | ≥3 independent reliable sources, ≥1 official/Tier 1 source, data <1 week old, facts cross-verified | "Tôi rất chắc chắn" |
| **Medium** | 2 reliable sources, hoặc chỉ có Tier 2/3 sources, data 1-4 weeks old | "Tôi khá chắc chắn nhưng cần thêm verification" |
| **Low** | <2 sources, không có official verification, data >1 month old, hoặc topic mới/emerging | "Đây là thông tin sơ bộ, cần nghiên cứu thêm" |

### Per-Finding Confidence

Mỗi key finding trong knowledge package PHẢI có confidence tag:

```markdown
- Veo 3 hỗ trợ 4K output [HIGH — confirmed by deepmind.google + google.dev]
- Giá Ultra có thể giảm trong Q2/2026 [LOW — chỉ 1 rumor source]
```

---

## Source Reliability Matrix

| Tier | Source Type | Examples | Trust Level |
|------|-----------|---------|-------------|
| **Tier 1** | Official docs, blogs, announcements | google.dev, deepmind.google, blog.google | ⭐⭐⭐ Highest — Cite directly |
| **Tier 2** | Industry publications, established tech media | TechCrunch, Ars Technica, Wired, petapixel.com | ⭐⭐ High — Reliable for analysis |
| **Tier 3** | Community content, tutorials, comparisons | Medium, YouTube, Reddit, forums, zapier.com | ⭐ Medium — Cross-reference required |
| **Tier 4** | Unknown/new sites, affiliate marketing | Random blogs, "free AI" sites, SEO content farms | ⚠️ Low — Use only if no better source |

### Rules:
1. **Knowledge package phải có ≥1 Tier 1 source** nếu topic có official docs
2. **Tier 4 sources KHÔNG được dùng** làm sole source cho bất kỳ finding nào
3. **Mỗi factual claim** cần ≥2 independent sources (cross-verification)
4. **Source freshness** phải được ghi rõ: access date + content date

---

## Knowledge Package Quality Checklist

### Mandatory (PHẢI có — thiếu = reject package)

- [ ] **Metadata block** đầy đủ (Agent, Date, Session, Confidence)
- [ ] **Executive Summary** 3-5 câu
- [ ] **≥3 subtopics** được phân tích chi tiết
- [ ] **Source table** với reliability assessment
- [ ] **Confidence score** overall + per-finding
- [ ] **"Hướng nghiên cứu tiếp theo"** section

### Recommended (NÊN có — thiếu = flag cải tiến)

- [ ] Comparison table (nếu topic có competitors)
- [ ] Timeline / milestones
- [ ] Visual aids (ASCII diagrams, tables)
- [ ] Anti-patterns / common mistakes
- [ ] Glossary / key terms

### Quality Gates

| Gate | Criteria | Action nếu fail |
|------|----------|-----------------|
| **Completeness** | Tất cả mandatory items ✅ | Reject, bổ sung thiếu sót |
| **Source Quality** | ≥1 Tier 1 or Tier 2 source | Flag "Low Source Quality" |
| **Freshness** | Research data <30 days old | Flag "Needs Refresh" |
| **Depth** | ≥500 words analysis (không đếm tables) | Flag "Shallow Analysis" |
| **Objectivity** | Ghi nhận cả strengths VÀ weaknesses | Flag "Biased Assessment" |

---

## Research Session Quality

### Search Strategy Assessment

| Rating | Criteria |
|--------|----------|
| **Excellent** | 4+ parallel queries, diverse angles, iterative refinement |
| **Good** | 2-3 queries, covers main aspects |
| **Needs Improvement** | 1 query, narrow scope, missed key angles |

### Memory Update Assessment

| Rating | Criteria |
|--------|----------|
| **Complete** | All 3 layers updated (episodic + semantic + learnings) |
| **Partial** | 2/3 layers updated |
| **Incomplete** | ≤1 layer updated — MUST fix before closing session |

---

*Template for Quality Assessment Section in knowledge packages:*

```markdown
## Quality Assessment

| Metric | Rating | Notes |
|--------|--------|-------|
| Source Quality | ⭐⭐⭐ | {n} Tier 1, {n} Tier 2, {n} Tier 3 sources |
| Data Freshness | ⭐⭐⭐ | All data <1 week old |
| Analysis Depth | ⭐⭐⭐ | {n} subtopics, {n}+ words of analysis |
| Cross-verification | ⭐⭐ | {n}/{total} findings verified by 2+ sources |
| Overall Confidence | **High** | {justification} |
```
