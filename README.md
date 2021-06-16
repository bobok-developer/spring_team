# spring_team
스프링을 이용한 독서실 운영/관리 사이트 (최종 팀 프로젝트)

https://zaksal.levinni.site

(맡은 부분- 이용자와 관리자의 좌석/사물함 기능)

## ✨ 개요
- Spring Framework와 Bootstrap4, Oracle DB, Javascript 등을 이용했습니다.
- 설계 단계에서 작성한 문서는 [요구사항정의서](https://docs.google.com/spreadsheets/d/1chBl82uc50fDkP0AaRvvIVjLoho__hTbyNSMKHG-swc/edit?usp=sharing)와 [테이블명세서](https://docs.google.com/spreadsheets/d/11s8QidkAVAYh9vcFszlpW8211ZFeKqK0_ljiuiNq2Ww/edit?usp=sharing)가 있으며 구현 완료 후 [테스트케이스](https://docs.google.com/spreadsheets/d/1KaEjcrPBIjrSLesCaJChASqdTQFlX-rlrSJKvKLitmw/edit?usp=sharing)를 작성하였습니다.
<br>

![](https://images.velog.io/images/admin99/post/52b5fab1-3756-4b9f-97fc-f4c1fb0949e8/image.png)



- 제가 맡은 부분은 좌석/사물함 기능이며, _이용자_의 **좌석/사물함 등록**과 **이용 기간 연장**, **좌석 변경**과 _관리자_의 회원 중 **미등록 회원의 좌석/사물함 등록**, **이용 회원의 이용 등록 취소**, **이용자의 사물함 등록 취소**를 구현하였습니다.
<br>

---

## 🍍 설명
- 전체적인 사이트 조회는 비회원도 가능하며, 좌석/사물함을 등록할 때와, 게시글 작성은 로그인이 필요합니다.
- 관리자 계정으로 로그인 시 관리 페이지로 이동할 수 있고 데이터 시각화를 통해 **이용자 수 현황**과, **매출 현황**을 확인할 수 있습니다.

<br>


### 1. 이용자의 좌석/사물함 이용
#### 1.1. 좌석/사물함 등록
- 약관 동의를 거치고 회원 가입을 완료하고 로그인을 하면 등록이 가능합니다.

<br>

![](https://images.velog.io/images/admin99/post/afdf760d-6912-4549-b46b-04fa624d4c91/image.png)

<br>

✔ 모든 입력란은 유효성 검증이 적용되어 있고, 모두 입력해야 가입할 수 있습니다. 또한, 아이디 중복확인도 거쳐야 합니다.

✔ 주소 입력은 Daum 주소 API를 이용하였습니다.

<br>


![](https://images.velog.io/images/admin99/post/af40f00b-b041-498c-af76-2534ed93550d/image.png)

<br>

✔ Oauth2를 이용한 네이버 로그인이 가능합니다. 현재는 실제 서비스를 위한 네이버의 검수요청을 거치지 않은 '개발 상태'이기 때문에 테스트 아이디로 등록된 네이버 계정만 로그인 할 수 있습니다.

<br>

---

![](https://images.velog.io/images/admin99/post/568158fe-6e42-4c44-ba46-fc16191b7565/image.png)

<br>

✔ 좌석등록/이용 페이지에서 등록할 수 있으며 좌석을 등록할 때 사물함 이용 여부를 결정해야 합니다. (좌석 등록 후에 사물함을 추가로 등록할 수 없습니다.)

<br>

![](https://images.velog.io/images/admin99/post/0bf402df-3a1e-4da2-991e-0ff3806e46f9/image.png)

<br>

✔ 결제는 이니시스 결제 API를 이용했으며, 테스트를 위해 실결제는 하지 않고, X 버튼을 누르면 테스트 결제가 실행됩니다.

✔ 동시 등록을 막기 위해 좌석을 선택하고 결제 페이지로 넘어갔을 때 '가결제 상태'로 만들었는데, 이 때 좌석 배치도에서 '이용중'이라고 표시됩니다. 10분 내에 결제가 완료되지 않으면 로그아웃 처리 되고, 쿼츠 라이브러리를 이용해 10분마다 가결제된 상태를 지우도록 했습니다.

<br>

---
#### 1.2 좌석 이용 기간 연장

![](https://images.velog.io/images/admin99/post/ed1966f7-0b95-4206-b72b-18b9c743b026/image.png)

<br>

✔ 기간 연장 페이지에서는 현재 이용 중인 좌석 번호와, 사물함 번호, 이용 만료일을 확인할 수 있습니다. 사물함만 따로 연장할 수 없으며 좌석 기간과 함께 연장됩니다. 등록 때와 마찬가지로 결제 API를 거쳐야 기간 연장이 완료됩니다.

<br>

---
#### 1.3 좌석 변경

![](https://images.velog.io/images/admin99/post/cf79b9d1-e49b-4239-856f-a61a4c8e28a3/image.png)


<br>


✔ 좌석 변경 페이지에서는 만료일과 현재 이용중인 좌석을 확인할 수 있고 좌석 배치도에서 이동할 좌석의 변경 버튼을 누르면 변경됩니다.

<br>

---

### 2. 관리자의 좌석/사물함 관리
#### 2.1 미등록 회원의 좌석 등록과, 이용 중인 회원의 이용 등록 취소
![](https://images.velog.io/images/admin99/post/1d40f3e5-233b-40ac-a3f4-da93424c41d0/image.png)

✔ 회원 중에 현재 좌석을 이용하지 않고 있는 회원의 목록이 보이고 회원의 이름을 누르면 목록과 좌석배치도 사이에 등록 폼이 뜹니다.

✔ 목록에서 회원 이름으로 검색할 수 있습니다.

<br>

![](https://images.velog.io/images/admin99/post/e15ae0f4-81c4-42dc-8cc9-a21c415b7dc1/image.png)

<br>

✔ 좌석배치도에서 좌석을 선택하면 자동으로 '희망 좌석번호' 폼에 입력되고 나머지 부분들을 체크한 후 등록 버튼을 누르면 관리자가 회원을 대신하여 등록할 수 있습니다. 관리자가 등록할 때에는 결제 API를 이용하지 않습니다.

✔ 좌석 배치도에서 '등록 취소'를 누르면 이용하고 있던 좌석과 사물함이 모두 취소 되고 미등록 회원으로 분류됩니다.

<br>

---
#### 2.2 사물함 등록 취소
- 좌석 등록 시 함께 등록했던 사물함을 취소할 수 있습니다.

<br>

![](https://images.velog.io/images/admin99/post/fcb4dbac-5cf6-4727-9e66-12b33bbc446a/image.png)
<br>

✔ 2.1의 이용등록 취소와 다른 점은, 이용 중인 사물함만 취소되기 때문에 '미등록 회원'으로 분류되지 않습니다.
<br>

---
