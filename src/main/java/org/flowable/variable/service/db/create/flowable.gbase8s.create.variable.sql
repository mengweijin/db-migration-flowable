create table ACT_RU_VARIABLE (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    TYPE_ VARCHAR(255) not null,
    NAME_ VARCHAR(255) not null,
    EXECUTION_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    TASK_ID_ VARCHAR(64),
    SCOPE_ID_ VARCHAR(255),
    SUB_SCOPE_ID_ VARCHAR(255),
    SCOPE_TYPE_ VARCHAR(255),
    BYTEARRAY_ID_ VARCHAR(64),
    DOUBLE_ DECIMAL(28,10),
    LONG_ DECIMAL(19,0),
    TEXT_ VARCHAR(2000),
    TEXT2_ VARCHAR(2000),
    META_INFO_ VARCHAR(2000),
    primary key (ID_)
);

create index ACT_IDX_RU_VAR_SCOPE_ID_TYPE on ACT_RU_VARIABLE(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_RU_VAR_SUB_ID_TYPE on ACT_RU_VARIABLE(SUB_SCOPE_ID_, SCOPE_TYPE_);

create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE(BYTEARRAY_ID_);
alter table ACT_RU_VARIABLE 
    add constraint
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

insert into ACT_GE_PROPERTY values ('variable.schema.version', '7.0.1.1', 1);
