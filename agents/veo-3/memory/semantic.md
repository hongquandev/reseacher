# 🧠 Semantic Memory — Veo 3

> Tri thức tích lũy, có cấu trúc về Google Veo 3.
> Được cập nhật sau mỗi phiên nghiên cứu.

---

## Tổng quan

Google Veo 3 là mô hình tạo video AI tiên tiến nhất của Google DeepMind, ra mắt tháng 5/2025. Phiên bản cập nhật Veo 3.1 ra mắt tháng 10/2025 với nhiều cải tiến. Điểm đột phá lớn nhất là khả năng tạo audio gốc đồng bộ (dialogue, sound effects, ambient noise) trực tiếp từ prompt. Sau khi OpenAI ngừng Sora (24/03/2026), Veo 3 trở thành model video AI hàng đầu thị trường.

## Các khía cạnh chính

### 1. Architecture & Technology

**Model Core**:
- Developed by Google DeepMind
- Text-to-video và Image-to-video generation
- Native audio generation synchronized với video

**Technical Specs**:
| Spec | Value |
|------|-------|
| Max Resolution | 4K (4096×2160) via upscaling, native 1080p |
| Frame Rate | 24-60 fps |
| Clip Duration | 4, 6, or 8 seconds (extendable) |
| Max Context | 128K tokens (up to 10min videos) |
| Output Codecs | H.264/AVC (MP4), H.265/HEVC (4K), AV1 (MP4/WebM) |
| Audio Sample Rate | 48 kHz (recommended for commercial) |
| Prompt Adherence | ~95% accuracy |
| Image Input | Up to 20MB for image-to-video |
| Prompt Language | Primarily English |
| Aspect Ratios | 16:9 (landscape), 9:16 (portrait) |

**Creative Controls**:
- Reference Images: tối đa 3 ảnh (characters, objects, scenes) để maintain consistency
- Camera Controls: pan, zoom, angle control
- Video Extension: extend existing clips with seamless transitions
- Frame-Specific Generation: specify first/last frames

**Safety**:
- SynthID digital watermark on all generated content
- Content moderation filters

### 2. Use Cases & Applications

- **Film Production**: Cinematic storytelling, scene previsualization
- **Marketing/Advertising**: Product videos, brand content
- **Social Media**: YouTube Shorts, short-form content (9:16 support)
- **Education**: Educational content creation
- **Enterprise**: Google Vids (Workspace integration)
- **Creative Experimentation**: AI filmmaking tool "Flow"
- **Developer Applications**: Via Gemini API & Vertex AI

**Platforms Available**:
- Gemini app (Ultra & limited Pro subscribers)
- Google Flow (AI filmmaking tool)
- YouTube Shorts creation tools
- Google Vids (Workspace)
- Gemini API & Vertex AI
- Third-party: Leonardo.Ai

### 3. Competitive Landscape

**Tình trạng thị trường (03/2026)**:

| Model | Company | Status | Strengths |
|-------|---------|--------|-----------|
| **Veo 3.1** | Google | ✅ Active | Audio native, 4K, cinematic realism, prompt adherence |
| **Sora 2** | OpenAI | ❌ Discontinued (24/03/2026) | Was good at narrative storytelling |
| **Gen-4.5** | Runway | ✅ Active | Best visual fidelity, physics, VFX workflows |
| **Kling 3.0 Omni** | Kuaishou | ✅ Active | Photorealistic humans, fastest, cheapest |

**So sánh giá**:
| Model | Cost per second | Monthly Plan |
|-------|----------------|-------------|
| Veo 3.1 | $0.50/sec (4K) | Pro $19.99, Ultra $249.99 |
| Runway | ~$0.05/sec | Credit-based |
| Kling | ~$0.02/sec | Free plan (66 credits/day) |

**Veo 3 Advantages**:
- Duy nhất có native audio generation (dialogue + SFX + ambient)
- Strongest prompt adherence (~95%)
- Most reliable/consistent output
- Deep integration với Google ecosystem

