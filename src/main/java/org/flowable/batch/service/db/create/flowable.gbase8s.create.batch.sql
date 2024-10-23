create table FLW_RU_BATCH (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    TYPE_ VARCHAR(64) not null,
    SEARCH_KEY_ VARCHAR(255),
    SEARCH_KEY2_ VARCHAR(255),
    CREATE_TIME_ TIMESTAMP(6) not null,
    COMPLETE_TIME_ TIMESTAMP(6),
    STATUS_ VARCHAR(255),
    BATCH_DOC_ID_ VARCHAR(64),
    TENANT_ID_ VARCHAR(255) default '',
    primary key (ID_)
);

create table FLW_RU_BATCH_PART (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    BATCH_ID_ VARCHAR(64),
    TYPE_ VARCHAR(64) not null,
    SCOPE_ID_ VARCHAR(64),
    SUB_SCOPE_ID_ VARCHAR(64),
    SCOPE_TYPE_ VARCHAR(64),
    SEARCH_KEY_ VARCHAR(255),
    SEARCH_KEY2_ VARCHAR(255),
    CREATE_TIME_ TIMESTAMP(6) not null,
    COMPLETE_TIME_ TIMESTAMP(6),
    STATUS_ VARCHAR(255),
    RESULT_DOC_ID_ VARCHAR(64),
    TENANT_ID_ VARCHAR(255) default '',
    primary key (ID_)
);

create index FLW_IDX_BATCH_PART on FLW_RU_BATCH_PART(BATCH_ID_);

alter table FLW_RU_BATCH_PART
    add constraint
    foreign key (BATCH_ID_)
    references FLW_RU_BATCH (ID_);

insert into ACT_GE_PROPERTY values ('batch.schema.version', '6.8.0.0', 1);
