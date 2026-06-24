# Codex Global Skills Snapshot

Bo skill nay da duoc chuan hoa de dung duoc cho nhieu AI agent khac nhau, khong chi rieng Codex.

## Ho tro agent nao

Repo hien ho tro cai dat cho:

| Agent | Thu muc mac dinh |
|---|---|
| `Codex` | `~/.codex/skills` |
| `Claude Code` | `~/.claude/skills` |
| `Cursor` | `~/.cursor/skills` |
| `Gemini / Antigravity` | `~/.gemini/antigravity/skills` |
| `OpenCode` | `~/.config/opencode/skills` |
| `Pi` | `~/.pi/agent/skills` |

## Cai vao may nay

Cai cho `Codex`:

```bash
bash codex-global-skills/install.sh
```

Mac dinh lenh tren se:

1. hien thi tat ca skills trong terminal
2. cho user nhap danh sach skill neu muon chon rieng
3. neu bam `Enter` de trong, script se cai `tat ca`

Cai cho agent cu the:

```bash
bash codex-global-skills/install.sh --agent claude
bash codex-global-skills/install.sh --agent cursor
bash codex-global-skills/install.sh --agent gemini
```

Cai cho tat ca agent ho tro:

```bash
bash codex-global-skills/install.sh --agent all
```

Neu can chi dinh thu muc thu cong:

```bash
bash codex-global-skills/install.sh --target /path/to/skills
```

## Chon skill khi cai

Mac dinh khi chay lenh cai, terminal se hien tat ca skills va cho user thao tac.

Neu khong nhap gi, script se cai tat ca skills.

Cai mot so skill cu the:

```bash
bash codex-global-skills/install.sh --agent claude --skills project-quick-onboard,solution-direction
```

Hoac chay lenh binh thuong roi nhap truc tiep trong terminal:

```bash
bash codex-global-skills/install.sh --agent cursor
```

Xem danh sach skill hop le:

```bash
bash codex-global-skills/install.sh --list-skills
```

## Cach goi skill

Co the goi truc tiep ten skill trong prompt. Vi du:

```text
Dung skill `project-quick-onboard` de tom tat nhanh repo nay.
```

Hoac ket hop voi yeu cau cu the hon:

```text
Dung `bug-trace-root-cause` de lan nguoc loi nay tu log den nguyen nhan goc.
```

## Danh sach skill

### Design va Frontend

| Skill | Cong dung | Vi du su dung |
|---|---|---|
| `brandkit` | Tao brand kit cao cap, guideline, logo system, identity board. | "Dung `brandkit` de tao brand guideline cho mot startup AI security." |
| `brutalist-skill` | Dinh huong UI brutalist cong nghiep, raw, Swiss grid, terminal style. | "Dung `brutalist-skill` de redesign landing page theo huong industrial UI." |
| `gpt-tasteskill` | Nang cap UX/UI frontend theo huong editorial, motion, AIDA, layout bien hoa. | "Dung `gpt-tasteskill` de lam homepage premium hon, bo layout generic." |
| `imagegen-frontend-mobile` | Tao concept man hinh mobile app cao cap bang image generation. | "Dung `imagegen-frontend-mobile` de tao concept 3 man onboarding cho app fitness." |
| `imagegen-frontend-web` | Tao image reference tung section cho website/landing page. | "Dung `imagegen-frontend-web` de tao image reference cho 6 section cua landing page SaaS." |
| `image-to-code-skill` | Sinh image design truoc roi implement frontend theo image do. | "Dung `image-to-code-skill` de tao concept hero truoc, sau do code lai bang React." |
| `minimalist-skill` | Dinh huong UI toi gian, editorial, monochrome, flat va sach. | "Dung `minimalist-skill` de lam lai portfolio theo style toi gian, nhieu khoang tho." |
| `redesign-skill` | Nang cap du an frontend san co theo huong premium ma khong vo giao dien hien huu. | "Dung `redesign-skill` de lam dep lai dashboard nay ma khong pha vo flow cu." |
| `soft-skill` | Rule thiet ke high-end agency, font, spacing, shadow, polish. | "Dung `soft-skill` de polish visual system cho trang pricing." |
| `stitch-skill` | Tao `DESIGN.md` semantic design system cho Google Stitch. | "Dung `stitch-skill` de viet `DESIGN.md` cho bo component moi." |
| `taste-skill` | Anti-slop frontend skill v2 cho landing page, portfolio, redesign. | "Dung `taste-skill` de thiet ke landing page dam chat hon, tranh kieu AI-safe." |
| `taste-skill-v1` | Ban v1 cua taste skill, giu de tuong thich voi workflow cu. | "Dung `taste-skill-v1` vi project nay dang theo workflow cu." |

