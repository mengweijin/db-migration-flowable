create table ACT_RE_DEPLOYMENT (
    ID_ VARCHAR(64),
    NAME_ VARCHAR(255),
    CATEGORY_ VARCHAR(255),
    KEY_ VARCHAR(255),
    TENANT_ID_ VARCHAR(255) DEFAULT '',
    DEPLOY_TIME_ TIMESTAMP(6),
    DERIVED_FROM_ VARCHAR(64),
    DERIVED_FROM_ROOT_ VARCHAR(64),
    PARENT_DEPLOYMENT_ID_ VARCHAR(255),
    ENGINE_VERSION_ VARCHAR(255),
    primary key (ID_)
);

create table ACT_RE_MODEL (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    NAME_ VARCHAR(255),
    KEY_ VARCHAR(255),
    CATEGORY_ VARCHAR(255),
    CREATE_TIME_ TIMESTAMP(6),
    LAST_UPDATE_TIME_ TIMESTAMP(6),
    VERSION_ INTEGER,
    META_INFO_ VARCHAR(2000),
    DEPLOYMENT_ID_ VARCHAR(64),
    EDITOR_SOURCE_VALUE_ID_ VARCHAR(64),
    EDITOR_SOURCE_EXTRA_VALUE_ID_ VARCHAR(64),
    TENANT_ID_ VARCHAR(255) DEFAULT '',
    primary key (ID_)
);

create table ACT_RU_EXECUTION (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    PROC_INST_ID_ VARCHAR(64),
    BUSINESS_KEY_ VARCHAR(255),
    PARENT_ID_ VARCHAR(64),
    PROC_DEF_ID_ VARCHAR(64),
    SUPER_EXEC_ VARCHAR(64),
    ROOT_PROC_INST_ID_ VARCHAR(64),
    ACT_ID_ VARCHAR(255),
    IS_ACTIVE_ DECIMAL(1,0) CHECK (IS_ACTIVE_ IN (1,0)),
    IS_CONCURRENT_ DECIMAL(1,0) CHECK (IS_CONCURRENT_ IN (1,0)),
    IS_SCOPE_ DECIMAL(1,0) CHECK (IS_SCOPE_ IN (1,0)),
    IS_EVENT_SCOPE_ DECIMAL(1,0) CHECK (IS_EVENT_SCOPE_ IN (1,0)),
    IS_MI_ROOT_ DECIMAL(1,0) CHECK (IS_MI_ROOT_ IN (1,0)),
    SUSPENSION_STATE_ INTEGER,
    CACHED_ENT_STATE_ INTEGER,
    TENANT_ID_ VARCHAR(255) DEFAULT '',
    NAME_ VARCHAR(255),
    START_ACT_ID_ VARCHAR(255),
    START_TIME_ TIMESTAMP(6),
    START_USER_ID_ VARCHAR(255),
    LOCK_TIME_ TIMESTAMP(6),
    LOCK_OWNER_ VARCHAR(255),
    IS_COUNT_ENABLED_ DECIMAL(1,0) CHECK (IS_COUNT_ENABLED_ IN (1,0)),
    EVT_SUBSCR_COUNT_ INTEGER, 
    TASK_COUNT_ INTEGER, 
    JOB_COUNT_ INTEGER, 
    TIMER_JOB_COUNT_ INTEGER,
    SUSP_JOB_COUNT_ INTEGER,
    DEADLETTER_JOB_COUNT_ INTEGER,
    EXTERNAL_WORKER_JOB_COUNT_ INTEGER,
    VAR_COUNT_ INTEGER, 
    ID_LINK_COUNT_ INTEGER,
    CALLBACK_ID_ VARCHAR(255),
    CALLBACK_TYPE_ VARCHAR(255),
    REFERENCE_ID_ VARCHAR(255),
    REFERENCE_TYPE_ VARCHAR(255),
    PROPAGATED_STAGE_INST_ID_ VARCHAR(255),
    BUSINESS_STATUS_ VARCHAR(255),
    primary key (ID_)
);

