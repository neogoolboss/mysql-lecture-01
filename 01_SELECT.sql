SELECT
       MENU_NAME -- 메뉴 네임 컬럼을 검색
  FROM
       TBL_MENU; -- 테이블 메뉴에서
       
       
SELECT
       MENU_CODE
	 , MENU_NAME
     , MENU_PRICE
  FROM TBL_MENU;

SELECT
       *
  FROM TBL_MENU;
  
SELECT 6 + 3;
SELECT 6 * 3;
SELECT 6 % 3;

SELECT NOW();
SELECT CONCAT('홍.',' ', '길동') AS name;
SELECT CONCAT('홍.',' ', '길동') AS 'Full name';
  	  