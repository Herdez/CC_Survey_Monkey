user1 = User.create(name: "Ivan", email: "ivan@gmail.com", password: "ivanhoff")
user2 = User.create(name: "Herdez", email: "herdez@gmail.com", password: "herdez")

survey1 = Survey.create(title: "Nacional")
survey2 = Survey.create(title: "Global")

question1 = Question.create(question: "Grupo de edad", survey_id: survey1.id)
question2 = Question.create(question: "Genero", survey_id: survey1.id)

option1 = Option.create(option: "18-25", question_id: question1.id)
option2 = Option.create(option: "26-35", question_id: question1.id)

record = Record.create(survey_id: survey1.id)
user1.records << record

stat1 = Stat.create(responder_id: user1.id, survey_id: survey1.id, choice: option1.id, question_id: question1.id)

stat2 = Stat.create(responder_id: user2.id, survey_id: survey1.id, choice: option2.id, question_id: question1.id)





