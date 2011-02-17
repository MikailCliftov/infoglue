DROP SEQUENCE cmAvailServBind_seq;
CREATE SEQUENCE cmAvailServBind_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmAvailServBind;
CREATE TABLE cmAvailServBind (
  AvailServBindId number  NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  visualizationAction varchar2(100) NOT NULL,
  isMandatory number default 0 NOT NULL,
  isUserEditable number default 0 NOT NULL,
  isInheritable number default 0 NOT NULL,
  PRIMARY KEY  (AvailServBindId)
);


DROP SEQUENCE cmAvailServBindSiNoTypeDef_seq;
CREATE SEQUENCE cmAvailServBindSiNoTypeDef_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmAvailServBindSiNoTypeDef;
CREATE TABLE cmAvailServBindSiNoTypeDef (
  AvailServBindId number default 0 NOT NULL,
  SiNoTypeDefId number default 0 NOT NULL,
  PRIMARY KEY  (AvailServBindId, SiNoTypeDefId)
);


DROP SEQUENCE cmCont_seq;
CREATE SEQUENCE cmCont_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmCont;
CREATE TABLE cmCont (
  ContId number  NOT NULL,
  name varchar2(100) NOT NULL,
  publishDateTime date  NOT NULL,
  expireDateTime date  NOT NULL,
  contentTypeDefId number default NULL,
  parentContId number default NULL,
  creator varchar2(100) NOT NULL,
  repositoryId number default 0 NOT NULL,
  isBranch number default 0 NOT NULL,
  isProtected number default 2 NOT NULL,
  isDeleted int NOT NULL DEFAULT 0,
);


DROP SEQUENCE cmContRelation_seq;
CREATE SEQUENCE cmContRelation_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmContRelation;
CREATE TABLE cmContRelation (
  ContRelationId number  NOT NULL,
  relationInternalName varchar2(100) NOT NULL,
  relationTypeId number default 0 NOT NULL,
  sourceContId number default 0 NOT NULL,
  destinationContId number default 0 NOT NULL,
  PRIMARY KEY  (ContRelationId)
);


DROP SEQUENCE cmContentTypeDef_seq;
CREATE SEQUENCE cmContentTypeDef_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmContentTypeDef;
CREATE TABLE cmContentTypeDef (
  contentTypeDefId number  NOT NULL,
  schemaValue clob NOT NULL,
  name varchar2(100) NOT NULL,
  type number default 0 NOT NULL,
  PRIMARY KEY  (contentTypeDefId)
);


DROP SEQUENCE cmContVer_seq;
CREATE SEQUENCE cmContVer_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmContVer;
CREATE TABLE cmContVer (
  ContVerId number  NOT NULL,
  stateId number default 0 NOT NULL,
  VerValue clob NOT NULL,
  modifiedDateTime date  NOT NULL,
  VerComment varchar2(1024),
  isCheckedOut number default 0 NOT NULL,
  isActive number default 1 NOT NULL,
  ContId number default 0 NOT NULL,
  languageId number default 0 NOT NULL,
  versionModifier varchar2(1024) NOT NULL,
  PRIMARY KEY  (ContVerId)
);


DROP SEQUENCE cmContVerDigAsset_seq;
CREATE SEQUENCE cmContVerDigAsset_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmContVerDigAsset;
CREATE TABLE cmContVerDigAsset (
  ContVerId number default 0 NOT NULL,
  DigAssetId number default 0 NOT NULL,
  PRIMARY KEY  (ContVerId, DigAssetId)
);

DROP SEQUENCE cmUserPropDigAsset_seq;
DROP SEQUENCE cmDigAsset_seq;
CREATE SEQUENCE cmDigAsset_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmDigAsset;
CREATE TABLE cmDigAsset (
  DigAssetId number  NOT NULL,
  assetKey varchar2(255) NOT NULL,
  assetFileName varchar2(1024) NOT NULL,
  assetFilepath varchar2(1024) NOT NULL,
  assetFileSize number default 0 NOT NULL,
  assetContentType varchar2(255) NOT NULL,
  assetBlob blob,
  PRIMARY KEY  (DigAssetId)
);


CREATE SEQUENCE cmLanguage_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmLanguage;
CREATE TABLE cmLanguage (
  languageId number  NOT NULL,
  name varchar2(100) NOT NULL,
  languageCode varchar2(5) NOT NULL,
  charset varchar2(30) NOT NULL,
  PRIMARY KEY  (languageId)
);


DROP SEQUENCE cmPublication_seq;
CREATE SEQUENCE cmPublication_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmPublication;
CREATE TABLE cmPublication (
  publicationId number  NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  publicationDateTime date  NOT NULL,
  publisher varchar2(100) NOT NULL,
  repositoryId number default 0 NOT NULL,
  PRIMARY KEY  (publicationId)
);


DROP SEQUENCE cmQualifyer_seq;
CREATE SEQUENCE cmQualifyer_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmQualifyer;
CREATE TABLE cmQualifyer (
  qualifyerId number  NOT NULL,
  name varchar2(100) NOT NULL,
  value varchar2(100) NOT NULL,
  sortOrder number default 0 NOT NULL,
  ServBindId number default 0 NOT NULL,
  PRIMARY KEY  (qualifyerId)
);


DROP SEQUENCE cmRepository_seq;
CREATE SEQUENCE cmRepository_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmRepository;
CREATE TABLE cmRepository (
  repositoryId number  NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  dnsName varchar2(255),
  PRIMARY KEY  (repositoryId)
);


DROP SEQUENCE cmRepositoryContTypeDef_seq;
CREATE SEQUENCE cmRepositoryContTypeDef_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmRepositoryContTypeDef;
CREATE TABLE cmRepositoryContTypeDef (
  repositoryId number default 0 NOT NULL,
  contentTypeDefId number default 0 NOT NULL,
  PRIMARY KEY  (repositoryId, contentTypeDefId)
);


