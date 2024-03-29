/* JOIN */

/* ALIAS */ 
/* 컬럼 별칭 */

-- 별칭에 띄워쓰기나 특수기호가 없다면 홑따옴표(')와 AS는 생략이 가능하다.
SELECT
	menu_code AS 'code' ,
    menu_name name ,
    menu_price
    from TBL_menu
    order by menu_price;
    
/* 테이블 별칭 */
-- 테이블 별칭은 AS를 써도 되고 생략도 가능하다.
select
		A. category_code,
        A. menu_name
        from tbl_menu A
        order by A.category_code,
				 A.menu_name,
                 
/* INNER JOIN */
-- 두 테이블의 교집합을 반환하는 SQL JOIN
-- Inner join에서 inner 키워드는 생략이 가능하다.
SELECT
	  A. MENU_NAME,
      B. CATEGORY_NAME
	FROM TBL_MENU A
	JOIN TBL_CATEGORY B ON A.CATEGORY_CODE = B.CATEGORY_CODE;
      
      /* Using */
      SELECT 
			A.MENU_NAME,
            B.CATEGORY_NAME
		FROM TBL_MENU A
		INNER JOIN TBL_CATEGORY B using (category_code);
        
        /* LEFT JOIN */
        SELECT	
			A. CATEGORY_NAME,
            B. MENU_NAME
		FROM tbl_category A
        LEFT JOIN TBL_MENU B ON A.CATEGORY_CODE = B.CATEGORY_CODE;
        
        
        /* RIGHT JOIN */
        select
        A. menu_name,
        B. category_name
        from TBL_menu A
        right join tbl_category B On A.CATEGORY_CODE = B.category_code;
        
        /* Cross join */
        -- 두 테이블의 모든 가능한 조합을 반환
            A. MENU_Name,
            B. category_name
            From tbl_menu A
            cross join tbl_category B;
            
		/* SELF JOIN */
            -- 같은 테이블 내에서 행과 행 사이의 관계를 찾기위해 사용되는 SQL JOIN
            -- 카테고리별 대분류 확인을 위한 SELF JOIN 조회
            select
				A. category_name,
                B. category_name
                from tbl_category A
                join tbl_category B ON A.REF_category_code = B.category_code
                where A.ref_category_code is not null;
                
	/* JOIN 알고리즘 */
    /* NESTED LOOP JOIN */
    -- 두 개 이상의 테이블에서 하나의 집합을 기준으로 순차적으로 상대방 ROW를 결합하여 조합하는 방식
    -- 중첩 반복문처럼 첫 번쨰 테이블의 ROW와 관련된 두 번째 테이블에 대한 ROW를 검색하고
    -- MYSQL은 기본적으로 NESTED LOOP JOIN을 사용하지만 이를 강제하려면 HASH JOIN을 사용하지 않도록 강제화 할 수 있다.
    SELECT
			A. MENU_NAME,
            B. CATEGORY_NAME
            from TBL_MENU A
            JOIN tbl_category B ON A.category_code = B.category_code;
	
    /* HASH JOIN */
    -- HASH JOIN은 등가 조인('=' 연산자를 사용하는 조인)에만 사용할 수 있고 비등가 조인에는 사용할 수 없다.
    SELECT
		A. menu_name,
		B. category_name
    from tbl_menu A
    join tbl_category B on A.category_code = B.category_code;
    
    -- 이후 첫 번쨰 테이블의 다음 ROW에 대헤 두 번쨰 테이블에 대한 것을 검색하며 이후 이와 같은 방식을 반복한다.
    

                
            
            
            
    
