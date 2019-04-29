CREATE OR REPLACE PACKAGE BOOKME_Business
IS
	PROCEDURE CustomerDetail;
        PROCEDURE ProductInfo;
	PROCEDURE ProductDetail(product_id IN products.pid%TYPE);
	PROCEDURE ProductReviews(product_id IN products.pid%TYPE);
	PROCEDURE ProductTimes(product_id IN products.pid%TYPE);
	PROCEDURE BookingInformation(bookid IN bookings.bid%TYPE);
	PROCEDURE PaymentInformation(bookid IN bookings.bid%TYPE);
END;
/

CREATE OR REPLACE PACKAGE BODY BOOKME_Business
IS
	PROCEDURE CustomerDetail
	IS
	  CURSOR q_cursor IS
	     SELECT cus.cusid,
		cus.firstName,
		cus.lastName,
		cus.emailAddress,
		cus.password,
		tit.name title,
		cou.name country
	     FROM customers cus, titles tit, countries cou
	     WHERE cus.tid = tit.tid
	     AND cus.cid = cou.cid;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('#################Customer Detail###################');
		    DBMS_OUTPUT.PUT_LINE('CustomerId:'||q_row.cusid);
		    DBMS_OUTPUT.PUT_LINE('CustomerName:'||q_row.firstName||' '||q_row.lastName);
		    DBMS_OUTPUT.PUT_LINE('Title:'||q_row.title);
		    DBMS_OUTPUT.PUT_LINE('Country:'||q_row.country);
		    DBMS_OUTPUT.PUT_LINE('Email:'||q_row.emailAddress);
		    DBMS_OUTPUT.PUT_LINE('##################################################');
		END LOOP;
	END;
	
	PROCEDURE ProductInfo
	IS
	  CURSOR q_cursor IS
	     SELECT pro.description,
		pro.fromPrice,
		pro.save,
		pro.discount,
		pro.spaces,
		pro.startDate,
		pro.endDate,
		pro.stars
	     FROM products pro;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('#################Product Information###################');
		    DBMS_OUTPUT.PUT_LINE('Description:'||q_row.description);
		    DBMS_OUTPUT.PUT_LINE('From:$'||q_row.fromPrice);
		    DBMS_OUTPUT.PUT_LINE('Save:$'||q_row.save);
		    DBMS_OUTPUT.PUT_LINE('Discount:'||q_row.discount||'%');
		    DBMS_OUTPUT.PUT_LINE('Spaces:'||q_row.spaces);
		    DBMS_OUTPUT.PUT_LINE('Between:'||TO_CHAR(q_row.startDate, 'DD FMMon')||'-'||TO_CHAR(q_row.endDate, 'DD FMMon'));
		    DBMS_OUTPUT.PUT_LINE('Stars:'||q_row.stars);
		    DBMS_OUTPUT.PUT_LINE('###############################################');
		END LOOP;
	END;

	PROCEDURE ProductDetail(product_id IN products.pid%TYPE)
	IS
	  CURSOR q_cursor IS
	     SELECT pde.operatorName,
		pde.describe,
		pde.priceDescribe,
		pde.context
	     FROM productDetails pde,products pro
	     WHERE pde.pdid = pro.pdid
	     AND pro.pdid= product_id;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('#################Product Detail###################');
		    DBMS_OUTPUT.PUT_LINE('Operator Name:'||q_row.operatorName);
		    DBMS_OUTPUT.PUT_LINE('Describe:'||q_row.describe);
		    DBMS_OUTPUT.PUT_LINE('Price Describe:'||q_row.priceDescribe);
		    DBMS_OUTPUT.PUT_LINE('Context:'||q_row.context);
		    DBMS_OUTPUT.PUT_LINE('#################################################');
		END LOOP;
	END;

	PROCEDURE ProductReviews(product_id IN products.pid%TYPE)
	IS
	  CURSOR q_cursor IS
	     SELECT rev.title,
		rev.stars,
		rev.context,
		pro.description
	     FROM reviews rev,products pro
	     WHERE rev.pid = product_id;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('#################Product Reviews###################');
		    DBMS_OUTPUT.PUT_LINE('Product Description:'||q_row.description);
		    DBMS_OUTPUT.PUT_LINE('Title:'||q_row.title);
		    DBMS_OUTPUT.PUT_LINE('Stars:'||q_row.stars);
		    DBMS_OUTPUT.PUT_LINE('Context:'||q_row.context);
		    DBMS_OUTPUT.PUT_LINE('##################################################');
		END LOOP;
	END;

	PROCEDURE ProductTimes(product_id IN products.pid%TYPE)
	IS
	  CURSOR q_cursor IS
	     SELECT pro.description,
		prod.pdate,
		prod.pdid,
		prot.time,
		prot.spaces,
		prot.price,
		prot.describe,
		prot.availableSpaces
	     FROM products pro, productDates prod, productTimes prot
	     WHERE pro.pid = prod.pid
	     AND prod.pdid = prot.pdid
	     AND pro.pid = product_id;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		DBMS_OUTPUT.PUT_LINE('#################Product Times###################');
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('Date:'||TO_CHAR(q_row.pdate,'dd-mm-yyyy'));
		    DBMS_OUTPUT.PUT_LINE('Product Description:'||q_row.description);
		    DBMS_OUTPUT.PUT_LINE('Time:'||TO_CHAR(q_row.time,'hh24:mi:ss'));
		    DBMS_OUTPUT.PUT_LINE('Spaces:'||q_row.spaces);
		    DBMS_OUTPUT.PUT_LINE('Price:$'||q_row.price);
		    DBMS_OUTPUT.PUT_LINE('Describe:'||q_row.describe);
		    DBMS_OUTPUT.PUT_LINE('Available Spaces:'||q_row.availableSpaces||CHR(10));
		END LOOP;
	END;

	PROCEDURE BookingInformation(bookid IN bookings.bid%TYPE)
	IS
	  CURSOR q_cursor IS
	     SELECT bk.bnumber, 
		bk.firstName,
		bk.lastName,
		cus.cusid,
		cus.firstName||' '||cus.lastName cusName,
		cus.emailAddress,
		TO_CHAR(prot.time,'hh24:mi:ss') proTime,
		TO_CHAR(prod.pdate,'dd-mm-yyyy') proDate,
		pro.description
	     FROM bookings bk,customers cus,productTimes prot,productDates prod,products pro
	     WHERE bk.cusid = cus.cusid
	     AND prot.ptid = bk.ptid
	     AND prod.pdid = prot.pdid
	     AND prod.pdid = prot.pdid
	     AND pro.pid = prod.pid
	     AND bk.bid = bookid;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('#################Booking Information###################');
		    DBMS_OUTPUT.PUT_LINE('Product Description:'||q_row.description);
		    DBMS_OUTPUT.PUT_LINE('Customer ID:'||q_row.cusid);
		    DBMS_OUTPUT.PUT_LINE('Customer Name:'||q_row.cusName);
		    DBMS_OUTPUT.PUT_LINE('Customer Email Address:'||q_row.emailAddress);
		    DBMS_OUTPUT.PUT_LINE('Booking Number:'||q_row.bnumber);
		    DBMS_OUTPUT.PUT_LINE('Booking People:'||q_row.firstName||' '||q_row.lastName);
		    DBMS_OUTPUT.PUT_LINE('Product Date:'||q_row.proDate);
		    DBMS_OUTPUT.PUT_LINE('Product Time:'||q_row.proTime);
		    DBMS_OUTPUT.PUT_LINE('##################################################');
		END LOOP;
	END;

	PROCEDURE PaymentInformation(bookid IN bookings.bid%TYPE)
	IS
	  CURSOR q_cursor IS
	     SELECT bk.bnumber, 
		bk.firstName,
		bk.lastName,
		pay.cardNumber,
		payt.name cardType,
		pay.nameOnCard,
		pay.expiryMonth,
		pay.expiryYear,
		pay.CVC,
		pay.currency,
		pay.amount
	     FROM bookings bk,payments pay,paymentTypes payt
	     WHERE bk.bid = pay.bid
	     AND pay.ptypeid = payt.ptypeid
	     AND bk.bid = bookid;
	  q_row q_cursor%ROWTYPE;
	BEGIN
		FOR q_row IN q_cursor
		 LOOP
		    DBMS_OUTPUT.PUT_LINE('#################Payment Information###################');
		    DBMS_OUTPUT.PUT_LINE('Booking Number:'||q_row.bnumber);
		    DBMS_OUTPUT.PUT_LINE('Booking People:'||q_row.firstName||' '||q_row.lastName);
		    DBMS_OUTPUT.PUT_LINE('Card Number:'||q_row.cardNumber);
		    DBMS_OUTPUT.PUT_LINE('Card Type:'||q_row.cardType);
		    DBMS_OUTPUT.PUT_LINE('Name On Card:'||q_row.nameOnCard);
		    DBMS_OUTPUT.PUT_LINE('Expiry Month:'||q_row.expiryMonth);
		    DBMS_OUTPUT.PUT_LINE('Expiry Year:'||q_row.expiryYear);
		    DBMS_OUTPUT.PUT_LINE('CVC:'||q_row.CVC);
		    DBMS_OUTPUT.PUT_LINE('Currency:'||q_row.currency);
		    DBMS_OUTPUT.PUT_LINE('Amount:$'||q_row.amount);
		    DBMS_OUTPUT.PUT_LINE('##################################################');
		END LOOP;
	END;

END;
/

SET SERVEROUTPUT ON;
EXEC BOOKME_Business.CustomerDetail();
EXEC BOOKME_Business.ProductInfo();
EXEC BOOKME_Business.ProductDetail(1);
EXEC BOOKME_Business.ProductReviews(1);
EXEC BOOKME_Business.ProductTimes(1);
EXEC BOOKME_Business.BookingInformation(1);
EXEC BOOKME_Business.PaymentInformation(1);
SET SERVEROUTPUT OFF;