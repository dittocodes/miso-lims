SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Printer;
DELETE FROM Submission_Experiment;
DELETE FROM Submission;
DELETE FROM ExperimentChangeLog;
DELETE FROM Experiment_Run_Partition;
DELETE FROM Experiment;
DELETE FROM DetailedLibraryTemplate;
DELETE FROM LibraryTemplate;
DELETE FROM Transfer_Sample;
DELETE FROM Transfer_Library;
DELETE FROM Transfer_LibraryAliquot;
DELETE FROM Transfer_Pool;
DELETE FROM TransferChangeLog;
DELETE FROM Transfer;
DELETE FROM Workset_Sample;
DELETE FROM Workset_Library;
DELETE FROM Workset_LibraryAliquot;
DELETE FROM WorksetChangeLog;
DELETE FROM Workset;
DELETE FROM BoxPosition;
DELETE FROM BoxChangeLog;
DELETE FROM Box;
DELETE FROM Run_Partition;
DELETE FROM Run_Partition_LibraryAliquot;
DELETE FROM _Partition;
DELETE FROM Run_SequencerPartitionContainer;
DELETE FROM SequencerPartitionContainerChangeLog;
DELETE FROM SequencerPartitionContainer;
DELETE FROM SequencingContainerModel_InstrumentModel;
DELETE FROM SequencingContainerModel;
DELETE FROM RunIllumina;
DELETE FROM RunIonTorrent;
DELETE FROM RunLS454;
DELETE FROM RunPacBio;
DELETE FROM RunOxfordNanopore;
DELETE FROM RunChangeLog;
DELETE FROM Run;
DELETE FROM PoolQC;
DELETE FROM PoolOrder_LibraryAliquot;
DELETE FROM PoolOrder;
DELETE FROM SequencingOrder;
DELETE FROM Pool_LibraryAliquot;
DELETE FROM Pool_Note;
DELETE FROM PoolChangeLog;
DELETE FROM Pool;
DELETE FROM ArrayRunChangeLog;
DELETE FROM ArrayRun;
DELETE FROM ArrayPosition;
DELETE FROM ArrayChangeLog;
DELETE FROM Array;
DELETE FROM ArrayModel;
DELETE FROM LibraryQC;
DELETE FROM LibraryAliquotChangeLog;
DELETE FROM LibraryAliquot;
DELETE FROM Library_Note;
DELETE FROM LibraryChangeLog;
DELETE FROM Library;
DELETE FROM LibraryDesign;
DELETE FROM LibraryDesignCode;
DELETE FROM LibrarySpikeIn;
DELETE FROM SampleQC;
DELETE FROM Sample_Note;
DELETE FROM SampleChangeLog;
DELETE FROM Sample;
DELETE FROM SampleValidRelationship;
DELETE FROM SampleClass;
DELETE FROM TissueMaterial;
DELETE FROM TissueOrigin;
DELETE FROM TissueType;
DELETE FROM Lab;
DELETE FROM Stain;
DELETE FROM SamplePurpose;
DELETE FROM DetailedQcStatus;
DELETE FROM QcControl;
DELETE FROM QCType;
DELETE FROM LibraryType;
DELETE FROM LibrarySelectionType;
DELETE FROM LibraryStrategyType;
DELETE FROM TargetedSequencing_KitDescriptor;
DELETE FROM TargetedSequencing;
DELETE FROM KitDescriptorChangeLog;
DELETE FROM KitDescriptor;
DELETE FROM BoxUse;
DELETE FROM BoxSize;
DELETE FROM Indices;
DELETE FROM IndexFamily;
DELETE FROM SequencingParameters;
DELETE FROM ServiceRecord;
DELETE FROM Instrument WHERE upgradedInstrumentId IS NOT NULL;
DELETE FROM Instrument;
DELETE FROM InstrumentPosition;
DELETE FROM Experiment;
DELETE FROM InstrumentModel;
DELETE FROM StudyChangeLog;
DELETE FROM Study;
DELETE FROM SampleNumberPerProject;
DELETE FROM Subproject;
DELETE FROM ProjectChangeLog;
DELETE FROM Project;
DELETE FROM ReferenceGenome;
DELETE FROM Note;
DELETE FROM Deletion;
DELETE FROM User_Group;
DELETE FROM User;
DELETE FROM _Group;
DELETE FROM StorageLabel;
DELETE FROM StorageLocation;
DELETE FROM StorageLocationMap;
DELETE FROM RunPurpose;
DELETE FROM AttachmentCategory;
DELETE FROM StainCategory;
DELETE FROM SampleType;
DELETE FROM PartitionQCType;
DELETE FROM StudyType;
DELETE FROM TissuePieceType;
DELETE FROM Workstation;
DELETE FROM SequencingControlType;
DELETE FROM ScientificName;
DELETE FROM Sop;
DELETE FROM Pipeline;
DELETE FROM RunLibraryQcStatus;
DELETE FROM WorksetCategory;
DELETE FROM WorksetStage;
SET FOREIGN_KEY_CHECKS=1;
