# 📖 Episodic Memory — Veo 3

> Ghi chép theo thời gian từng phiên nghiên cứu.
> Format: Append-only — chỉ thêm, không xóa.

---

<!-- New sessions are appended below this line -->

## Session #1 — 2026-03-26

**Mục tiêu**: Nghiên cứu toàn diện về Google Veo 3 — features, capabilities, competitive landscape, API, audio generation
**Phương pháp**: Multi-angle web search covering 4 key areas simultaneously
**Search queries**:
1. "Google Veo 3 AI video generation model 2025 2026 features capabilities release"
2. "Veo 3 vs Sora vs Runway Gen-4 vs Kling AI video comparison 2025 2026"
3. "Google Veo 3 API developer tools integration capabilities technical specs"
4. "Veo 3 audio generation native sound effects dialogue speech AI video 2025"

**Nguồn chính**:
- Wikipedia (Veo page) — High reliability
- deepmind.google — Official, highest reliability
- blog.google — Official announcements
- google.dev — Developer documentation
- zapier.com — Detailed comparison article
- key-g.com — Technical codec specs
- aimlapi.com — API integration details

**Phát hiện chính**:
- Veo 3 ra mắt 05/2025, Veo 3.1 ra mắt 10/2025, cập nhật tiếp 02/2026
- Breakthrough: Tạo audio gốc đồng bộ (dialogue, SFX, ambient)
- Hỗ trợ 4K (4096x2160), 24-60fps, H.264/H.265/AV1
- API qua Gemini API và Vertex AI (Python, JS, Go, Java, REST)
- Reference images (tối đa 3) để duy trì consistency
- Sora bị ngừng 24/03/2026 — Veo 3 trở thành leader
- Đối thủ chính: Runway Gen-4.5, Kling 3.0 Omni
- Giá: Ultra $249.99/tháng, Pro $19.99/tháng

**Đánh giá**: Phiên nghiên cứu đầu tiên rất thành công. Data phong phú từ nhiều nguồn tin cậy. Có đủ thông tin để tạo knowledge package toàn diện các mặt technology, competitive landscape, API specs, và audio capabilities.

## Session #2 — 2026-03-26

**Mục tiêu**: Best Practices Prompt Engineering cho Veo 3
**Phương pháp**: Multi-angle search (4 queries) + Official Google docs deep read
**Search queries**:
1. "Google Veo 3 prompt engineering best practices tips techniques cinematic"
2. "Veo 3 prompt structure anatomy camera movement lighting style guide examples"
3. "Veo 3 prompt audio dialogue generation tips sound effects best results"
4. "Veo 3 Gemini API prompt examples reference images negative prompt advanced"
5. Official docs: ai.google.dev/gemini-api/docs/video (chunks 38-40)

**Nguồn chính**:
- ai.google.dev — Official Google prompt guide (PRIMARY SOURCE)
- deepmind.google — Model page
- ltx.studio — 8-part prompt framework
- powtoon.com — Lighting vocabulary guide
- Medium articles — Camera and lens terminology
- hailuoai.video — Anti-patterns and cinematic tips

**Phát hiện chính**:
- Google official guide xác nhận 7 thành phần prompt: Subject, Action, Style, Camera, Composition, Focus/Lens, Ambiance
- Audio prompt có 3 categories: Dialogue (dùng quotes), SFX (mô tả rõ), Ambient (soundscape)
- Negative prompt: KHÔNG dùng "no/don't", mà mô tả trực tiếp element không muốn hoặc dùng EXCLUDE block
- Camera vocabulary: 12+ movement types mà Veo hiểu tốt
- Lighting: named setups (Rembrandt, butterfly, three-point) hoạt động tốt
- Reference images: tối đa 3, dùng exact phrasing cho consistency
- Anti-pattern: "ultra-sharp 4K" → CGI look, nên dùng "film grain, natural texture"

**Đánh giá**: Cực kỳ thành công. Official Google docs là nguồn tốt nhất — cung cấp structure rõ ràng và verified. Community guides bổ sung tốt với examples thực tế.
