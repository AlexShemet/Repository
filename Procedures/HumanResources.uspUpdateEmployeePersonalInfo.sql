SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
--Procedure [HumanResources].[uspUpdateEmployeePersonalInfo] is encrypted. It could not be scripted
GO
EXEC sp_addextendedproperty N'MS_Description', N'Updates the Employee table with the values specified in the input parameters for the given EmployeeID.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeePersonalInfo. Enter a valid BusinessEntityID from the HumanResources.Employee table.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@BusinessEntityID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a national ID for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@NationalIDNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a birth date for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@BirthDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a marital status for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@MaritalStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a gender for the employee.', 'SCHEMA', N'HumanResources', 'PROCEDURE', N'uspUpdateEmployeePersonalInfo', 'PARAMETER', N'@Gender'
GO
