DROP TABLE BOOK_RECORD;
DROP TABLE ISSUED_BY;
DROP TABLE BOOK;
DROP TABLE USERS;
DROP TABLE ADMIN;
DROP TABLE LOGIN;


---CREATING TABLE---

CREATE TABLE LOGIN(LOGIN_ID NUMBER(15),
                   PASSWORD VARCHAR(10),
                   PRIMARY KEY(LOGIN_ID));


CREATE TABLE ADMIN(ADMIN_ID NUMBER(15) NOT NULL,
                    NAME VARCHAR(50),
                    PHONE_NO NUMBER(15),
                    PRIMARY KEY(ADMIN_ID),
                    FOREIGN KEY (ADMIN_ID) REFERENCES LOGIN(LOGIN_ID));

CREATE TABLE USERS(LIBRARY_ID NUMBER(15) NOT NULL,
                  NAME VARCHAR(50),
                  MOBILE_NO NUMBER(15),
                  ADDRESS VARCHAR(100),
                  NO_OF_BOOK_ISSUED NUMBER(5),
                  ISSUED_FROM NUMBER(15),
                  PRIMARY KEY(LIBRARY_ID),
                  FOREIGN KEY(LIBRARY_ID) REFERENCES LOGIN(LOGIN_ID),
                  FOREIGN KEY(ISSUED_FROM) REFERENCES ADMIN(ADMIN_ID)
                  );

CREATE TABLE BOOK(BOOK_BARCODE_NO VARCHAR(20) NOT NULL,
                  TITLE VARCHAR(250),
                  AUTHOR VARCHAR(50),
                  BORROWED_BY NUMBER(15),
                  ISSUE_BY NUMBER(15),
                  PRIMARY KEY (BOOK_BARCODE_NO),
                  FOREIGN KEY (BORROWED_BY) REFERENCES USERS(LIBRARY_ID),
                  FOREIGN KEY (ISSUE_BY) REFERENCES ADMIN(ADMIN_ID)
                  );
CREATE TABLE ISSUED_BY(BOOK_ID VARCHAR(20) NOT NULL,
                     ADMIN_ID NUMBER(15) NOT NULL,
                     ISSUE_DATE VARCHAR(10),
                     FINE NUMBER(5),
                     RETURN_DATE VARCHAR(10),
                     PRIMARY KEY(BOOK_ID,ADMIN_ID),
                     FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_BARCODE_NO),
                     FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
                     );
CREATE TABLE BOOK_RECORD(BOOK_ID VARCHAR(20) NOT NULL,
                        BOOK_TITE VARCHAR(250),
                        BOOK_AUTHOR VARCHAR(250),
                        BOOK_STATUS VARCHAR(50),
                        BOOK_ENTRY_DATE VARCHAR(50),
                        ADMIN_ID NUMBER(15) NOT NULL,
                        PRIMARY KEY(BOOK_ID),
                        FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID)
                         );



