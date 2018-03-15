--вывести всех преподавателей и их предметы
select People.* , Info_Subject.Name
from People, Teacher,Info_Subject ,Info_teacher_subject
where People.ID = Teacher.PersonID and
Info_teacher_subject.TeacherID = Teacher.ID and
Info_teacher_subject.SubjectID = Info_Subject.ID 

--телефоны только студентов 
select People.*,  Student_Phones.Phone
from People, Student, Student_Phones, Teacher
where People.ID = Student.PersonID and
People.ID != Teacher.PersonID and
Student_Phones.PersonID = People.ID


order by 2 desc

--Вывести группы и их студентов
select [Group].Name,Info_Specialization.Name, People.*
from Group_Person ,[Group], Info_Specialization,People,Student
where [Group].SpecializationID = Info_Specialization.ID and
Group_Person.GroupID = [Group].ID and
Group_Person.PersonID = Student.ID and 
People.ID = Student.PersonID

