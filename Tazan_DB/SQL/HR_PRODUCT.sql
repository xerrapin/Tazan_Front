create table PRODUCT
(
    P_CODE  NUMBER(3)    not null
        primary key,
    P_NAME  VARCHAR2(20) not null,
    P_PRICE NUMBER
)
/

INSERT INTO HR.PRODUCT (P_CODE, P_NAME, P_PRICE) VALUES (100, '새우짱', 800);
INSERT INTO HR.PRODUCT (P_CODE, P_NAME, P_PRICE) VALUES (101, '감자짱', 900);
INSERT INTO HR.PRODUCT (P_CODE, P_NAME, P_PRICE) VALUES (102, '맛큰산', 1000);
INSERT INTO HR.PRODUCT (P_CODE, P_NAME, P_PRICE) VALUES (103, '에이서', 900);
INSERT INTO HR.PRODUCT (P_CODE, P_NAME, P_PRICE) VALUES (104, '맛짱구', 800);
INSERT INTO HR.PRODUCT (P_CODE, P_NAME, P_PRICE) VALUES (105, '샤보레', 1500);