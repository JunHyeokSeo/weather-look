select * from daily;
select * from likes;

--1�� ��ü ����Ʈ ���
select type_id, post_id, reg_date, title, nick from daily
union
select type_id, post_id, reg_date, title, nick from review
order by reg_date desc;

--2�� ���� ���
select rownum rnum, r1.* from(
select type_id, post_id, reg_date, title, nick from daily
union
select type_id, post_id, reg_date, title, nick from review
order by reg_date desc) r1;

-- 3�� ���� ����
select type_id, post_id, reg_date, title, nick from(
select rownum rnum, r1.* from(
select type_id, post_id, reg_date, title, nick from daily
union
select type_id, post_id, reg_date, title, nick from review
order by reg_date desc) r1
) where rnum >= 1 and rnum <= 9;

-- ���ƿ� ī����
select type_id, post_id, count(*) likes_count from likes group by type_id, post_id;

-- 4�� ���ƿ� ���̺� ����
select r2.*, nvl(likes_count,0)likes from
(select type_id, post_id, reg_date, title, nick from(
select rownum rnum, r1.* from(
select type_id, post_id, reg_date, title, nick from daily
union
select type_id, post_id, reg_date, title, nick from review
order by reg_date desc) r1
) where rnum >= 1 and rnum <= 9) r2
left join 
(select type_id, post_id, count(*) likes_count from likes group by type_id, post_id) l1
on
r2.type_id = l1.type_id and r2.post_id = l1.post_id
;