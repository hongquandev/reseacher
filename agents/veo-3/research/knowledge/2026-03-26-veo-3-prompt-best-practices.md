# 📦 Knowledge Package: Veo 3 — Best Practices Prompt Engineering

> **Agent**: veo-3
> **Date**: 2026-03-26
> **Session**: #2
> **Confidence**: High

---

## Executive Summary

Prompt engineering cho Veo 3 đòi hỏi tư duy như một **đạo diễn phim** — mô tả chi tiết mọi yếu tố từ subject, action, camera, lighting, đến audio. Google official docs xác nhận 7 thành phần cốt lõi của một prompt tốt. Điểm khác biệt lớn nhất so với image AI là cần mô tả **camera movement**, **pacing**, và **audio cues** (dialogue, SFX, ambient). Negative prompting trong Veo 3 KHÔNG dùng "no/don't" mà mô tả trực tiếp element không muốn.

## 1. Cấu Trúc Prompt Chuẩn (Official Google Guide)

Google chính thức khuyến nghị prompt bao gồm các thành phần sau:

```
┌─────────────────────────────────────────────┐
│  1. SUBJECT      — Ai/cái gì trong video     │
│  2. ACTION       — Subject đang làm gì       │
│  3. STYLE        — Phong cách visual          │
│  4. CAMERA       — Camera position & motion   │
│  5. COMPOSITION  — Framing of the shot        │
│  6. FOCUS/LENS   — Hiệu ứng lens             │
│  7. AMBIANCE     — Lighting & color mood      │
│  8. AUDIO        — Dialogue, SFX, ambient     │
└─────────────────────────────────────────────┘
```

### Chi tiết từng thành phần:

| # | Element | Required | Mô tả | Ví dụ |
|---|---------|----------|--------|-------|
| 1 | **Subject** | ✅ Bắt buộc | Object, person, animal, scenery | "A weary woman in a red hoodie" |
| 2 | **Action** | ✅ Bắt buộc | Hành động cụ thể, dùng vivid verbs | "sipping coffee, steam rising" |
| 3 | **Style** | ✅ Khuyến nghị | Film style keywords | "film noir", "sci-fi", "documentary" |
| 4 | **Camera** | Optional | Position & movement | "slow dolly-in", "tracking shot", "aerial view" |
| 5 | **Composition** | Optional | Shot framing | "close-up", "wide shot", "two-shot" |
| 6 | **Focus/Lens** | Optional | Lens effects | "shallow depth of field", "85mm portrait look" |
| 7 | **Ambiance** | Optional | Color & light mood | "golden hour", "warm tones", "blue tones" |
| 8 | **Audio** | Optional | Sound design | Dialogue in quotes, SFX descriptions, ambient |

## 2. Camera Movement — Từ Vựng Chính

### Danh sách camera movements mà Veo 3 hiểu tốt:

| Movement | Mô tả | Hiệu ứng |
|----------|--------|-----------|
| **Dolly in/out** | Camera tiến/lùi | Xây dựng sự thân mật hoặc reveal context |
| **Tracking shot** | Camera di chuyển song song subject | Follow action, dynamic energy |
| **Pan left/right** | Camera xoay ngang | Reveal landscape, scan environment |
| **Tilt up/down** | Camera nghiêng lên/xuống | Dramatic reveal, show scale |
| **Crane shot** | Camera nâng/hạ | Sweeping, cinematic scale |
| **Aerial/Drone** | Góc nhìn từ trên cao | Bird's-eye, establish location |
| **POV shot** | First-person perspective | Immersive, subjective experience |
| **Whip pan** | Pan cực nhanh | Energy, transition effect |
| **Static** | Camera cố định | Performance focus, stability |
| **Steadicam follow** | Smooth handheld follow | Documentarcy, intimate following |
| **Zoom in/out** | Thay đổi field of view | Emphasis, reveal |
| **Crash zoom** | Zoom đột ngột | Shock, comedic effect |

### Ví dụ prompt sử dụng camera:
```
"Wide establishing shot slowly transitioning to a dolly-in 
on a detective's face, eye-level, 35mm film look"
```

## 3. Lighting — Hệ Thống Ánh Sáng

### Natural Lighting:
- `"Golden hour sunlight streaming through tall windows"`
- `"Soft overcast daylight with even shadows"`
- `"Moonlight exterior, cool blue tones"`
- `"Soft natural lighting from window"`

### Dramatic Lighting:
- `"Warm tungsten spotlight from camera left, Rembrandt lighting"`
- `"Chiaroscuro lighting with deep blacks and bright highlights"`
- `"Harsh fluorescent overhead lights"`
- `"Rim lighting / Edge lighting"` — subject outlined by backlight
- `"Volumetric lighting / God rays"` — light beams through fog
- `"Silhouette lighting"`

