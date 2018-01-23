-- add_missing_spcp_fk

DELETE FROM SequencerPartitionContainer_Partition WHERE partitions_partitionId NOT IN (SELECT partitionId FROM _Partition);
ALTER TABLE SequencerPartitionContainer_Partition ADD CONSTRAINT spcp_partition_partitionid_fk FOREIGN KEY(partitions_partitionId) REFERENCES _Partition(partitionId);


-- instruments

-- StartNoTest
ALTER TABLE SequencerReference DROP FOREIGN KEY sequencerReference_upgradedReference_fkey;
ALTER TABLE Run DROP FOREIGN KEY fk_run_sequencerReference;
ALTER TABLE SequencerServiceRecord DROP FOREIGN KEY sequencerServiceRecord_sequencer_fkey;
-- EndNoTest

ALTER TABLE SequencerReference RENAME TO Instrument;
ALTER TABLE Instrument CHANGE COLUMN referenceId instrumentId bigint(20) AUTO_INCREMENT;
ALTER TABLE Instrument CHANGE COLUMN upgradedSequencerReferenceId upgradedInstrumentId bigint(20);
ALTER TABLE Instrument CHANGE COLUMN ip ip varchar(50) DEFAULT NULL;

-- StartNoTest
ALTER TABLE Instrument ADD CONSTRAINT fk_instrument_upgradedInstrument FOREIGN KEY(upgradedInstrumentId) REFERENCES Instrument(instrumentId);
ALTER TABLE Run ADD CONSTRAINT fk_run_instrument FOREIGN KEY(sequencerReference_sequencerReferenceId) REFERENCES Instrument(instrumentId);
ALTER TABLE SequencerServiceRecord ADD CONSTRAINT fk_serviceRecord_instrument FOREIGN KEY(sequencerReferenceId) REFERENCES Instrument(instrumentId);
-- EndNoTest

ALTER TABLE Run CHANGE COLUMN sequencerReference_sequencerReferenceId instrumentId bigint(20) NOT NULL;

ALTER TABLE SequencerServiceRecord RENAME TO ServiceRecord;
ALTER TABLE ServiceRecord CHANGE COLUMN sequencerReferenceId instrumentId bigint(20) NOT NULL;

ALTER TABLE Platform ADD COLUMN instrumentType varchar(50);
UPDATE Platform SET instrumentType = 'SEQUENCER';
ALTER TABLE Platform CHANGE COLUMN instrumentType instrumentType varchar(50) NOT NULL;


-- fix_collation

-- StartNoTest
SET foreign_key_checks = 0;
ALTER TABLE BoxPosition CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE ProjectOverview_Sample CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
SET foreign_key_checks = 1;
-- EndNoTest

DROP TABLE IF EXISTS Workflow;
DROP TABLE IF EXISTS WorkflowDefinition;
DROP TABLE IF EXISTS WorkflowDefinition_State;
DROP TABLE IF EXISTS WorkflowDefinition_WorkflowProcessDefinition;
DROP TABLE IF EXISTS WorkflowProcess;
DROP TABLE IF EXISTS WorkflowProcessDefinition;
DROP TABLE IF EXISTS WorkflowProcessDefinition_State;
DROP TABLE IF EXISTS WorkflowProcess_State;
DROP TABLE IF EXISTS Workflow_WorkflowProcess;


