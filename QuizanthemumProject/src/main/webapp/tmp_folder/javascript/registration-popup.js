// https://www.youtube.com/watch?v=MBaw_6cPmAw used
const openRulesEvent = document.querySelectorAll('[data-rules-target]');
const closeRulesEvent = document.querySelectorAll('[close-rules]');
const popUpElem = document.getElementById('popup');

openRulesEvent.forEach(button => {
  button.addEventListener('click', () => {
    const rules = document.querySelector(button.dataset.rulesTarget);
    if (rules == null) {
      return;
    }
    rules.classList.add('active');
    popUpElem.classList.add('active');
  });
});

closeRulesEvent.forEach(button => {
  button.addEventListener('click', () => {
    const rules = button.closest('.rules');
    if (rules == null) {
      return;
    }
    rules.classList.remove('active');
    popUpElem.classList.remove('active');
  });
});
