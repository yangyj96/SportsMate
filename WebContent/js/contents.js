var calendar = document.getElementById("calendar");
var selectedButton = null;

function createCalendar(year, month) {
  var date = new Date(year, month, 1);
  var daysInMonth = new Date(year, month + 1, 0).getDate();
  var firstDayOfWeek = date.getDay();

  // 캘린더 테이블 생성
  var table = document.createElement("table");

  // 캘린더 헤더 생성
  var thead = document.createElement("thead");
  var tr = document.createElement("tr");
  var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
  for (var i = 0; i < 7; i++) {
    var th = document.createElement("th");
    th.textContent = daysOfWeek[i];
    tr.appendChild(th);
  }
  thead.appendChild(tr);
  table.appendChild(thead);

  // 캘린더 바디 생성
  var tbody = document.createElement("tbody");
  var tr = document.createElement("tr");
  for (var i = 0; i < firstDayOfWeek; i++) {
    var td = document.createElement("td");
    tr.appendChild(td);
  }
 for (var i = 1; i <= daysInMonth; i++) {
    var td = document.createElement("td");
    var button = document.createElement("button");  // 버튼 생성
    button.textContent = i;  // 버튼에 날짜 텍스트 추가
  	button.addEventListener('click', function() {
  selectButton(this);
  var date = new Date(year, month, i);
  console.log(date); // 버튼 클릭시 해당 날짜가 로그로 기록
  getEventData(date);
});
    td.appendChild(button);  // td 안에 버튼 추가
    tr.appendChild(td);
    if ((firstDayOfWeek + i - 1) % 7 == 6) {
      tbody.appendChild(tr);
      tr = document.createElement("tr");
    }
  }

  // 버튼의 스타일을 변경하는 코드 추가
 function selectButton(button) {
    if (selectedButton !== null) {
      deselectButton(selectedButton);
    }
    button.style.backgroundColor = '#3c77eb';
    button.style.color = '#ffffff';
    selectedButton = button;
  }

  function deselectButton(button) {
    button.style.backgroundColor = '';
     button.style.color ='';
    selectedButton = null;
  }

function getEventData(date) {
  // TODO: 해당 날짜의 이벤트 데이터를 가져오는 로직을 구현
}

  if (tr.children.length > 0) {
    tbody.appendChild(tr);
  }
  table.appendChild(tbody);

  // 캘린더를 영역에 추가
  calendar.appendChild(table);
}

// 현재 날짜를 기준으로 캘린더 생성
var today = new Date();
createCalendar(today.getFullYear(), today.getMonth());