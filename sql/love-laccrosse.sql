/*
 * コメントは
 * comment "この中に書く"
 */
set names utf8;
set foreign_key_checks=0;
drop database if exists laccrosse;
create database if not exists laccrosse;
use laccrosse;

create table user_info(
    id int not null primary key auto_increment comment "ID",
    user_id varchar(16) unique not null comment "ユーザーID",
    password varchar(16) not null comment "パスワード",
    family_name varchar(32) not null comment "姓",
    first_name varchar(32) not null comment "名",
    family_name_kana varchar(32) not null comment "姓かな",
    first_name_kana varchar(32) not null comment "名かな",
    email varchar(32) comment "メールアドレス",
    status tinyint default 0 comment "ステータス",
    login_flag tinyint not null default 0 comment "ログインフラグ",
    regist_date datetime comment "登録日",
    update_date datetime comment "更新日"
)
default charset=utf8
comment="会員情報テーブル";
insert into user_info values
(1,"test","test","原","裕介","はら","ゆうすけ","hara@gmail.com",0,0,now(),now()),
(2,"test2","test2","原田","雄三","はらだ","ゆうぞう","harada@gmail.com",0,0,now(),now()),
(3,"test3","test3","河原田","裕太","かわはらだ","ゆうた","kawaharada@gmail.com",0,0,now(),now());
create table product_info(
    id int not null primary key auto_increment ,
    product_id int unique not null,
    product_name varchar(100) unique not null,
    category_id int not null,
    category_name varchar(100) not null,
    price int not null,
    image_file_path varchar(100) not null,
    image_file_name varchar(50) not null,
    release_date datetime comment "発売年月",
    status tinyint default 1 comment "ステータス",
    regist_date datetime comment "登録日",
    update_date datetime comment "更新日",
    foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment "商品情報テーブル";
insert into product_info values
( 1, 1,"shaft1",1,"shaft",1000,"./images/shaft","shaft1.jpg",now(),1,now(),now()),
( 2, 2,"shaft2",1,"shaft",1000,"./images/shaft","shaft2.jpg",now(),1,now(),now()),
( 3, 3,"shaft3",1,"shaft",1000,"./images/shaft","shaft3.jpg",now(),1,now(),now()),
( 4, 4,"shaft4",1,"shaft",1000,"./images/shaft","shaft4.jpg",now(),1,now(),now()),
( 5, 5,"shaft5",1,"shaft",1000,"./images/shaft","shaft5.jpg",now(),1,now(),now()),
( 6, 6,"shaft6",1,"shaft",1000,"./images/shaft","shaft6.jpg",now(),1,now(),now()),
( 7, 7,"shaft7",1,"shaft",1000,"./images/shaft","shaft7.jpg",now(),1,now(),now()),
( 8, 8,"shaft8",1,"shaft",1000,"./images/shaft","shaft8.jpg",now(),1,now(),now()),
( 9, 9,"shaft9",1,"shaft",1000,"./images/shaft","shaft9.jpg",now(),1,now(),now()),
( 10, 10,"shaft10",1,"shaft",1000,"./images/shaft","shaft10.jpg",now(),1,now(),now()),
( 12, 12,"head1",2,"head",1000,"./images/head","head1.jpg",now(),1,now(),now()),
( 13, 13,"head2",2,"head",1000,"./images/head","head2.jpg",now(),1,now(),now()),
( 14, 14,"head3",2,"head",1000,"./images/head","head3.jpg",now(),1,now(),now()),
( 15, 15,"head4",2,"head",1000,"./images/head","head4.jpg",now(),1,now(),now()),
( 16, 16,"head5",2,"head",1000,"./images/head","head5.jpg",now(),1,now(),now()),
( 17, 17,"head6",2,"head",1000,"./images/head","head6.jpg",now(),1,now(),now()),
( 18, 18,"helmet1",3,"helmet",1000,"./images/helmet","helmet1.jpg",now(),1,now(),now()),
( 19, 19,"helmet2",3,"helmet",1000,"./images/helmet","helmet2.jpg",now(),1,now(),now()),
( 20, 20,"helmet3",3,"helmet",1000,"./images/helmet","helmet3.jpg",now(),1,now(),now()),
( 21, 21,"helmet4",3,"helmet",1000,"./images/helmet","helmet4.jpg",now(),1,now(),now()),
( 22, 22,"helmet5",3,"helmet",1000,"./images/helmet","helmet5.jpg",now(),1,now(),now()),
( 23, 23,"helmet6",3,"helmet",1000,"./images/helmet","helmet6.jpg",now(),1,now(),now()),
( 24, 24,"gloves1",4,"gloves",1000,"./images/gloves","gloves1.jpg",now(),1,now(),now()),
( 25, 25,"gloves2",4,"gloves",1000,"./images/gloves","gloves2.jpg",now(),1,now(),now()),
( 26, 26,"gloves3",4,"gloves",1000,"./images/gloves","gloves3.jpg",now(),1,now(),now()),
( 27, 27,"gloves4",4,"gloves",1000,"./images/gloves","gloves4.jpg",now(),1,now(),now()),
( 28, 28,"gloves5",4,"gloves",1000,"./images/gloves","gloves5.jpg",now(),1,now(),now()),
( 29, 29,"gloves6",4,"gloves",1000,"./images/gloves","gloves6.jpg",now(),1,now(),now()),
( 30, 30,"apparel1",5,"apparel",1000,"./images/apparel","apparel1.jpg",now(),1,now(),now()),
( 31, 31,"apparel2",5,"apparel",1000,"./images/apparel","apparel2.jpg",now(),1,now(),now()),
( 32, 32,"apparel3",5,"apparel",1000,"./images/apparel","apparel3.jpg",now(),1,now(),now()),
( 33, 33,"apparel4",5,"apparel",1000,"./images/apparel","apparel4.jpg",now(),1,now(),now()),
( 34, 34,"apparel5",5,"apparel",1000,"./images/apparel","apparel5.jpg",now(),1,now(),now()),
( 35, 35,"apparel6",5,"apparel",1000,"./images/apparel","apparel6.jpg",now(),1,now(),now()),
( 36, 36,"shoes1",6,"shoes",1000,"./images/shoes","shoes1.jpg",now(),1,now(),now()),
( 37, 37,"shoes2",6,"shoes",1000,"./images/shoes","shoes2.jpg",now(),1,now(),now()),
( 38, 38,"shoes3",6,"shoes",1000,"./images/shoes","shoes3.jpg",now(),1,now(),now()),
( 39, 39,"shoes4",6,"shoes",1000,"./images/shoes","shoes4.jpg",now(),1,now(),now()),
( 40, 40,"shoes5",6,"shoes",1000,"./images/shoes","shoes5.jpg",now(),1,now(),now()),
( 41, 41,"shoes6",6,"shoes",1000,"./images/shoes","shoes6.jpg",now(),1,now(),now());
create table cart_info(
    id int not null primary key auto_increment comment "ID",
    user_id varchar(16) not null comment "ユーザーID",
    product_id int not null comment "商品ID",
    product_count int not null comment "個数",
    product_color varchar(16) not null comment "色",
    price int comment "金額",
    regist_date datetime comment "登録日",
    update_date datetime comment "更新日",
    foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="カート情報テーブル";
create table purchase_history_info(
    id int not null primary key auto_increment comment "ID",
    user_id varchar(16) not null comment "ユーザーID",
    product_id int not null comment "商品ID",
    product_count int comment "個数",
    price int comment "金額",
    destination_id int not null comment "宛先情報ID",
    regist_date datetime comment "登録日",
    update_date datetime comment "更新日",
    foreign key(user_id) references user_info(user_id),
    foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル";
create table destination_info(
    id int not null primary key auto_increment comment "ID",
    user_id varchar(16) not null comment "ユーザーID",
    family_name varchar(32) not null comment "姓",
    first_name varchar(32) not null comment "名",
    postal_code int comment "郵便番号",
    first_address varchar(50) comment "住所1",
    second_address varchar(50) comment "住所2",
    regist_date datetime comment "登録日",
    update_date datetime comment "更新日",
    foreign key(user_id) references user_info(user_id)
)
default charset=utf8
comment="宛先情報テーブル";
insert into destination_info values
(1,"test","原","裕介","1234567","神奈川県横浜市鶴見区","東寺尾5-9-17-232",now(),now());

create table m_category(
    id int not null primary key auto_increment comment "ID",
    category_id int unique not null comment "カテゴリID",
    category_name varchar(20) unique not null comment "カテゴリ名",
    category_description varchar(100) comment "カテゴリ詳細",
    insert_date datetime not null comment "登録日",
    update_date datetime comment "更新日"
)
default charset=utf8
comment="カテゴリマスターテーブル";
insert into m_category values
(1,1,"shaft","シャフト",now(),now()),
(2,2,"head","ヘッド",now(),now()),
(3,3,"helmet","ヘルメット",now(),now()),
(4,4,"gloves","グローブ",now(),now()),
(5,5,"apparel","アパレル",now(),now()),
(6,6,"shoes","シューズ",now(),now());