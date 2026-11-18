# Inbodybuilder

친구들과 인바디 기반 2주 목표를 세우고, 매일 퀘스트를 해낼 때마다 결승선으로 달려가는 운동 챌린지.

- 화면: GitHub Pages (정적 사이트, `index.html` 하나)
- 로그인·기록 저장: Supabase (이메일 + 비밀번호, 실시간 반영)

## 처음 설정

### 1. Supabase
1. https://supabase.com 가입 → **New project** (지역은 Northeast Asia (Seoul) 추천)
2. **SQL Editor** → `schema.sql` 내용을 붙여넣고 **Run**
3. **Authentication → Sign In / Providers → Email** 에서 **Confirm email 끄기**
   (켜 두면 가입할 때마다 확인 메일이 가고, 무료 요금제는 메일 발송이 시간당 몇 통으로 제한돼요)
4. **Project Settings → API** 에서 Project URL 과 anon public 키를 복사해 `config.js` 에 넣기

### 2. GitHub Pages
1. GitHub 에서 새 저장소 `inbodybuilder` 만들기 (Public)
2. 이 폴더를 푸시
3. 저장소 **Settings → Pages → Branch: main / (root)** → Save
4. 1~2분 뒤 `https://<아이디>.github.io/inbodybuilder/` 로 접속

## 관리
- 누군가의 기록을 지우거나 고치려면 Supabase → **Table Editor → players** 에서 직접 수정
- 계정 삭제: Supabase → **Authentication → Users**
