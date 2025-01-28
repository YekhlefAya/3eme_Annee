const questions = [
  {
    question: "Quel est la capitale de la France ?",
    options: ["Paris", "Londres", "Rome"],
    answer: 0,
  },
  {
    question: "Combien de continents existe-t-il ?",
    options: ["5", "6", "7"],
    answer: 2,
  },
  {
    question: "Le langage de programmation JS signifie ?",
    options: ["JavaScript", "Java", "JScript"],
    answer: 0,
  },
];

let currentQuestion = 0;
let score = 0;

const quizQuestion = document.getElementById("quizQuestion");
const quizOptions = document.getElementById("quizOptions");
const nextButton = document.getElementById("nextButton");
const quizScore = document.getElementById("quizScore");

function renderQuestion() {
  const question = questions[currentQuestion];
  quizQuestion.textContent = question.question;

  quizOptions.innerHTML = "";
  question.options.forEach((option, index) => {
    const button = document.createElement("button");
    button.textContent = option;
    button.onclick = () => checkAnswer(index);
    quizOptions.appendChild(button);
  });
}

function checkAnswer(selected) {
  const correct = questions[currentQuestion].answer;
  if (selected === correct) {
    score++;
  }
  currentQuestion++;
  nextButton.disabled = false;
  nextButton.hidden = false;
}

nextButton.addEventListener("click", () => {
  if (currentQuestion < questions.length) {
    renderQuestion();
  } else {
    quizQuestion.textContent = "Quiz Terminé !";
    quizOptions.innerHTML = "";
    quizScore.textContent = `Score: ${score}`;
    quizScore.hidden = false;
    nextButton.hidden = true;
  }
  nextButton.disabled = true;
});

renderQuestion();
