use ELibrary;

create table author_master_tbl (
	author_id nvarchar(10) primary key,
	author_name nvarchar(50)
);

create table publisher_master_tbl (
	publisher_id nvarchar(10) primary key,
	publisher_name nvarchar(MAX)
);

create table admin_login_tbl (
	username nvarchar(50) primary key,
	password nvarchar(50),
	full_name nvarchar(50)
);

create table member_master_tbl (
	member_id nvarchar(10) primary key,
	full_name nvarchar(50),
	dob nvarchar(50),
	contact_no nvarchar(50),
	email nvarchar(50),
	state nvarchar(50),
	city nvarchar(50),
	pincode nvarchar(50),
	full_address nvarchar(50),
	password nvarchar(50),
	account_status nvarchar(50),
);

create table book_master_tbl (
	book_id nvarchar(10) primary key,
	book_name nvarchar(MAX),
	genre nvarchar(MAX),
	author_id nvarchar(10),
	publisher_id nvarchar(10),
	publish_date nvarchar(50),
	language nvarchar(50),
	edition nvarchar(MAX),
	book_cost nchar(10),
	no_of_pages nchar(10),
	book_description nvarchar(MAX),
	actual_stock nchar(10),
	current_stock nchar(10),
	book_img_link nvarchar(MAX)
);

create table book_issue_tbl (
	member_id nvarchar(10),
	book_id nvarchar(10),
	issue_date nvarchar(50),
	due_date nvarchar(50)
);

create table book_issue_request_tbl (
	member_id nvarchar(10),
	book_id nvarchar(10)
);

use elibrary;

insert into admin_login_tbl values('admin', 'admin', 'Admin');

-- Book constraint
alter table book_master_tbl add constraint fk_book_master_author foreign key (author_id) references author_master_tbl(author_id) on delete cascade;
alter table book_master_tbl add constraint fk_book_master_publisher foreign key (publisher_id) references publisher_master_tbl(publisher_id) on delete cascade;

-- Book issue constraint
alter table book_issue_tbl add constraint fk_book_issue_member foreign key (member_id) references member_master_tbl(member_id) on delete cascade;
alter table book_issue_tbl add constraint fk_book_issue_book foreign key (book_id) references book_master_tbl(book_id) on delete cascade;

alter table book_issue_request_tbl add constraint fk_book_issue_request_book foreign key (book_id) references book_master_tbl(book_id) on delete cascade;

drop procedure approve_issue_request;
GO;
create procedure approve_issue_request
@member_id nvarchar(10), @book_id nvarchar(10)
as
begin
	insert into book_issue_tbl values(@member_id, @book_id, CAST(GETDATE() AS date), CAST(DATEADD(day, 7, GETDATE()) as date)); -- Insert into book_issue_tbl with due date is 7 days from now
	delete from book_issue_request_tbl where member_id=@member_id AND book_id=@book_id;
	UPDATE book_master_tbl SET current_stock = current_stock - 1 WHERE book_id=@book_id;
end
GO;

insert into book_issue_request_tbl values('001', 'b005');
delete from book_issue_request_tbl where book_id='b002';

exec approve_issue_request @member_id='001', @book_id='b003';

delete from book_issue_tbl;