create table ACT_RE_PROCDEF (
    ID_ VARCHAR(64) NOT NULL,
    REV_ INTEGER,
    CATEGORY_ VARCHAR(255),
    NAME_ VARCHAR(255),
    KEY_ VARCHAR(255) NOT NULL,
    VERSION_ INTEGER NOT NULL,
    DEPLOYMENT_ID_ VARCHAR(64),
    RESOURCE_NAME_ VARCHAR(2000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    DESCRIPTION_ VARCHAR(2000),
    HAS_START_FORM_KEY_ DECIMAL(1,0) CHECK (HAS_START_FORM_KEY_ IN (1,0)),
    HAS_GRAPHICAL_NOTATION_ DECIMAL(1,0) CHECK (HAS_GRAPHICAL_NOTATION_ IN (1,0)),
    SUSPENSION_STATE_ INTEGER,
    TENANT_ID_ VARCHAR(255) DEFAULT '',
    DERIVED_FROM_ VARCHAR(64),
    DERIVED_FROM_ROOT_ VARCHAR(64),
    DERIVED_VERSION_ INTEGER DEFAULT 0 NOT NULL,
    ENGINE_VERSION_ VARCHAR(255),
    primary key (ID_)
);

create table ACT_EVT_LOG (
    LOG_NR_ DECIMAL(19),
    TYPE_ VARCHAR(64),
    PROC_DEF_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    EXECUTION_ID_ VARCHAR(64),
    TASK_ID_ VARCHAR(64),
    TIME_STAMP_ TIMESTAMP(6) not null,
    USER_ID_ VARCHAR(255),
    DATA_ BLOB,
    LOCK_OWNER_ VARCHAR(255),
    LOCK_TIME_ TIMESTAMP(6) null,
    IS_PROCESSED_ DECIMAL(3) default 0,
    primary key (LOG_NR_)
);

create sequence act_evt_log_seq;

create table ACT_PROCDEF_INFO (
	ID_ VARCHAR(64) not null,
    PROC_DEF_ID_ VARCHAR(64) not null,
    REV_ integer,
    INFO_JSON_ID_ VARCHAR(64),
    primary key (ID_)
);

create table ACT_RU_ACTINST (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER default 1,
    PROC_DEF_ID_ VARCHAR(64) not null,
    PROC_INST_ID_ VARCHAR(64) not null,
    EXECUTION_ID_ VARCHAR(64) not null,
    ACT_ID_ VARCHAR(255) not null,
    TASK_ID_ VARCHAR(64),
    CALL_PROC_INST_ID_ VARCHAR(64),
    ACT_NAME_ VARCHAR(255),
    ACT_TYPE_ VARCHAR(255) not null,
    ASSIGNEE_ VARCHAR(255),
    START_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ DECIMAL(19,0),
    TRANSACTION_ORDER_ INTEGER,
    DELETE_REASON_ VARCHAR(2000),
    TENANT_ID_ VARCHAR(255) default '',
    primary key (ID_)
);

create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_EXEC_ROOT on ACT_RU_EXECUTION(ROOT_PROC_INST_ID_);
create index ACT_IDX_EXEC_REF_ID_ on ACT_RU_EXECUTION(REFERENCE_ID_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);

create index ACT_IDX_RU_ACTI_START on ACT_RU_ACTINST(START_TIME_);
create index ACT_IDX_RU_ACTI_END on ACT_RU_ACTINST(END_TIME_);
create index ACT_IDX_RU_ACTI_PROC on ACT_RU_ACTINST(PROC_INST_ID_);
create index ACT_IDX_RU_ACTI_PROC_ACT on ACT_RU_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_RU_ACTI_EXEC on ACT_RU_ACTINST(EXECUTION_ID_);
create index ACT_IDX_RU_ACTI_EXEC_ACT on ACT_RU_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_RU_ACTI_TASK on ACT_RU_ACTINST(TASK_ID_);

create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY(DEPLOYMENT_ID_);
alter table ACT_GE_BYTEARRAY
    add constraint
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint
    unique (KEY_,VERSION_, DERIVED_VERSION_, TENANT_ID_) constraint ACT_UNIQ_PROCDEF;
    
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION(PROC_INST_ID_);
alter table ACT_RU_EXECUTION
    add constraint
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION(PARENT_ID_);
alter table ACT_RU_EXECUTION
    add constraint
    foreign key (PARENT_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION(SUPER_EXEC_);
alter table ACT_RU_EXECUTION
    add constraint
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION(PROC_DEF_ID_);
alter table ACT_RU_EXECUTION
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);    

create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK(TASK_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint
    foreign key (TASK_ID_) 
    references ACT_RU_TASK (ID_);

create index ACT_IDX_ATHRZ_PROCEDEF  on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK(PROC_INST_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);    

create index ACT_IDX_TASK_EXEC on ACT_RU_TASK(EXECUTION_ID_);
alter table ACT_RU_TASK
    add constraint
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK(PROC_INST_ID_);
alter table ACT_RU_TASK
    add constraint
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK(PROC_DEF_ID_);
alter table ACT_RU_TASK
  add constraint
  foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
  
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE(EXECUTION_ID_);
alter table ACT_RU_VARIABLE 
    add constraint
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE(PROC_INST_ID_);
alter table ACT_RU_VARIABLE
    add constraint
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_JOB_EXECUTION_ID on ACT_RU_JOB(EXECUTION_ID_);
alter table ACT_RU_JOB 
    add constraint
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_JOB_PROC_INST_ID on ACT_RU_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_JOB 
    add constraint
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_JOB_PROC_DEF_ID on ACT_RU_JOB(PROC_DEF_ID_);
alter table ACT_RU_JOB 
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_TJOB_EXECUTION_ID on ACT_RU_TIMER_JOB(EXECUTION_ID_);
alter table ACT_RU_TIMER_JOB 
    add constraint
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TJOB_PROC_INST_ID on ACT_RU_TIMER_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_TIMER_JOB 
    add constraint
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TJOB_PROC_DEF_ID on ACT_RU_TIMER_JOB(PROC_DEF_ID_);
alter table ACT_RU_TIMER_JOB 
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_SJOB_EXECUTION_ID on ACT_RU_SUSPENDED_JOB(EXECUTION_ID_);    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_SJOB_PROC_INST_ID on ACT_RU_SUSPENDED_JOB(PROCESS_INSTANCE_ID_);    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_SJOB_PROC_DEF_ID on ACT_RU_SUSPENDED_JOB(PROC_DEF_ID_);    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_DJOB_EXECUTION_ID on ACT_RU_DEADLETTER_JOB(EXECUTION_ID_);      
alter table ACT_RU_DEADLETTER_JOB 
    add constraint
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
 
create index ACT_IDX_DJOB_PROC_INST_ID on ACT_RU_DEADLETTER_JOB(PROCESS_INSTANCE_ID_);        
alter table ACT_RU_DEADLETTER_JOB 
    add constraint
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_DJOB_PROC_DEF_ID on ACT_RU_DEADLETTER_JOB(PROC_DEF_ID_);    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_EVENT_SUBSCR
    add constraint
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL(EDITOR_SOURCE_VALUE_ID_);
alter table ACT_RE_MODEL 
    add constraint
    foreign key (EDITOR_SOURCE_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL(EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table ACT_RE_MODEL 
    add constraint
    foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL(DEPLOYMENT_ID_);    
alter table ACT_RE_MODEL 
    add constraint
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);        
    
create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO(INFO_JSON_ID_);
alter table ACT_PROCDEF_INFO 
    add constraint
    foreign key (INFO_JSON_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create unique index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO(PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO 
    add constraint
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

insert into ACT_GE_PROPERTY
values ('schema.version', '6.8.0.0', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(6.8.0.0)', 1);