**Veo 3 Weaknesses**:
- Giá cao nhất
- Uncanny valley effect ở một số trường hợp
- Clip ngắn (8s mặc định)
- Chủ yếu hỗ trợ prompt tiếng Anh

### 4. Prompt Engineering Best Practices

**Cấu trúc prompt 8 thành phần** (Official Google Guide):
1. Subject (bắt buộc), 2. Action (bắt buộc), 3. Style (khuyến nghị),
4. Camera motion, 5. Composition, 6. Focus/Lens, 7. Ambiance, 8. Audio

**Camera vocabulary**: dolly in/out, tracking, pan, tilt, crane, aerial/drone, POV, whip pan, static, steadicam, zoom, crash zoom

**Lighting terminology**: golden hour, Rembrandt, chiaroscuro, rim/edge, volumetric/god rays, three-point, butterfly, silhouette. Color temps: 3200K (warm) → 5600K (cool)

**Audio prompting**: Dialogue (dùng quotes), SFX (mô tả rõ ràng sounds), Ambient (soundscape description). Audio tags trong [brackets]

**Negative prompt**: KHÔNG dùng "no/don't", mà mô tả trực tiếp element hoặc dùng EXCLUDE block cuối prompt

**Consistency**: exact phrasing cho recurring characters, tối đa 3 reference images, first/last frame control

**Anti-patterns**: "ultra-sharp 4K" (→ CGI look), vague prompts, passive verbs, quá nhiều actions trong 1 prompt

## Các thuật ngữ quan trọng

- **SynthID**: Google's digital watermark technology for AI-generated content
- **Flow**: Google's AI filmmaking tool, integrating Veo
- **Reference Images**: Ảnh tham chiếu để maintain character/object/scene consistency
- **Native Audio**: Audio được tạo trực tiếp bởi model, không cần post-production
- **Prompt Adherence**: Mức độ model tuân thủ chi tiết prompt
- **Dolly shot**: Camera physically moves toward/away from subject
- **Tracking shot**: Camera follows subject laterally
- **Chiaroscuro**: High contrast lighting with deep blacks and bright highlights
- **Rembrandt lighting**: One side illuminated, triangle of light on shadow side
- **Negative prompt**: Mô tả elements không muốn (KHÔNG dùng no/don't trong Veo)
- **EXCLUDE block**: Kỹ thuật đặt exclusions cuối prompt

## Timeline / Milestones

| Date | Event |
|------|-------|
| 05/2024 | Veo 1 announced |
| 12/2024 | Veo 2 released (4K support) |
| 04/2025 | Veo 2 available on Gemini app |
| 05/2025 | **Veo 3 released** — breakthrough native audio |
| 10/2025 | **Veo 3.1 released** — audio quality, prompt adherence improvements |
| 02/2026 | Veo 3.1 ongoing updates |
| 03/2026 | OpenAI Sora discontinued — Veo becomes market leader |

## Nguồn tham khảo đáng tin cậy

| Source | Reliability | Notes |
|--------|-------------|-------|
| deepmind.google | ⭐⭐⭐ Highest | Official DeepMind page |
| blog.google | ⭐⭐⭐ Highest | Official announcements |
| google.dev | ⭐⭐⭐ Highest | Developer docs & API reference |
| ai.google.dev/gemini-api/docs/video | ⭐⭐⭐ Highest | **Official prompt guide** (Session #2) |
| wikipedia.org/wiki/Veo | ⭐⭐ High | Well-sourced overview |
| zapier.com | ⭐⭐ High | Detailed comparison reviews |
| petapixel.com | ⭐⭐ High | Photography/video industry coverage |
| ltx.studio | ⭐⭐ High | Prompt framework & examples (Session #2) |
| powtoon.com | ⭐⭐ High | Lighting vocabulary (Session #2) |
