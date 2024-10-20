create table ACT_HI_IDENTITYLINK (
    ID_ VARCHAR(64),
    GROUP_ID_ VARCHAR(255),
    TYPE_ VARCHAR(255),
    USER_ID_ VARCHAR(255),
    TASK_ID_ VARCHAR(64),
    CREATE_TIME_ TIMESTAMP(6),
    PROC_INST_ID_ VARCHAR(64),
    SCOPE_ID_ VARCHAR(255),
    SUB_SCOPE_ID_ VARCHAR(255),
    SCOPE_TYPE_ VARCHAR(255),
    SCOPE_DEFINITION_ID_ VARCHAR(255),
    primary key (ID_)
);

create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_);
create index ACT_IDX_HI_IDENT_LNK_SCOPE on ACT_HI_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_IDENT_LNK_SUB_SCOPE on ACT_HI_IDENTITYLINK(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_IDENT_LNK_SCOPE_DEF on ACT_HI_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);
