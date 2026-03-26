---
description: Quy trình liệt kê thay đổi và đẩy code lên repository theo chuẩn Git
---

# 🚀 Git Push Workflow

## Bước 1: Kiểm tra trạng thái
```bash
cd /Users/mac/AI\ Projects/reseacher && git status
```

## Bước 2: Liệt kê thay đổi
```bash
git diff --stat
```

## Bước 3: Stage các file
```bash
git add -A
```

## Bước 4: Commit
- Sử dụng conventional commit format: `type(scope): message`
- Types: feat, fix, docs, refactor, chore
```bash
git commit -m "{type}({scope}): {message}"
```

## Bước 5: Push
```bash
git push origin $(git branch --show-current)
```
