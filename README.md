�������� �������.
����������� ���� ���������� � Rails 5, PostgreSQL.
���� ���������� � ����������.
���������� ����������� ����������� CMS � Content Management System. ������������ �����
���������-�������������-�������������-������� (CRUD) �������� ����������.
����������� ����� ��������� ��������:
� title � ������ ��� ����������� � /html/head/title.
� description � ������ ��� ����������� � /html/head/meta{name='description'}
� slug � ������, �������� URL ��������������� ��������. �� ����, ������ URL ����
�http://127.0.0.1:3000/1� ����� �������������� URL ���� �http://127.0.0.1:3000/#{slug}�
� menu_label � ������ ��� ����������� ������ �� ������ ������ � ������� ����
����������
� h1 � ������ ��� ����������� � /html/body/h1
� content � HTML ���, ���������� ���������� ��������. �������������� ������� ����
������������ � ������� HTML.
� published_at � ���� � ����� ��� ���������� ������ ��������.
� priority � �����, ��������������� ���������� ������ ��������.
��� ������������� ������������� ���� �������������, ��������� �������������� � �.� - ����
���������� ���������� �������� ��������.
��������� WEB �������������:
� menu:
� ������ ������ �� �������������� (published_at >= NOW()) �������� ����������,
��������������� �� �������������� (priority �������).
� ������ ������������/�������� (toogle) ������ � ���� �� ����������������
��������.
� ������ ���������� ����� ��������.
� content view:
� ����������� ������� ��������.
� ������ �������������� ������� ��������.
� ������ �������� ������� ��������.
� content edit:
� ����� �������������� ������� ��� ����� ��������.
� ������ �Save� � �Cancel�.