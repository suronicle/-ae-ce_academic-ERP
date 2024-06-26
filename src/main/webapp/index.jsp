<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>[æ]ce</title>
<meta charset="utf-8">

<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
    }
    .description {
        text-align: left;
        margin-right: 20px;
    }
    .button {
        margin-top: 20px;
        padding: 15px 30px; /* 크기 조정 */
        font-size: 16px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 25px; /* 둥근 버튼 모양으로 변경 */
        cursor: pointer;
        transition: background-color 0.3s ease;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        margin-left: auto; /* 가운데 정렬 */
        margin-right: auto; /* 가운데 정렬 */
        display: block; /* 블록 요소로 변환 */
    }
    .button:hover {
        background-color: #0056b3;
    }
    .button:active {
        transform: translateY(1px); /* 클릭 효과 추가 */
    }
    img {
        width: 300px;
        height: auto;
        margin-bottom: 20px;
    }
    @media screen and (max-width: 600px) {
        .container {
            flex-direction: column;
            align-items: center;
        }
        .description {
            text-align: center;
            margin-right: 0;
            margin-bottom: 20px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="description">
            <h1 style="font-size: 24px; color: #333;">[æ]ce</h1>
            <p style="font-size: 16px; color: #666;">학원 관리 시스템</p>
            <p style="font-size: 14px; color: #888;">Academic Enterprise Resource Planning의 약자로, 학원의 각종 업무를 체계적으로 관리하고 효율적으로 운영할 수 있는 시스템입니다.</p>
        </div>
        <div>
            <img src="${contextPath}/resources/dist/img/person.png" alt="person">
            <br>
            <button onclick="deleteSession()" class="button">시작하기</button>
    </div>
        </div>

<script>
function deleteSession() {
    // 세션 정보 삭제
    <% session.invalidate(); %>
    // 페이지 이동
    window.location.href = 'http://localhost:8081/project/main?userId=';
}
</script>

</body>
</html>
