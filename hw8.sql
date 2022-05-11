create table class
(
    class_id int not null
        primary key
);

create table student_address
(
    id         int auto_increment
        primary key,
    street     varchar(20) null,
    number     int         not null,
    town       varchar(20) null,
    zip_code   int         not null,
    state      varchar(15) null,
    student_id int         not null
);

create table student
(
    student_id int         not null
        primary key,
    firstname  varchar(15) null,
    lastname   varchar(15) null,
    grade_id   int         null,
    constraint student_ibfk_2
        foreign key (student_id) references student_address (student_id)
);

create index student_id
    on student_address (student_id);

create table student_class_association
(
    id         int auto_increment
        primary key,
    student_id int not null,
    class_id   int not null,
    constraint id
        unique (id),
    constraint student_class_association_ibfk_1
        foreign key (student_id) references student (student_id),
    constraint student_class_association_ibfk_2
        foreign key (class_id) references class (class_id)
);

create index class_id
    on student_class_association (class_id);

create index student_id
    on student_class_association (student_id);


