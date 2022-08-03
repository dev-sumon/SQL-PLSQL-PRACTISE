CREATE OR REPLACE PACKAGE test_overloading
IS
  PROCEDURE OVERLOAD(
      P_NAME VARCHAR2,
      P_AGE  NUMBER);
      
  PROCEDURE OVERLOAD(
      P_AGE  NUMBER,
      P_NAME VARCHAR2);
      
  FUNCTION OVERLOAD(
      P_ADDRESS  VARCHAR2,
      P_NAME VARCHAR2) RETURN VARCHAR2;
      
  FUNCTION OVERLOAD(
      P_NAME  VARCHAR2,
      P_ADDRESS VARCHAR2) RETURN VARCHAR2;
END;

------------------------------------

CREATE OR REPLACE PACKAGE BODY test_overloading
IS
  PROCEDURE OVERLOAD(
      P_NAME VARCHAR2,
      P_AGE  NUMBER)
  IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('NAME FIRST');
  END;
  
    PROCEDURE OVERLOAD(
      P_AGE  NUMBER,
      P_NAME VARCHAR2)
  IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('AGE FIRST');
  END;
  
  FUNCTION OVERLOAD(
      P_ADDRESS  VARCHAR2,
      P_NAME VARCHAR2) RETURN VARCHAR2
  IS
  BEGIN
    RETURN ('ADDRESS FIRST');
  END;
  
  
  FUNCTION OVERLOAD(
      P_NAME  VARCHAR2,
      P_ADDRESS VARCHAR2) RETURN VARCHAR2
  IS
  BEGIN
    RETURN ('ADDRESS FIRST');
  END;
  
END;

SET SERVEROUTPUT ON;
BEGIN
test_overloading.OVERLOAD('SUMON','DHAKA');
test_overloading.OVERLOAD(24,'SUMON');
END;