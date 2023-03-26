// 데이터베이스 연결 정보
const config = {
  user: 'pp2',
  password: '123',
  connectString: 'localhost:1521/XE'
};

// 데이터베이스 연결
const oracledb = require('oracledb');
oracledb.getConnection(config, (err, connection) => {
  if (err) {
    console.error(err.message);
    return;
  }

  // 유저가 입력한 데이터
  const email = document.querySelector('#u_id').value;
  const password = document.querySelector('#pass').value;
  const name = document.querySelector('#last_name').value;
  const birthdate = document.querySelector('#date').value;
  const interest = document.querySelector('#date2').value;

  // SQL 쿼리 실행
  const sql = `INSERT INTO USER_INFO (USER_ID, EMAIL, PASSWORD, NAME, BIRTHDATE, INTEREST) VALUES (1, '${email}', '${password}', '${name}', '${birthdate}', '${interest}')`;
  connection.execute(sql, [], (err, result) => {
    if (err) {
      console.error(err.message);
      return;
    }

    console.log('Data inserted successfully.');

    // 다른 사이트로 이동
    window.location.href = 'https://example.com';
  });
});