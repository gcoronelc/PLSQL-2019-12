

Create Or Replace Trigger tr_deny_drop
before Drop ON Schema
Begin
  raise_application_error( -20000, 'No es posible borrar objetos.');
End tr_deny_drop;
/

DROP TABLE EMP PURGE;