### Color Temperature:
- `"Warm 3200K lighting"` — intimate, indoor
- `"Cool 5600K daylight"` — professional, outdoor
- `"Neon lighting"` — cyberpunk, nightlife

### Named Setups:
- `"Three-point lighting"` — standard studio
- `"Rembrandt lighting"` — dramatic portrait
- `"Butterfly lighting"` — beauty/fashion

> ⚠️ **Tip quan trọng**: Tránh dùng "ultra-sharp 4K" — có thể khiến footage trông CGI. Thay vào đó: "soft but detailed, gentle film grain, natural skin texture"

## 4. Audio Prompt — Tính Năng Đặc Biệt của Veo 3

### 3 loại audio có thể prompt:

#### Dialogue (Hội thoại):
```
Dùng dấu ngoặc kép cho lời nói cụ thể
"This must be the key," he murmured.
```

#### Sound Effects (SFX):
```
Mô tả rõ ràng sounds:
"tires screeching loudly, engine roaring"
"footsteps echoing in empty hallway"
```

#### Ambient Noise:
```
Mô tả soundscape môi trường:
"A faint, eerie hum resonates in the background"
"distant traffic, rain on pavement, city buzz"
```

### Kỹ thuật nâng cao cho audio:
- Dùng **audio tags** trong ngoặc vuông: `[exhausted] [desperate] [whiny tone]`
- Mô tả **dynamic range**: "crescendo", "diminuendo", "staccato"
- Kết hợp **sensory language**: "crackly", "sizzling", "thundering"
- Mô tả **emotion** của speaker: tone, speed, pauses
- Audio sample rate tối ưu: **48 kHz** (commercial grade)

## 5. Negative Prompt — Cách Loại Trừ Đúng

> ⚠️ **QUAN TRỌNG**: Veo 3 KHÔNG dùng "no" hoặc "don't" cho negative prompt!

### ❌ SAI:
```
"No walls"
"Don't show any people"
"No watermarks"
```

### ✅ ĐÚNG (Official Google method):
```
Mô tả trực tiếp element không muốn:
"wall, frame"            (thay vì "no walls")
"text, watermark"        (thay vì "no watermarks")
```

### Kỹ thuật nâng cao:
```
Đặt exclusions ở cuối prompt, trong block riêng:
"...cinematic kitchen scene, steel countertops, neon lighting. 
EXCLUDE: people, human figures, text, watermarks, clutter"
```

## 6. Reference Images — Duy Trì Consistency

### Quy tắc:
- Tối đa **3 reference images** cho single person/character/product
- Veo sử dụng ảnh input làm **initial frame** (frame đầu tiên)
- Dùng **exact phrasing** cho characters lặp lại: `"navy bomber jacket"` thay vì `"blue jacket"`

### First & Last Frame:
- Veo 3.1 cho phép specify cả **frame đầu và frame cuối**
- Upload ảnh hoặc dùng frame từ video trước
- Giúp kiểm soát chính xác beginning và ending

### Extension:
- Extend lấy **1 giây cuối (24 frames)** của video hiện tại
- ⚠️ Voice không extend tốt nếu không có trong 1 giây cuối

## 7. Các Mẫu Prompt Thực Tế

### 🎬 Mẫu 1: Cinematic Drama
```
Medium shot of a rain-soaked detective in long coat standing under 
flickering neon sign in dark alley. He lights a cigarette, the flame 
briefly illuminating his weathered face. Cold drizzle falls steadily. 
The camera slowly pushes in as he exhales smoke. Film noir aesthetic 
with cyan-magenta color grading. 

Audio: Rain on pavement, distant traffic, lighter click.
```

### 🌵 Mẫu 2: Desert Survival (Wide + Drone)
```
Wide shot. A man in worn clothing walks slowly across an open desert, 
one hand raised to shield his face from the sun. The camera begins at 
shoulder height behind him, then rises in a smooth drone-style lift 
into an overhead shot, revealing the vast empty landscape stretching 
endlessly. The horizon shimmers with heat beneath a pale blue sky. 
Cinematic, tense, minimalist. 

Audio: Slow-building thriller score with low strings beneath the silence.
```

### 🚌 Mẫu 3: Melancholic Bus Scene (Close-up)
```
Close-up of a woman's face looking out a bus window at passing city 
lights, her reflection faintly visible on the glass. Inside a bus at 
night during a rainstorm. Very shallow depth of field with bokeh from 
exterior lights. Melancholic mood with cool blue tones. Soft side 
lighting from window creates gentle shadows on her face. Moody, cinematic.
```

