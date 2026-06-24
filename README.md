# Codex Global Skills Snapshot

Thu muc nay la ban sao de commit cac skill global dang nam o `~/.codex/skills`.

## Muc dich

- Luu skill vao repo de push len GitHub/GitLab.
- Clone sang may khac va cai lai nhanh vao `~/.codex/skills`.
- Co script de dong bo lai khi ban sua skill local.

## Noi dung duoc luu

- Tat ca skill custom/global trong `~/.codex/skills/*`
- Khong bao gom `~/.codex/skills/.system` vi do la skill he thong cua Codex

## Danh sach skills

| Skill | Cong dung |
|---|---|
| `brandkit` | Tao brand kit cao cap, guideline, logo system, identity board. |
| `brutalist-skill` | Dinh huong UI brutalist cong nghiep, raw, Swiss grid, terminal style. |
| `gpt-tasteskill` | Nang cap UX/UI frontend theo huong editorial, motion, AIDA, layout bien hoa. |
| `gsap-core` | Huong dan dung GSAP core API cho animation co ban. |
| `gsap-frameworks` | Dung GSAP trong Vue, Svelte va framework non-React. |
| `gsap-performance` | Toi uu hieu nang animation GSAP, giam lag va layout thrash. |
| `gsap-plugins` | Huong dan cac plugin GSAP nhu ScrollTo, Flip, Draggable, SplitText. |
| `gsap-react` | Dung GSAP voi React, `useGSAP`, refs, cleanup. |
| `gsap-scrolltrigger` | Lam animation theo scroll, pin, scrub bang ScrollTrigger. |
| `gsap-timeline` | Choreograph animation bang `gsap.timeline()`. |
| `gsap-utils` | Su dung `gsap.utils` nhu clamp, mapRange, random, wrap. |
| `imagegen-frontend-mobile` | Tao concept man hinh mobile app cao cap bang image generation. |
| `imagegen-frontend-web` | Tao image reference tung section cho website/landing page. |
| `image-to-code-skill` | Sinh image design truoc roi implement frontend theo image do. |
| `minimalist-skill` | Dinh huong UI toi gian, editorial, monochrome, flat va sach. |
| `output-skill` | Ep model xuat day du, tranh placeholder va cat ngan output. |
| `redesign-skill` | Nang cap du an frontend san co theo huong premium ma khong vo giao dien hien huu. |
| `soft-skill` | Rule thiet ke high-end agency, font, spacing, shadow, polish. |
| `stitch-skill` | Tao `DESIGN.md` semantic design system cho Google Stitch. |
| `taste-skill` | Anti-slop frontend skill v2 cho landing page, portfolio, redesign. |
| `taste-skill-v1` | Ban v1 cua taste skill, giu de tuong thich voi workflow cu. |

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
