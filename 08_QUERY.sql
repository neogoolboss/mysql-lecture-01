/* 서브쿼리 */
-- 민트 미역국의 카테고리 번호 조회
SELECT
	   CATEGORY_CODE
  FROM TBL_MENU
 WHERE MENU_NAME = '민트미역국';
 
-- 메인쿼리
-- 다중열 결과 조회
SELECT
	   MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU;
  
-- 서버쿼리를 활용한 메인쿼리
-- 민트미역국과 같은 카테고리 메뉴 조회
SELECT
	   MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE CATEGORY_CODE = (SELECT
							   CATEGORY_CODE
                          FROM TBL_MENU
						 WHERE MENU_NAME = '민트미역국');
				
-- 가장 많은 메뉴가 포함된 카테고리 조회
SELECT
	   COUNT(*) AS 'count'
  FROM TBL_MENU
  GROUP BY CATEGORY_CODE;
  
SELECT
	   MAX(count)
  FROM
	   (SELECT
			   COUNT(*) AS 'count'
		  FROM TBL_MENU
		  GROUP BY CATEGORY_CODE) AS countmenu;

/* 상관 서브쿼리 */
-- 메인 쿼리가 서브쿼리의 결과에 영향을 주는 경우 상관 서브쿼리라고 한다.
-- 서브쿼리
SELECT
	   AVG(MENU_PRICE)
  FROM TBL_MENU
 WHERE CATEGORY_CODE = 4;
 
-- 카테고리별 평균 가격보다 높은 가격의 메뉴 조회
SELECT
	   MENU_CODE,
       MENU_NAME,
       MENU_PRICE,
       CATEGORY_CODE,
       ORDERABLE_STATUS
  FROM TBL_MENU A
 WHERE MENU_PRICE > (SELECT
						    AVG(MENU_PRICE)
					   FROM TBL_MENU
					  WHERE CATEGORY_CODE = A.CATEGORY_CODE);
                      
/* EXISTS */
-- 조회결과가 있을 때 true 아니면 flase
-- 메뉴가 있는 카테고리 조회
-- TBL_MENU 테이블에 존재하는 CATEGORY_CODE를 가진 'TBL_CATEGORY' 테이블의 CATEGORY_NAME을 선택하고,
-- 그 결과를 CATEGORY_NAME으로 정렬
SELECT
	   CATEGORY_NAME
  FROM TBL_CATEGORY A
 WHERE EXISTS(
				SELECT
					   1
				  FROM TBL_MENU B
				 WHERE B.CATEGORY_CODE = A.CATEGORY_CODE)
                 ORDER BY 1;