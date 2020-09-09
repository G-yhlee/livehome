defmodule ServerWeb.NoteLive do
  use ServerWeb, :live_view
  alias ServerWeb.V
  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      o1: %{+: 0, -: 0,state: 0}
      )
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= V.render("menu.html", c: assigns) %> <br><BR>
    <%= {:safe,renderp()} %>

    """
  end


  def ax do
    "color"
  end
  def ax2 do
    "red"
  end
  def renderp do
    """
    TO DO LIST <BR>
    <button style="#{ax()}: #{ax2()}; background-color: black;text-align: center">
    stock pid => test pid 데이터 전달
    </button>
    <button style="color: white; background-color: black;text-align: center">
    테스트 기능 추가
    </button>
    <button style="color: white; background-color: black;text-align: center">
     html 태그 제작 모듈 제작하기
    </button>
    <button style="color: white; background-color: black;text-align: center">
    속도 및 안정성 향상
    </button>
    <BR><BR>

    LIVE STOCK <BR>
    <button style="color: white; background-color: black;text-align: center">
    그래프 기능 추가
    </button>
    <button style="color: white; background-color: black;text-align: center">
    검색 / 선별 저장 기능 추가
    </button>
    <button style="color: white; background-color: black;text-align: center">
    테이블 조작 기능 추가 (오름차순, 내림 차순 정렬)
    </button>
    <button style="color: white; background-color: black;text-align: center">
    회원정보 , 의견 기록 기능 추가
    </button>
    <BR><BR>
    LIVE TETRIS <BR>
    <button style="color: white; background-color: black;text-align: center">
    일단 만들자
    </button>

    <BR><BR>
    아이디어 노트<BR>
    <button style="color: white; background-color: black;text-align: center">
    [ I-U 인터렉션 ]로컬 환경에서의 인터렉션이 웹에서의 특정 사용자에게 전달되도록 하는 방법 찾기
    즉, 내 화면의 인터렉션이 다른 pc에서 복제되어 움직이게 구성
    </button>
    <button style="color: white; background-color: black;text-align: center">
    [ 한글 암호화 편지 ] 한글문장 자동 암호화
    </button>
    <button style="color: white; background-color: black;text-align: center">
    [ tetris+chemical block ] 화학 원소 블록 테스트 시뮬레이션
    </button>
    <button style="color: white; background-color: black;text-align: center">
    [ 헥사로그 ] 헥사블로그,채팅
    </button>
    <button style="color: white; background-color: black;text-align: center">
    [ 하스stock ] 카드형태, 공격카드, 방어카드, 비밀카드, 배당카드, 기술주카드, 카드중앙에 관련뉴스,소식, 카드 용량 늘릴경우 과금형태, 기본 10장까지, 유사한 카드 보유자 의견교환
    </button>

    <BR><BR>

    만들것 <BR>
    <button style="color: white; background-color: black;text-align: center">
    토익 문제 노트
    </button>
    <button style="color: white; background-color: black;text-align: center">
    아이디어 노트
    </button>

    <BR><BR>

    TEST ON<BR>
    <button style="color: white; background-color: black;text-align: center">
    <%= inspect assigns |> Map.keys %>
    </button>
    <button style="color: white; background-color: black;text-align: center">
    <%= inspect assigns.o1 |> Map.keys %>
    </button>


    <BR><BR>

    TEST ON<BR>
    <button style="color: white; background-color: black;text-align: center">
    diode view number = 90~100
    </button>

    """
  end


end
