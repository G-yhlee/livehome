DOCTYPE == document type
tag == 문서의 구조 결정
attribute == Tag를 보완하는 속성
element == element( tag + content )

html.lang:en-US
head
meta.charset:UTF-8
meta.name:keyword.content:키워드1,키워드2..구글엔진에검색되게해줌
meta.name:description.content:페이지설명글
meta.name:revised.content:2019년수정했음
meta.name:viewport.content:width=deivce-width
base.href:중복되는url적어두면a태그가중복부분은피할수있다
link.rel:stylesheet.href:./css/style.css

body
header
div.class:nm
nav|ul|(li.class|a.href)*3

단락: p|b|strong|i|em|mark|small|del|ins|sub|sup
단락 구분: hr|br
링크: 
a.href:url.target:_blank
a.href:"mailto: tut@gmail.com"
이미지: 
img.src:path
테이블: table.border:1 
| caption
| tr | th*3 
| tr | td*3 
| tr | td*3 
리스트:
ul.type:circle | li*5
ol.type:a | li*5
버튼:
button
.type:button
.onclick:"document.querySelector('#id').innerHTML = Date()"



합치기: .colsapn:2 , rowspan:1
테두리: .border:1.bordercolor:red
여백: .cellpadding:1.cellspacing:1
링크: .href:url
소스: .src:path
소스없을때출력: .alt:text
크기: .width:1 .height:1
마우스올리면텍스트: .title:text
.target:_blank
 