### Debug, Review va Onboarding

| Skill | Cong dung | Vi du su dung |
|---|---|---|
| `bug-trace-root-cause` | Dieu tra bug tu trieu chung den nguyen nhan goc, tranh fix kieu va tam. | "Dung `bug-trace-root-cause` de tim vi sao API nay bi timeout ngau nhien." |
| `frontend-performance-review` | Review performance frontend, bat memory leak, cleanup thieu, render thua, lag va jank. | "Dung `frontend-performance-review` de kiem tra trang nay co memory leak hay re-render du thua khong." |
| `project-quick-onboard` | Nhan repo moi va tom tat nhanh stack, entrypoint, cau truc, flow chinh va cho nen doc truoc. | "Dung `project-quick-onboard` de onboard nhanh repo nay truoc khi sua code." |
| `solution-direction` | De xuat huong giai quyet cho van de, so sanh option va khuyen nghi huong di ma chua implement. | "Dung `solution-direction` de chi de xuat huong xu ly loi nay, chua can sua code." |

### Output va Workflow

| Skill | Cong dung | Vi du su dung |
|---|---|---|
| `output-skill` | Ep model xuat day du, tranh placeholder va cat ngan output. | "Dung `output-skill` de sinh day du toan bo component, khong duoc viet placeholder." |

### GSAP va Animation

| Skill | Cong dung | Vi du su dung |
|---|---|---|
| `gsap-core` | Huong dan dung GSAP core API cho animation co ban. | "Dung `gsap-core` de animate card vao man hinh bang `gsap.to()`." |
| `gsap-frameworks` | Dung GSAP trong Vue, Svelte va framework non-React. | "Dung `gsap-frameworks` de setup animation trong Nuxt page nay." |
| `gsap-performance` | Toi uu hieu nang animation GSAP, giam lag va layout thrash. | "Dung `gsap-performance` de toi uu scroll animation dang bi jank." |
| `gsap-plugins` | Huong dan cac plugin GSAP nhu ScrollTo, Flip, Draggable, SplitText. | "Dung `gsap-plugins` de them `SplitText` va `Flip` vao interaction nay." |
| `gsap-react` | Dung GSAP voi React, `useGSAP`, refs, cleanup. | "Dung `gsap-react` de viet lai animation hero trong component React nay." |
| `gsap-scrolltrigger` | Lam animation theo scroll, pin, scrub bang ScrollTrigger. | "Dung `gsap-scrolltrigger` de tao section pin theo scroll cho landing page." |
| `gsap-timeline` | Choreograph animation bang `gsap.timeline()`. | "Dung `gsap-timeline` de dong bo animation header, image va CTA." |
| `gsap-utils` | Su dung `gsap.utils` nhu clamp, mapRange, random, wrap. | "Dung `gsap-utils` de map gia tri scroll sang scale va opacity." |

## Goi y chon nhanh

Neu chua biet bat dau tu dau, co the map nhanh nhu sau:

| Nhu cau | Skill nen goi |
|---|---|
| Muon doc nhanh repo moi | `project-quick-onboard` |
| Muon tim nguyen nhan bug | `bug-trace-root-cause` |
| Muon xin huong giai quyet truoc khi lam | `solution-direction` |
| Muon review lag, leak, jank | `frontend-performance-review` |
| Muon redesign UI san co | `redesign-skill`, `taste-skill` |
| Muon len visual direction | `brandkit`, `soft-skill`, `minimalist-skill`, `brutalist-skill` |
| Muon generate concept bang hinh | `imagegen-frontend-web`, `imagegen-frontend-mobile` |
| Muon code frontend theo image tham chieu | `image-to-code-skill` |
| Muon lam animation GSAP | `gsap-core`, `gsap-timeline`, `gsap-scrolltrigger`, `gsap-react` |

## Metadata da them

De repo nay portable hon giua cac agent, da bo sung:

- [`skills/llms.txt`](./skills/llms.txt): file index de agent/tooling discover skill nhanh
- [`.claude-plugin/plugin.json`](./.claude-plugin/plugin.json): metadata cho Claude-style plugin discovery
- [`.cursor-plugin/plugin.json`](./.cursor-plugin/plugin.json): metadata cho Cursor-style plugin discovery
- [`AGENTS.md`](./AGENTS.md): convention de giu repo tiep tuc tuong thich da agent

## Thu muc lien quan

- [`install.sh`](./install.sh): copy skills vao thu muc cua agent duoc chon
- [`sync-from-local.sh`](./sync-from-local.sh): dong bo nguoc tu thu muc skill tren may local ve repo nay
- [`skills/`](./skills): noi chua tung skill
