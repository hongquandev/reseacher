# 💡 Learnings — Veo 3

> Meta-learnings, patterns, và insights rút ra qua các phiên nghiên cứu.
> Giúp agent cải thiện chất lượng nghiên cứu theo thời gian.

---

## Phương pháp nghiên cứu hiệu quả
- **Multi-angle simultaneous search**: Search 4 queries song song (features, competition, API, audio) cho kết quả toàn diện nhanh
- **Comparison queries**: Thêm tên competitors vào search query giúp thu được comparative data rất tốt
- **Official docs first**: Luôn ưu tiên nguồn gốc (deepmind.google, blog.google, google.dev)

## Nguồn thông tin
### Reliable Sources (đáng tin cậy)
- **deepmind.google** — Official, technical accuracy cao nhất
- **blog.google** — Official announcements, feature releases
- **google.dev** — API docs, developer specs
- **wikipedia.org** — Well-sourced overview, timeline accuracy
- **zapier.com** — Detailed, fair comparisons
- **petapixel.com** — Photography/video industry, hands-on reviews

### Unreliable Sources (cần kiểm chứng)
- Various "free Veo" sites (veoe.ai, etc.) — có thể misleading about access
- Social media posts — cần cross-reference

## Patterns & Insights
- AI video generation market đang consolidate nhanh (Sora eliminated 03/2026)
- Audio integration là differentiator chính — model nào có native audio sẽ dominate
- Pricing tiered model phổ biến: Free → Pro → Ultra/Enterprise
- Google ecosystem integration là competitive moat lớn của Veo (Gemini, YouTube, Workspace)

## Lỗi cần tránh
- Không confuse Veo 3 và Veo 3.1 — khác biệt rõ rệt về audio quality
- Giá thay đổi thường xuyên — luôn verify latest pricing
- Feature availability khác nhau theo region (US-first rollout)

## Kết nối liên chủ đề
- **AI Audio Generation**: ElevenLabs, Adobe Firefly Audio — liên quan đến audio capabilities
- **AI Filmmaking**: Flow tool, Runway — creative workflows
- **Google AI Ecosystem**: Gemini API, Vertex AI — platform dependency
- **Video Codecs**: H.264/H.265/AV1 — technical standards

---
<!-- New learnings are appended below -->

### Session #2 Learnings (2026-03-26)
- **Official docs > community guides**: Google's `ai.google.dev/gemini-api/docs/video` chứa prompt guide chính thức — luôn đọc trước
- **Deep read via chunks**: Đọc specific chunks (38-40) từ docs page cho targeted info thay vì đọc toàn bộ
- **Prompt topics cần sources thực hành**: Community examples (ltx.studio, powtoon) bổ sung tốt cho official docs vì có real-world templates
- **Multiple search angles**: 4 queries song song cho prompt topic cũng hiệu quả, nhưng official docs nên là query riêng
- **Anti-patterns có giá trị cao**: Biết cái KHÔNG nên làm quan trọng không kém biết cái nên làm (vd: "no/don't" negative prompt)
