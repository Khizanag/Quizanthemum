<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/29/20
  Time: 06:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="friends-list-popup" id="friends-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
        <div class="close-btn" onclick="popupfriendList()">&times;</div>
        <h1 style="color:orange">მეგობრები</h1>
        <br>
        <div class = "friend-list-row">
            <span>მეგობარი0</span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn" id="challenge-btn-id-1" onclick="challengeFriend()">Challenge</button>
                <button class="remove-btn" id="remove-btn-id-1" onclick="removeFriend(this)">Remove</button>
            </div>
        </div>
        <div class = "friend-list-row">
            <span>მეგობარი1</span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn" id="challenge-btn-id-2" onclick="challengeFriend()">Challenge</button>
                <button class="remove-btn" id="remove-btn-id-2" onclick="removeFriend(this)">Remove</button>
            </div>
        </div>
        <div class = "friend-list-row">
            <span>მეგობარი2</span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn" id="challenge-btn-id-3" onclick="challengeFriend()">Challenge</button>
                <button class="remove-btn" id="remove-btn-id-3" onclick="removeFriend(this)">Remove</button>
            </div>
        </div>
    </div>
</div>