### 🥊 Mẫu 4: Boxer Portrait (Low Angle)
```
A low-angle medium shot frames a boxer from below as he bounces in 
place before a match, lit by harsh overhead fluorescents. Sweat 
glistens on his jawline and neck, catching the cold light. His breath 
is slow and controlled, his shoulders rolling with each inhale. 
Huge crowd. Style: Gritty, cinematic realism.
```

### 📦 Mẫu 5: Product Demo (Template)
```
[Product name] showcase video. [Product] positioned on [surface]. 
[Camera movement] revealing [key features]. Professional lighting 
with [lighting style]. Voice-over explains [benefits]. 

Audio: [music style] with clear narration. 
Color palette: [brand colors].
```

### 💻 Mẫu 6: Office Retro (1980s Style)
```
Medium shot of a tired office worker rubbing his temples at his desk 
in a cluttered 1980s office late at night. The scene is lit by harsh 
fluorescent overhead lights and the green glow of a monochrome monitor. 
Retro aesthetic, shot as if on 1980s color film, slightly grainy.
```

## 8. Checklist — Lỗi Thường Gặp

| # | ❌ Sai | ✅ Đúng | Lý do |
|---|--------|---------|-------|
| 1 | "A woman drinks coffee" | "Close-up of a weary woman in a red hoodie sipping coffee on a foggy balcony at dawn, steam rising" | Thiếu chi tiết = output generic |
| 2 | "ultra-sharp 4K resolution" | "soft but detailed, gentle film grain, natural skin texture" | Ultra-sharp → trông CGI |
| 3 | "No people in the scene" | "EXCLUDE: people, human figures" | "No/Don't" negative prompt không hoạt động |
| 4 | "blue jacket" (cho character lặp) | "navy bomber jacket" (exact wording) | Veo không nhớ context giữa prompts |
| 5 | Prompt dài, nhiều actions phức tạp | Mỗi prompt = 1 moment cinematic, 4-6 giây | Quá phức tạp → output mất focus |
| 6 | Passive verbs: "is standing" | Active verbs: "stands tall, chin raised" | Active verb → output dynamic hơn |
| 7 | "well-lit room" | "warm 3200K tungsten lighting, diffused through sheer curtains" | Mô tả lighting vague → output unpredictable |

## 9. API Parameters Quan Trọng

| Parameter | Values | Notes |
|-----------|--------|-------|
| `aspectRatio` | `"16:9"`, `"9:16"` | Landscape vs Portrait |
| `durationSeconds` | `"4"`, `"6"`, `"8"` | Veo 3.1: 4/6/8 giây |
| `resolution` | `"720p"`, `"1080p"`, `"4k"` | Giá tăng theo resolution |
| `personGeneration` | `"allow_all"`, `"allow_adult"`, `"dont_allow"` | Content safety |
| `seed` | integer | Improves (but not guarantees) determinism |
| `referenceImages` | up to 3 | Character/product consistency |
| `lastFrame` | image | Specify ending frame |

## Nguồn tham khảo

| # | Source | Type | Reliability | Key Info |
|---|--------|------|-------------|----------|
| 1 | ai.google.dev/gemini-api/docs/video | Official Docs | ⭐⭐⭐ Highest | Prompt guide, API specs, examples |
| 2 | deepmind.google/models/veo | Official | ⭐⭐⭐ Highest | Model capabilities, demo |
| 3 | ltx.studio | Guide | ⭐⭐ High | 8-part prompt framework, examples |
| 4 | powtoon.com | Guide | ⭐⭐ High | Lighting vocabulary, templates |
| 5 | medium.com (multiple) | Community | ⭐⭐ High | Camera terms, lens descriptions |
| 6 | hailuoai.video | Guide | ⭐⭐ High | Cinematic tips, anti-patterns |
| 7 | leonardo.ai | Platform Docs | ⭐⭐ High | Prompt examples, structure |

## Hướng nghiên cứu tiếp theo

- [ ] **Prompt library**: Xây dựng thư viện prompt templates cho từng genre
- [ ] **A/B testing prompts**: So sánh output giữa các biến thể prompt
- [ ] **Multi-shot storytelling**: Chiến lược viết prompt cho narrative dài
- [ ] **Gemini + Veo workflow**: Dùng Gemini refine prompt trước khi generate
- [ ] **Industry-specific prompts**: Marketing, education, film production

---

*Generated by Research Agent `veo-3` | Session #2 | 2026-03-26*
