--1. ���������� ����� � ����������� ����������� �������, �������-��� ��� ��� ���� �������������.

WITH Min_pages AS
(SELECT min(Books.Pages) AS count , Press.Name  FROM Books  INNER JOIN  Press  ON Press.Id = Books.Id_Press group by  Press.Name)

SELECT Books.Name,Books.Pages,Books.YearPress,Books.Quantity,Books.Comment , Press.Name
from   Min_pages INNER JOIN Books  INNER JOIN  Press   ON Press.Id = Books.Id_Press  ON Min_pages.count = Books.Pages


--2. ���������� �������� �����������, ������� ��������� ����� �� ������� ����������� ������� ������� 100.


3. ������� ����� ����� ������� ���� ��������� � ���������� ����, ���������� �������������� BHV � �����.
4. ������� ����� � ������� ���� ���������, ������� ����� ����� � ���������� ����� 1 ������ 2001 ���� � ������� �����.
5. ����� ���� ���������, ��� �� ������ ������ �������� � ������ "������ Windows 2000" ������ ����� ��������.
6. ���������� ���������� �� �������, ������� ����� ���� ������� (� ���������) ����� 600 �������.
7. ���������� ���������� �� �������������, � ������� ����� ����-������ ������� ���������� ��� ���� ������ 700.
8. ���������� ���� ����������� ���������� (� ��������� � �������-�������) � �����, ������� ��� �����.
9. ������� ������ ����������� ������(��) ����� ��������� � ������-���� ���� ����� ������, ������ � ����������.
10. ������� ������ ����������� ������(��) ����� �����������-��� � ���������� ���� ����� ������, ������ � ����������.
11. ������� ����� ����������(��) ��������(�) ����� ��������� � ��������������.
12. ���������� ���������� �������������� � ���������, ����-������ ����������.
13. ���� ������� ����� ���������� ���� � ���������� �� 100%, �� ���������� ����������, ������� ���� (� ���������� ���������) ���� ������ ���������.
14. ���������� ����� �������� ��������� � ����� �������� �������.
15. �������� ������ (��) ����� ���������� ���� ����� �������-������� � ���������.
16. ���������� �������� ����� ���������� ���� ����� �������-
������� � ���������.
17. �������� ���� ��������� � �������������� ����������.
18. �������� ��� ���������� � ��������� � ��������������,
������� �����.
19. �������� �����, ������� ����� � ������������� � ��������.
20. �������� ������� ���� ����� ������ �� �������������.