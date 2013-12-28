--application/deployment/install
prompt  ...application install scripts
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_install_script(
  p_id => 22889603392766240 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 22869921778761344 + wwv_flow_api.g_id_offset,
  p_name => 'CG_REF_CODES',
  p_sequence=> 10,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 22913213300776880 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 22869921778761344 + wwv_flow_api.g_id_offset,
  p_name => 'POSTCODES',
  p_sequence=> 20,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--------------------------------------------------------'||unistr('\000a')||
'--  File created - woensdag-mei-09-2012   '||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table APP_LIST_VALUES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE TABLE "APP_LIST_VALUES" '||unistr('\000a')||
'   (    "ID" NUMBER(8,0), '||unistr('\000a')||
'    "LIS_ID" VARCHAR2(8), '||unistr('\000a')||
'    "V';

s:=s||'ALUE" VARCHAR2(40), '||unistr('\000a')||
'    "CODE" VARCHAR2(8), '||unistr('\000a')||
'    "VERVALLEN" VARCHAR2(1), '||unistr('\000a')||
'    "SYSTEEM_WAARDE" VARCHAR2(1)'||unistr('\000a')||
' ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING'||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPDAT" ;'||unistr('\000a')||
' '||unistr('\000a')||
''||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."ID" IS ''Identifi';

s:=s||'catienummer van waarde in de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."LIS_ID" IS ''Identificatiecode (afkorting) van de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."VALUE" IS ''Lijstwaarde'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."CODE" IS ''Eventuele gebruikte code (afkorting) voor de lijstwaarde'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."SYSTEEM_WAARDE" IS ''Systeem waarde'';'||unistr('\000a')||
' '||unistr('\000a')||
'   CO';

s:=s||'MMENT ON TABLE "APP_LIST_VALUES"  IS ''Bevat de waarden van de standaardlijsten'';'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table APP_LISTS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE TABLE "APP_LISTS" '||unistr('\000a')||
'   (    "ID" VARCHAR2(8 ), '||unistr('\000a')||
'    "DESCRIPTION" VARCHAR2(40 ), '||unistr('\000a')||
'    "APP" VARCHAR2(3 )'||unistr('\000a')||
' ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOG';

s:=s||'GING'||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPDAT" ;'||unistr('\000a')||
' '||unistr('\000a')||
''||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LISTS"."ID" IS ''Identificatiecode (afkorting) van de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LISTS"."DESCRIPTION" IS ''Omschrijving van de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LISTS"."APP" IS ''Afkorting van d';

s:=s||'e applicatie'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON TABLE "APP_LISTS"  IS ''Bevat de typen standaardlijsten'';'||unistr('\000a')||
'REM INSERTING into APP_OWNER.APP_LIST_VALUES'||unistr('\000a')||
'SET DEFINE OFF;'||unistr('\000a')||
'REM INSERTING into APP_OWNER.APP_LISTS'||unistr('\000a')||
'SET DEFINE OFF;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Index LIV_PK'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE UNIQUE INDEX "LIV_PK" ON "APP_LIST_VALUES" ("ID';

s:=s||'") '||unistr('\000a')||
'  PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX" ;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Index LIV_UK1'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE UNIQUE INDEX "LIV_UK1" ON ';

s:=s||'"APP_LIST_VALUES" ("LIS_ID", "VALUE") '||unistr('\000a')||
'  PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX" ;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Index LIS_PK'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
' ';

s:=s||' CREATE UNIQUE INDEX "LIS_PK" ON "APP_LISTS" ("ID") '||unistr('\000a')||
'  PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX" ;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  Constraints for Table APP_LIST_VALUES'||unistr('\000a')||
'----------------------------';

s:=s||'----------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "AVCON_57019_SYSTE_000" CHECK (SYSTEEM_WAARDE IN (''J'', ''N'')) ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "LIV_PK" PRIMARY KEY ("ID")'||unistr('\000a')||
'  USING INDEX PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST';

s:=s||' GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX"  ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "LIV_UK1" UNIQUE ("LIS_ID", "VALUE")'||unistr('\000a')||
'  USING INDEX PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX"  ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TAB';

s:=s||'LE "APP_LIST_VALUES" MODIFY ("ID" NOT NULL ENABLE);'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" MODIFY ("LIS_ID" NOT NULL ENABLE);'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" MODIFY ("VALUE" NOT NULL ENABLE);'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  Constraints for Table APP_LISTS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  ALTER TABLE "APP_LISTS" ADD CONSTRAINT "LIS_PK" PRIMARY KE';

s:=s||'Y ("ID")'||unistr('\000a')||
'  USING INDEX PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX"  ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LISTS" MODIFY ("ID" NOT NULL ENABLE);'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LISTS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);'||unistr('\000a')||
'-------------------------';

s:=s||'-------------------------------'||unistr('\000a')||
'--  Ref Constraints for Table APP_LIST_VALUES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "LIV_FK1" FOREIGN KEY ("LIS_ID")'||unistr('\000a')||
'      REFERENCES "APP_LISTS" ("ID") ENABLE;'||unistr('\000a')||
''||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_BRUD'||unistr('\000a')||
'-----------------------------------------------------';

s:=s||'---'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_BRUD" BEFORE'||unistr('\000a')||
'  DELETE OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES FOR EACH ROW BEGIN IF :old.lis_id = ''MIDDEL'' THEN IF DELETING THEN app$standaard.message(''E'',1032,NULL,NULL,''ZC'');'||unistr('\000a')||
'elsif UPDATING THEN'||unistr('\000a')||
'  IF :old.value <> :new.value THEN'||unistr('\000a')||
'    app$standaard.message(''E'',1032,NULL,NULL,''ZC'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END';

s:=s||';'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_BRUD" ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_ARIU'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_ARIU" AFTER'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES FOR EACH ROW BEGIN'||unistr('\000a')||
'    /* alleen als code is gewijzigd */'||unistr('\000a')||
'    IF ( :new.code IS NOT NULL'||unistr('\000a')||
'  AND :old.code    IS NULL)'||unistr('\000a')||
'  OR ( :new.code ';

s:=s||'  <> :old.code ) THEN app$muttable.add(:new.rowid);'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_ARIU" ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_BS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_BS" BEFORE'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES BEGIN app$muttab';

s:=s||'le.init;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_BS" ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_AS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_AS" AFTER'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES BEGIN DECLARE l_index binary_integer;'||unistr('\000a')||
'  l_rowid rowid;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR l_i';

s:=s||'ndex IN app$muttable.start_index..app$muttable.last_index'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_rowid := app$muttable.getR(l_index);'||unistr('\000a')||
'    /* Doe de controle voor 1 code per lijst */'||unistr('\000a')||
'    app_chk_liv_code(l_rowid);'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  app$muttable.done;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END;'||unistr('\000a')||
'END LIV_AS;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_AS" ENABLE;'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 22936804027781172 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 22869921778761344 + wwv_flow_api.g_id_offset,
  p_name => 'LOV',
  p_sequence=> 30,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

