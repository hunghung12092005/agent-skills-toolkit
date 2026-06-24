# Codex Global Skills Snapshot

Thu muc nay la ban sao de commit cac skill global dang nam o `~/.codex/skills`.

## Muc dich

- Luu skill vao repo de push len GitHub/GitLab.
- Clone sang may khac va cai lai nhanh vao `~/.codex/skills`.
- Co script de dong bo lai khi ban sua skill local.

## Noi dung duoc luu

- Tat ca skill custom/global trong `~/.codex/skills/*`
- Khong bao gom `~/.codex/skills/.system` vi do la skill he thong cua Codex

## Dong bo tu may hien tai vao repo

Chay:

```bash
bash codex-global-skills/sync-from-local.sh
```

Lenh nay se:

- Xoa snapshot cu trong `codex-global-skills/skills`
- Copy lai toan bo skill custom tu `~/.codex/skills`

## Cai lai tren may moi

Sau khi clone repo, chay:

```bash
bash codex-global-skills/install.sh
```

Lenh nay se copy cac skill trong repo vao:

```bash
~/.codex/skills
```

## Quy trinh de dung nhanh

1. Sua skill trong `~/.codex/skills/...`
2. Chay `bash codex-global-skills/sync-from-local.sh`
3. Commit va push repo
4. O may moi: clone repo va chay `bash codex-global-skills/install.sh`
# toolkit-codeX