DROP SEQUENCE cmRepositoryLanguage_seq;
CREATE SEQUENCE cmRepositoryLanguage_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmRepositoryLanguage;
CREATE TABLE cmRepositoryLanguage (
  repositoryLanguageId number  NOT NULL,
  repositoryId number default 0 NOT NULL,
  languageId number default 0 NOT NULL,
  isPublished number default 0 NOT NULL,
  PRIMARY KEY  (repositoryLanguageId)
);


DROP SEQUENCE cmRole_seq;
CREATE SEQUENCE cmRole_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmRole;
CREATE TABLE cmRole (
  roleName varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  PRIMARY KEY  (roleName)
);


DROP SEQUENCE cmServBind_seq;
CREATE SEQUENCE cmServBind_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmServBind;
CREATE TABLE cmServBind (
  ServBindId number  NOT NULL,
  name varchar2(100) NOT NULL,
  path varchar2(255) NOT NULL,
  BindTypeId number default 0 NOT NULL,
  ServDefId number default 0 NOT NULL,
  AvailServBindId number default 0 NOT NULL,
  SiNoVerId number default 0 NOT NULL,
  PRIMARY KEY  (ServBindId)
);


DROP SEQUENCE cmServDef_seq;
CREATE SEQUENCE cmServDef_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmServDef;
CREATE TABLE cmServDef (
  ServDefId number  NOT NULL,
  className varchar2(100) NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  PRIMARY KEY  (ServDefId)
);


DROP SEQUENCE cmServDefAvailServBind_seq;
CREATE SEQUENCE cmServDefAvailServBind_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmServDefAvailServBind;
CREATE TABLE cmServDefAvailServBind (
  ServDefId number default 0 NOT NULL,
  AvailServBindId number default 0 NOT NULL,
  PRIMARY KEY  (ServDefId, AvailServBindId)
);


DROP SEQUENCE cmSiNo_seq;
CREATE SEQUENCE cmSiNo_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmSiNo;
CREATE TABLE cmSiNo (
  SiNoId number NOT NULL,
  name varchar2(100) NOT NULL,
  publishDateTime date NOT NULL,
  expireDateTime date NOT NULL,
  parentSiNoId number default NULL,
  creator varchar2(100) NOT NULL,
  repositoryId number default 0 NOT NULL,
  SiNoTypeDefId number default 0,
  isBranch number default 0 NOT NULL,
  PRIMARY KEY  (SiNoId)
);


DROP SEQUENCE cmSiNoTypeDef_seq;
CREATE SEQUENCE cmSiNoTypeDef_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmSiNoTypeDef;
CREATE TABLE cmSiNoTypeDef (
  SiNoTypeDefId number  NOT NULL,
  invokerClassName varchar2(100) NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  PRIMARY KEY  (SiNoTypeDefId)
);


DROP SEQUENCE cmSiNoVer_seq;
CREATE SEQUENCE cmSiNoVer_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmSiNoVer;
CREATE TABLE cmSiNoVer (

DROP SEQUENCE cmSystemUser_seq;
CREATE SEQUENCE cmSystemUser_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmSystemUser;
CREATE TABLE cmSystemUser (
  userName varchar2(100) NOT NULL,
  password varchar2(100) NOT NULL,
  firstName varchar2(100) NOT NULL,
  lastName varchar2(100) NOT NULL,
  email varchar2(255) NOT NULL,
  PRIMARY KEY  (userName)
);


DROP SEQUENCE cmSystemUserRole_seq;
CREATE SEQUENCE cmSystemUserRole_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmSystemUserRole;
CREATE TABLE cmSystemUserRole (
  userName varchar2(100) NOT NULL,
  roleName varchar2(100) NOT NULL,
  PRIMARY KEY  (userName, roleName)
);


DROP SEQUENCE cmTransactionHistory_seq;
CREATE SEQUENCE cmTransactionHistory_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmTransactionHistory;
CREATE TABLE cmTransactionHistory (
  transactionHistoryId number  NOT NULL,
  name varchar2(200) NOT NULL,
  transactionDateTime date  NOT NULL,
  transactionTypeId number default 0 NOT NULL,
  transactionObjectId varchar2(200) NOT NULL,
  transactionObjectName varchar2(200) NOT NULL,
  systemUserName varchar2(200) NOT NULL,
  PRIMARY KEY  (transactionHistoryId)
);


DROP SEQUENCE cmPublicationDetail_seq;
CREATE SEQUENCE cmPublicationDetail_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmPublicationDetail;
CREATE TABLE cmPublicationDetail (
  publicationDetailId number  NOT NULL,
  publicationId number default 0 NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  entityClass varchar2(255) NOT NULL,
  entityId number default 0 NOT NULL,
  creationDateTime date NOT NULL,
  typeId number default 0 NOT NULL,
  publisher varchar2(100) NOT NULL,
  PRIMARY KEY  (publicationDetailId)
);


DROP SEQUENCE cmEvent_seq;
CREATE SEQUENCE cmEvent_seq START WITH 1 INCREMENT BY 1;
DROP TABLE cmEvent;
CREATE TABLE cmEvent (
  eventId number  NOT NULL,
  repositoryId number default 0 NOT NULL,
  name varchar2(100) NOT NULL,
  description varchar2(255) NOT NULL,
  entityClass varchar2(255) NOT NULL,
  entityId number default 0 NOT NULL,
  creationDateTime date NOT NULL,
  typeId number default 0 NOT NULL,
  creator varchar2(100) NOT NULL,
  PRIMARY KEY  (eventId)
);



COMMIT;