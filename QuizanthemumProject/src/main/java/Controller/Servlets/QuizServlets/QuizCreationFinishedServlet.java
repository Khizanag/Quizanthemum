package Controller.Servlets.QuizServlets;

import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User.AchievementEvent;
import Model.Managers.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static Configs.AchievementTypes.*;
import static Configs.Config.*;

@WebServlet(name = "QuizCreationFinishedServlet", urlPatterns = "/QuizCreationFinished")
public class QuizCreationFinishedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QuizCreationFinished ->");
        ServletContext context = request.getServletContext();
        Quiz quiz = (Quiz) context.getAttribute(QUIZ_CREATING_NOW);
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        QuestionManager questionManager = (QuestionManager) managersManager.getManager(QUESTION_MANAGER_STR);
        UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);
        int ID = quizManager.insertQuiz(quiz);
        quiz.setID(ID);

        int numQuestions = quiz.getQuestionsCount();
        for(int i = 0; i < numQuestions; i++){
            Question question = quiz.getQuestion(i);
            question.setQuizID(ID);
            questionManager.insertQuestion(question);
        }

        quiz.finishCreatingQuiz();
        addAchievement(quiz.getAuthor().getID(), usersManager, managersManager);

        context.removeAttribute(QUIZ_CREATING_NOW);

        context.setAttribute(LAST_CREATED_QUIZ, quiz);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/Quiz?id=" + ID);

    }

    private void addAchievement(int writerID, UsersManager usersManager, ManagersManager managersManager) {
        AchievementEventsManager achievementEventsManager = (AchievementEventsManager) managersManager.getManager(ACHIEVEMENT_EVENTS_MANAGER_STR);
        int numQuizzesCreated = usersManager.getQuizzesMadeCount(writerID);
        AchievementEvent newAchievementEvent;
        switch (numQuizzesCreated) {
            case 5:
                newAchievementEvent = new AchievementEvent(-1, KNOWLEDGE_SPREADER_BRONZE, writerID, new Date());
                break;
            case 15:
                newAchievementEvent = new AchievementEvent(-1, KNOWLEDGE_SPREADER_SILVER, writerID, new Date());
                break;
            case 30:
                newAchievementEvent = new AchievementEvent(-1, KNOWLEDGE_SPREADER_GOLD, writerID, new Date());
                break;
            default:
                return;
        }

        achievementEventsManager.insertAchievementEvent(newAchievementEvent);
    }
}
