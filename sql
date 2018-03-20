use DB01TEST01
create table reg_1349730
(
regid int identity primary key,
name varchar(30), 
dob date ,
gender varchar(6), 
h_add varchar(20), 
perc decimal) 


select*
from reg_1349730

create procedure reg_new
(@name varchar(30), 
@dob date ,
@gender varchar(6), 
@h_add varchar(20), 
@perc decimal,
@rid int out )
as
begin
insert into reg_1349730
values(@name,@dob,@gender,@h_add,@perc)
set @rid=@@identity;
end

create table stu_reg
(regid int identity(101,1) primary key,
 name varchar(30),
 city varchar(20))

 select*
 from stu_reg

 create procedure pro_stureg
 (@name varchar(20),
  @city varchar(20),
  @rid int out)
  as 
  begin
  insert into stu_reg
  values(@name,@city)
  set @rid=@@IDENTITY
  end
  
  create procedure pro_stuview
  as
  begin
  select  regid ,name,city
  from stu_reg
  end

  delete
  from stu_reg
 
  create procedure pro_studel
  @id int
  as
  begin 
  delete
  from stu_reg
  where regid=@id 
  end

  create procedure pro_stuupd
 (@nid int, 
  @nname varchar(20),
  @ncity varchar(20))
  as
  begin
  update stu_reg
  set name=@nname,
  city=@ncity
  where regid=@nid
  end
