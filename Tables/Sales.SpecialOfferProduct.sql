SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SpecialOfferProduct] (
		[SpecialOfferID]     [int] NOT NULL,
		[ProductID]          [int] NOT NULL,
		[rowguid]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]       [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	ADD
	CONSTRAINT [PK_SpecialOfferProduct_SpecialOfferID_ProductID]
	PRIMARY KEY
	CLUSTERED
	([SpecialOfferID], [ProductID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'INDEX', N'PK_SpecialOfferProduct_SpecialOfferID_ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'PK_SpecialOfferProduct_SpecialOfferID_ProductID'
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	ADD
	CONSTRAINT [DF_SpecialOfferProduct_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'DF_SpecialOfferProduct_rowguid'
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	ADD
	CONSTRAINT [DF_SpecialOfferProduct_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'DF_SpecialOfferProduct_ModifiedDate'
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	WITH CHECK
	ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Sales].[SpecialOfferProduct]
	CHECK CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]

GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'FK_SpecialOfferProduct_Product_ProductID'
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	WITH CHECK
	ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
	FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer] ([SpecialOfferID])
ALTER TABLE [Sales].[SpecialOfferProduct]
	CHECK CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]

GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SpecialOffer.SpecialOfferID.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'CONSTRAINT', N'FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID'
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOfferProduct_rowguid]
	ON [Sales].[SpecialOfferProduct] ([rowguid])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'INDEX', N'AK_SpecialOfferProduct_rowguid'
GO
CREATE NONCLUSTERED INDEX [IX_SpecialOfferProduct_ProductID]
	ON [Sales].[SpecialOfferProduct] ([ProductID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'INDEX', N'IX_SpecialOfferProduct_ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping products to special offer discounts.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for SpecialOfferProduct records.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'SpecialOfferID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'ProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'SpecialOfferProduct', 'COLUMN', N'ModifiedDate'
GO
ALTER TABLE [Sales].[SpecialOfferProduct] SET (LOCK_ESCALATION = TABLE)
GO
