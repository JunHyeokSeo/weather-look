select * from daily;
select * from review;
select * from community;

-------------------------------------------------------------
-- ���������� �۾�, �ֽż� ���ϸ�, �����ı� (�����ִ� ���̺� ���)
select * from
(select rownum rnum, m1.* from
(select 'daily' as type_name, post_id, title, reg_date from daily
union
select 'review' as type_name, post_id, title, reg_date from review
order by reg_date desc) m1)
where rnum >=1 and rnum <= 4
;

-- �� ��� ī����
select count(*) maincount from
(select 'daily' as type_name, post_id, title, reg_date from daily
union
select 'review' as type_name, post_id, title, reg_date from review
order by reg_date desc)
;