create table ACT_HI_PROCINST (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER default 1,
    PROC_INST_ID_ VARCHAR(64) not null,
    BUSINESS_KEY_ VARCHAR(255),
    PROC_DEF_ID_ VARCHAR(64) not null,
    START_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ DECIMAL(19,0),
    START_USER_ID_ VARCHAR(255),
    START_ACT_ID_ VARCHAR(255),
    END_ACT_ID_ VARCHAR(255),
    SUPER_PROCESS_INSTANCE_ID_ VARCHAR(64),
    DELETE_REASON_ VARCHAR(2000),
    TENANT_ID_ VARCHAR(255) default '',
    NAME_ VARCHAR(255),
    CALLBACK_ID_ VARCHAR(255),
    CALLBACK_TYPE_ VARCHAR(255),
    REFERENCE_ID_ VARCHAR(255),
    REFERENCE_TYPE_ VARCHAR(255),
    PROPAGATED_STAGE_INST_ID_ VARCHAR(255),
    BUSINESS_STATUS_ VARCHAR(255),
    primary key (ID_),
    unique (PROC_INST_ID_)
);

create table ACT_HI_ACTINST (
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
    TRANSACTION_ORDER_ INTEGER,
    DURATION_ DECIMAL(19,0),
    DELETE_REASON_ VARCHAR(2000),
    TENANT_ID_ VARCHAR(255) default '',
    primary key (ID_)
);

create table ACT_HI_DETAIL (
    ID_ VARCHAR(64) not null,
    TYPE_ VARCHAR(255) not null,
    PROC_INST_ID_ VARCHAR(64),
    EXECUTION_ID_ VARCHAR(64),
    TASK_ID_ VARCHAR(64),
    ACT_INST_ID_ VARCHAR(64),
    NAME_ VARCHAR(255) not null,
    VAR_TYPE_ VARCHAR(64),
    REV_ INTEGER,
    TIME_ TIMESTAMP(6) not null,
    BYTEARRAY_ID_ VARCHAR(64),
    DOUBLE_ DECIMAL(28,10),
    LONG_ DECIMAL(19,0),
    TEXT_ VARCHAR(2000),
    TEXT2_ VARCHAR(2000),
    primary key (ID_)
);

create table ACT_HI_COMMENT (
    ID_ VARCHAR(64) not null,
    TYPE_ VARCHAR(255),
    TIME_ TIMESTAMP(6) not null,
    USER_ID_ VARCHAR(255),
    TASK_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    ACTION_ VARCHAR(255),
    MESSAGE_ VARCHAR(2000),
    FULL_MSG_ BLOB,
    primary key (ID_)
);

create table ACT_HI_ATTACHMENT (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    USER_ID_ VARCHAR(255),
    NAME_ VARCHAR(255),
    DESCRIPTION_ VARCHAR(2000),
    TYPE_ VARCHAR(255),
    TASK_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    URL_ VARCHAR(2000),
    CONTENT_ID_ VARCHAR(64),
    TIME_ TIMESTAMP(6),
    primary key (ID_)
);

create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_PRO_SUPER_PROCINST on ACT_HI_PROCINST(SUPER_PROCESS_INSTANCE_ID_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_EXE on ACT_HI_VARINST(EXECUTION_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);

create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);