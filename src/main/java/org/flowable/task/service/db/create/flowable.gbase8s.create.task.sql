create table ACT_RU_TASK (
    ID_ VARCHAR(64),
    REV_ INTEGER,
    EXECUTION_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    PROC_DEF_ID_ VARCHAR(64),
    TASK_DEF_ID_ VARCHAR(64),
    SCOPE_ID_ VARCHAR(255),
    SUB_SCOPE_ID_ VARCHAR(255),
    SCOPE_TYPE_ VARCHAR(255),
    SCOPE_DEFINITION_ID_ VARCHAR(255),
    PROPAGATED_STAGE_INST_ID_ VARCHAR(255),
    STATE_ VARCHAR(255),
    NAME_ VARCHAR(255),
    PARENT_TASK_ID_ VARCHAR(64),
    DESCRIPTION_ VARCHAR(2000),
    TASK_DEF_KEY_ VARCHAR(255),
    OWNER_ VARCHAR(255),
    ASSIGNEE_ VARCHAR(255),
    DELEGATION_ VARCHAR(64),
    PRIORITY_ INTEGER,
    CREATE_TIME_ TIMESTAMP(6),
    IN_PROGRESS_TIME_ TIMESTAMP(6),
    IN_PROGRESS_STARTED_BY_ VARCHAR(255),
    CLAIM_TIME_ TIMESTAMP(6),
    CLAIMED_BY_ VARCHAR(255),
    SUSPENDED_TIME_ TIMESTAMP(6),
    SUSPENDED_BY_ VARCHAR(255),
    IN_PROGRESS_DUE_DATE_ TIMESTAMP(6),
    DUE_DATE_ TIMESTAMP(6),
    CATEGORY_ VARCHAR(255),
    SUSPENSION_STATE_ INTEGER,
    TENANT_ID_ VARCHAR(255) DEFAULT '',
    FORM_KEY_ VARCHAR(255),
    IS_COUNT_ENABLED_ DECIMAL(1,0) CHECK (IS_COUNT_ENABLED_ IN (1,0)),
    VAR_COUNT_ INTEGER, 
    ID_LINK_COUNT_ INTEGER,
    SUB_TASK_COUNT_ INTEGER,
    primary key (ID_)
);

create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_TASK_SCOPE on ACT_RU_TASK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TASK_SUB_SCOPE on ACT_RU_TASK(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TASK_SCOPE_DEF on ACT_RU_TASK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('task.schema.version', '7.0.1.1', 1);
