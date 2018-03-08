--1 ���������� ������ ������� ���� ��� ����������. ������������� �� �����������.

SELECT distinct(author) as [������]
FROM books
ORDER BY author

--2 ���������� ����� �� ���������������� ����������� ������ � �BHV�.
SELECT Name as [�������� ����] ,Press as [������������], Themes as [����]
FROM books
WHERE (Press like 'BHV' or  Press like '�����') and Themes like '����������������'
ORDER BY Press

--3. ���������� ��� �����, � ������� ���������� ������� ����� � �������� �� 200 �� 600.

SELECT Name as [�������� ����] , Pages as  [���������� �������]
FROM books
WHERE Pages BETWEEN 200 and  600
ORDER BY Pages

--4. ���������� ��� �����, ����� ������� ������� ����� 
--� ��������� �� ����� '�' �� '�'. ������������� �� ����������� (�� �������).

SELECT Name as [�������� ����] ,author as [������]
FROM books
WHERE author like '[�-�]%'
ORDER BY author

--5 ������� �����, ����������� � ���������������� ��� � ����� ������, 
--� ������������ ������� �� '�����' � �� '�����'.

SELECT Name as [�������� ����] ,Press as [������������], Themes as [����]
FROM books
WHERE (Themes like '����������������' or Themes like '���� ������') and (Press <> '�����' and Press <> '�����')
ORDER BY Press,Themes

--6. ������� �� ������� ��� ������� (��� ����������), � ������� � �����  �� ����� ���� ���� '�'.

SELECT distinct(author) as [������]
FROM books
WHERE author like '%�%�%'
ORDER BY author

--7. ���������� ���� ������� � �� �����. ������� ������������� �� �����������,
-- � �������� ���� (�� �������) �� �������� (��������� ����������).
SELECT Name as [�������� ����] ,author as [������]
FROM books
ORDER BY author,Name DESC 

--8. ������� �� ������� �����, �������� ������� ���������� � �����.
SELECT Name as [�������� ����]
FROM books
WHERE Name like '[0-9]%'
ORDER BY Name 

--9. ������� �� ������� �����, �������� ������� ������������� �� ������ �����.

SELECT Name as [�������� ����]
FROM books
WHERE Name like '%[0-9][0-9][0-9][0-9]'
ORDER BY Name 

--10. ������� �� ������� �����, � ��������� ������� ����� ��� �����.
SELECT Name as [�������� ����]
FROM books
WHERE Name like '%[0-9]%[0-9]%' and Name not like  '%[0-9]%[0-9]%[0-9]%'
ORDER BY Name

--11. ������� �� ������� �����, ������� ������� � ������� � ������������ ����������. 
--������������� �� �����������.

SELECT Name as [�������� ����], Quantity as [����������]
FROM books
WHERE Quantity = 1 
ORDER BY Name

--12. ������� �� ������� ����� �� ����������������, 
--�� ����������� � ������������ �BHV�, � ��������� ������� ���� ����� �Visual�.

SELECT Name as [�������� ����], Themes as [����], Press as [������������]
FROM books
WHERE Themes like '����������������' and Press not like 'BHV' and Name like '%Visual%'
ORDER BY Name

--13. ���������� ����� �� ���������������� � Web-�������,
-- ������� ��������� � ������������� �BHV� � ������.

SELECT Name as [�������� ����], Themes as [����], Press as [������������]
FROM books
WHERE (Themes like '����������������' or Themes like 'Web-������')and   (Press like 'BHV' or Press like '�����')
ORDER BY Name,Themes

--14. ������� �����, ���������� ������������� ��� ������������.
SELECT Name as [�������� ����], Comment 
FROM books
WHERE Comment like '%����������%' or Comment like '%�����������%'
ORDER BY Name,Comment

--15. ���������� �����, �������� ������� ���������� �� ���������� �����.
SELECT Name as [�������� ����]
FROM books
WHERE Name like '[A-Z]%' 
ORDER BY Name

--16. ���������� �����, �������� ������� ������������� �� ������� �����.
SELECT Name as [�������� ����]
FROM books
WHERE Name like '%[�-�]' 
ORDER BY Name

--17. ���������� �����, � �������� ������������ ������� ����� ��� �������.

SELECT Name as [�������� ����], Press as [������������]
FROM books
WHERE Press like '___' 
ORDER BY Press

--18. ���������� ����� �� ���������������� �� ����������� ���� �� Pascal � Delphi.

SELECT Name as [�������� ����], Themes as [����]
FROM books
WHERE Themes  like '����������������'  and (Name not like '%Pascal%' and Name not like '%Delphi%')
ORDER BY Themes

--19. �������� � ������� ��������� �����:
INSERT INTO books ( name, yearpress, themes, author, press, comment, quantity )
VALUES ('SQL', 2004, '���� ������', '������', '�����', '��������� ����������', 3);
