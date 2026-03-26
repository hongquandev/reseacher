# 🧠 Semantic Memory — n8n Automation Tools

> Tri thức tích lũy, có cấu trúc về n8n Automation Tools.
> Được cập nhật sau mỗi phiên nghiên cứu.

---

## Tổng quan
n8n đã chính thức tiến hóa thành một nền tảng **AI-augmented orchestration** với sự ra mắt của phiên bản 2.0 (cuối 2025/đầu 2026). Trọng tâm hiện tại là sự kết hợp giữa tính bảo mật cao (Task Runners), hiệu suất vượt trội và khả năng tích hợp AI sâu rộng (Native LangChain, AI Agent nodes).

## Các khía cạnh chính

### 1. Workflow Automation Design
- **Publish/Save Paradigm**: Workflow hiện có hai trạng thái: Draft (đang soạn thảo) và Published (đang chạy thực tế). Mọi thay đổi trong nháp không ảnh hưởng đến bản đang chạy cho đến khi được "Publish".
- **Autosave**: Tự động lưu bản nháp mỗi 2 giây.
- **Folders & Subworkflows**: Quản lý các dự án phức tạp một cách ngăn nắp và mô-đun hóa.

### 2. Self-hosted Deployment & Infrastructure
- **n8n 2.0 Task Runners**: Các workflow được chạy trong môi trường bị cô lập, tăng cường bảo mật và ổn định.
- **SQLite Performance**: Driver pooling mới giúp tăng tốc độ truy vấn cơ sở dữ liệu lên đến 10 lần.
- **Migration Report Tool**: Hỗ trợ admin kiểm tra và chuẩn bị cho việc nâng cấp từ v1 lên v2.

### 3. AI & LangChain Integration in n8n
- **70+ AI Nodes**: Bao gồm LLMs, Vector Databases, Embeddings, OCR, Vision models.
- **AI Workflow Builder**: Tạo khung workflow từ mô tả văn bản (tương tự chat).
- **Embedded LangChain**: n8n 2.0 tích hợp LangChain trực tiếp, không cần code bên ngoài để xây dựng AI chains phức tạp.
- **MCP Support**: Biến n8n thành một server cung cấp "công cụ" (tools) cho các AI agent khác (như Claude hoặc Gemini).

## Các thuật ngữ quan trọng
<!-- Glossary of key terms -->

## Timeline / Milestones
<!-- Important dates and events -->

## Nguồn tham khảo đáng tin cậy
<!-- Curated list of reliable sources -->
