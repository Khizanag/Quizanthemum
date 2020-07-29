// // Get the modal
// var modal = document.getElementById("myModal");

// // Get the button that opens the modal
// var btn = document.getElementById("friend-list-btn-id");

// // Get the <span> element that closes the modal
// var span = document.getElementsByClassName("close")[0];

// // When the user clicks on the button, open the modal
// btn.onclick = function() {
//   modal.style.display = "block";
// }

// // When the user clicks on <span> (x), close the modal
// span.onclick = function() {
//   modal.style.display = "none";
// }

// // When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
//   if (event.target == modal) {
//     modal.style.display = "none";
//   }
// }
function popupfriendList(){
  document.getElementById("friends-list-popup-id").classList.toggle("active");
}

function removeFriend(d){
  $(d).parent().parent().remove();
}
function redirectToQuiz(){
  window.location.href="QuizSummaryPage.jsp";
}
function redirectToProfPage(){
  window.location.href="web/pages/profilePageLogged.jsp";
}