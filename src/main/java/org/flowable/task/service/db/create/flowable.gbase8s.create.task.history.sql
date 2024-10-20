create table ACT_HI_TASKINST (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER default 1,
    PROC_DEF_ID_ VARCHAR(64),
    TASK_DEF_ID_ VARCHAR(64),
    TASK_DEF_KEY_ VARCHAR(255),
    PROC_INST_ID_ VARCHAR(64),
    EXECUTION_ID_ VARCHAR(64),
    SCOPE_ID_ VARCHAR(255),
    SUB_SCOPE_ID_ VARCHAR(255),
    SCOPE_TYPE_ VARCHAR(255),
    SCOPE_DEFINITION_ID_ VARCHAR(255),
    PROPAGATED_STAGE_INST_ID_ VARCHAR(255),
    PARENT_TASK_ID_ VARCHAR(64),
    STATE_ VARCHAR(255),
    NAME_ VARCHAR(255),
    DESCRIPTION_ VARCHAR(2000),
    OWNER_ VARCHAR(255),
    ASSIGNEE_ VARCHAR(255),
    START_TIME_ TIMESTAMP(6) not null,
    IN_PROGRESS_TIME_ TIMESTAMP(6),
    IN_PROGRESS_STARTED_BY_ VARCHAR(255),
    CLAIM_TIME_ TIMESTAMP(6),
    CLAIMED_BY_ VARCHAR(255),
    SUSPENDED_TIME_ TIMESTAMP(6),
    SUSPENDED_BY_ VARCHAR(255),
    END_TIME_ TIMESTAMP(6),
    COMPLETED_BY_ VARCHAR(255),
    DURATION_ DECIMAL(19,0),
    DELETE_REASON_ VARCHAR(2000),
    PRIORITY_ INTEGER,
    IN_PROGRESS_DUE_DATE_ TIMESTAMP(6),
    DUE_DATE_ TIMESTAMP(6),
    FORM_KEY_ VARCHAR(255),
    CATEGORY_ VARCHAR(255),
    TENANT_ID_ VARCHAR(255) default '',
    LAST_UPDATED_TIME_ TIMESTAMP(6),
    primary key (ID_)
);

create table ACT_HI_TSK_LOG (
    ID_ DECIMAL(19),
    TYPE_ VARCHAR(64),
    TASK_ID_ VARCHAR(64) not null,
    TIME_STAMP_ TIMESTAMP(6) not null,
    USER_ID_ VARCHAR(255),
    DATA_ VARCHAR(2000),
    EXECUTION_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    PROC_DEF_ID_ VARCHAR(64),
    SCOPE_ID_ VARCHAR(255),
    SCOPE_DEFINITION_ID_ VARCHAR(255),
    SUB_SCOPE_ID_ VARCHAR(255),
    SCOPE_TYPE_ VARCHAR(255),
    TENANT_ID_ VARCHAR(255) default '',
    primary key (ID_)
);

create sequence act_hi_task_evt_log_seq start with 1 increment by 1;

create index ACT_IDX_HI_TASK_SCOPE on ACT_HI_TASKINST(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_TASK_SUB_SCOPE on ACT_HI_TASKINST(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_TASK_SCOPE_DEF on ACT_HI_TASKINST(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);
