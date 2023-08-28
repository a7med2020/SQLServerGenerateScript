
    IF OBJECT_ID('[Finance].[GetACHTransactionLog]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[GetACHTransactionLog]
                   
GO

    IF OBJECT_ID('[CC].[GetAllOrganizations]', 'P') IS NOT NULL
    DROP PROCEDURE [CC].[GetAllOrganizations]
                   
GO

    IF OBJECT_ID('[Finance].[GetACHTransactionLogToExport]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[GetACHTransactionLogToExport]
                   
GO

    IF OBJECT_ID('[Finance].[InsertOnlineACHReconciliationFromACHTransactionLog]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[InsertOnlineACHReconciliationFromACHTransactionLog]
                   
GO

    IF OBJECT_ID('[Finance].[RetrieveOnlineACHReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[RetrieveOnlineACHReconciliation]
                   
GO

    IF OBJECT_ID('[Customers].[GenericMatchingCustomers]', 'P') IS NOT NULL
    DROP PROCEDURE [Customers].[GenericMatchingCustomers]
                   
GO

    IF OBJECT_ID('[Finance].[UpdateOnlineACHReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[UpdateOnlineACHReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[UpdateAfterMatchingOnlineACHReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[UpdateAfterMatchingOnlineACHReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[CleanUpOnlineACHReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[CleanUpOnlineACHReconciliation]
                   
GO

    IF OBJECT_ID('[Customers].[GetUnderwritingMembersForManualMatch]', 'P') IS NOT NULL
    DROP PROCEDURE [Customers].[GetUnderwritingMembersForManualMatch]
                   
GO

    IF OBJECT_ID('[Customers].[GetUnderwritingCustomersForManualMatch]', 'P') IS NOT NULL
    DROP PROCEDURE [Customers].[GetUnderwritingCustomersForManualMatch]
                   
GO

    IF OBJECT_ID('[Finance].[GetUwMembersForACHReturnReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[GetUwMembersForACHReturnReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[GetUwCustomersForACHReturnReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[GetUwCustomersForACHReturnReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[GetAgenciesForACHReturnReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[GetAgenciesForACHReturnReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[GetACHTransactionLogById]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[GetACHTransactionLogById]
                   
GO

    IF OBJECT_ID('[Finance].[UpdateACHReturnReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[UpdateACHReturnReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[RetrieveACHReturnReconciliation]', 'P') IS NOT NULL
    DROP PROCEDURE [Finance].[RetrieveACHReturnReconciliation]
                   
GO

    IF OBJECT_ID('[Finance].[CalcCustomerLastMonthPremium]', 'FN') IS NOT NULL
    DROP FUNCTION [Finance].[CalcCustomerLastMonthPremium]
                   
GO

    IF OBJECT_ID('[Finance].[CalcMemberLastMonthPremium]', 'FN') IS NOT NULL
    DROP FUNCTION [Finance].[CalcMemberLastMonthPremium]
                   
GO

    IF OBJECT_ID('[Finance].[ACHReconciliationAmountExceedPremiumXTimes]', 'FN') IS NOT NULL
    DROP FUNCTION [Finance].[ACHReconciliationAmountExceedPremiumXTimes]
                   
GO

    IF OBJECT_ID('[dbo].[GetPhoneFormatted]', 'FN') IS NOT NULL
    DROP FUNCTION [dbo].[GetPhoneFormatted]
                   
GO
---===================================================================================================================================
---===================================================================================================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [Finance].[CalcCustomerLastMonthPremium]
(
    @UwCustomerId INT
)
RETURNS NUMERIC(38, 6)
AS
BEGIN
    DECLARE @Result NUMERIC(38, 6);

    SET @Result =
    (
        SELECT TOP 1
               SUM(members.Premium)
        FROM Finance.PrimaryMonthlyPremium members
            INNER JOIN Policy.UwMemberCase memCase
                ON members.UwMemberCaseId = memCase.UwMemberCaseId
            INNER JOIN Policy.UwCustomerCase custCase
                ON memCase.UwCustomerCaseId = custCase.UwCustomerCaseId
            INNER JOIN Underwriting.AppCase cases
                ON custCase.AppCaseId = cases.AppCaseId
            INNER JOIN Underwriting.CaseStatus cStatus
                ON cases.CaseStatusId = cStatus.CaseStatusId
            INNER JOIN Customers.UwMember mem
                ON memCase.UwMemberId = mem.UwMemberId
            LEFT JOIN Underwriting.CobraType ctype
                ON mem.CobraTypeId = ctype.CobraTypeId
        WHERE custCase.UwCustomerId = @UwCustomerId
              AND members.IsActive = 1
              AND
              (
                  ISNULL(mem.CobraContinueCoverage, 0) = 0
                  OR
                  (
                      mem.CobraContinueCoverage = 1
                      AND ctype.IsBillDirect = 0
                  )
              )
        GROUP BY members.EffectiveDate
        ORDER BY members.EffectiveDate DESC
    )
    RETURN @Result;

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Finance].[CalcMemberLastMonthPremium]
(
    @uwMemberId INT
)
RETURNS NUMERIC(38, 6)
AS
BEGIN

    RETURN Finance.CalcMemberFullMonthPremium(@uwMemberId);

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Finance].[ACHReconciliationAmountExceedPremiumXTimes]
(
    @InsuredTypeActual NVARCHAR(2),
	@UwCustomerId INT,
    @uwMemberId INT,
	@Amount DECIMAL(18,2),
	@Times int
)
RETURNS BIT
AS
BEGIN
   DECLARE @Premium  NUMERIC(38, 6)

   IF(@InsuredTypeActual = 'GR' AND @UwCustomerId IS NOT NULL)
   BEGIN
     set @Premium = (SELECT  [Finance].[CalcCustomerLastMonthPremium] (@UwCustomerId))
   END
    Else IF(@InsuredTypeActual = 'IN' AND @uwMemberId IS NOT NULL)
   BEGIN
    set @Premium = (SELECT  [Finance].[CalcMemberLastMonthPremium] (@uwMemberId))
   END
	ELSE
      BEGIN
	      RETURN 0
	  END

	  IF((@Times * @Premium) <= @Amount)
	    RETURN 1
	 
	    RETURN 0
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetPhoneFormatted]
(
    @PhoneNumber NVARCHAR(30)
)
RETURNS NVARCHAR(30)
AS
BEGIN

IF(ISNUMERIC(@PhoneNumber) = 1)
BEGIN
			RETURN Case
		when len(@PhoneNumber) < 7   then @PhoneNumber
		when len(@PhoneNumber) = 7    then Substring(@PhoneNumber,1,3) + '-' + substring(@PhoneNumber,4,4)
		when len(@PhoneNumber) >=7   then substring(@PhoneNumber,1,3) + '-' + substring(@PhoneNumber,4,3) + '-' + substring(@PhoneNumber,7,4)
		when len(@PhoneNumber) > 10  then substring(@PhoneNumber,1,3) + '-' + substring(@PhoneNumber,4,3) + '-' + substring(@PhoneNumber,7,4) + ' ' + substring(@PhoneNumber,11,50)
		else    @PhoneNumber END
END
  
     RETURN @PhoneNumber
END

 
 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ahmed Elgendy>
-- Create date: <2023-02-22>
-- Description:	<Getting and searching Transaction Log which is data of ACH enrolled accounts>
-- =============================================
CREATE PROCEDURE [Finance].[GetACHTransactionLog]
	-- Add the parameters for the stored procedure here
	@DateFrom DATETIME, 
	@DateTo DATETIME, 
	@HIASPrimaryNumber NVARCHAR(40), 
	@HIASCustomerNumber NVARCHAR(40), 
	@OrganizationId NVARCHAR(10), 
	@InsuredType NVARCHAR(2), 
	@LastName NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@Address NVARCHAR(100),
	@City NVARCHAR(100),
	@State NVARCHAR(40),
	@ZIPCode NVARCHAR(40),
	@EmailAddress NVARCHAR(100),
	@PhoneNumber NVARCHAR(30),
	@ContactName NVARCHAR(150),
	@AccountNumber NVARCHAR(40),
	@RecurringPayments BIT,
	@OneTimePayment BIT,
	@CompanyName nvarchar(100) 
    , @PageNumber INT=1, @PageSize INT=NULL, @SortField VARCHAR (128)=NULL, @SortDirection VARCHAR (20)=NULL
AS
BEGIN

----------------------------------------------- Paging -------------------------------------------------------
    DECLARE @LowerLimit INT
	DECLARE @UpperLimit INT

	SET @LowerLimit = (@PageNumber - 1) * @PageSize + 1
	SET @UpperLimit = @PageNumber * @PageSize

----------------------------------- TotalRecords ---------------------------------------------------------------
	SELECT
		COUNT(1) TotalRecords
		FROM [CC].[ACHTransactionLog]
	WHERE 
    (CAST(DateTimeStamp AS DATE) >= CAST(@DateFrom AS DATE) OR @DateFrom IS NULL)
  and (CAST(DateTimeStamp AS DATE) <=  CAST(@DateTo AS DATE) OR @DateTo IS NULL)
  and (HIASPrimaryNumber  = @HIASPrimaryNumber OR @HIASPrimaryNumber IS NULL)
  and (HIASCustomerNumber  = @HIASCustomerNumber OR @HIASCustomerNumber IS NULL)
  and (OrganizationId  = @OrganizationId OR @OrganizationId IS NULL)
  and (InsuredType  = @InsuredType OR @InsuredType IS NULL)
  and (LastName like N'%'+@LastName+'%' OR @LastName IS NULL)
  and (FirstName like N'%'+@FirstName+'%' OR @FirstName IS NULL)
  and (AddressLine1 like N'%'+@Address+'%' OR AddressLine2 like N'%'+@Address+'%'  OR @Address IS NULL)
  and (City like N'%'+@City+'%' OR @City IS NULL)
  and ([State]  = @State OR @State IS NULL)
  and (ZIPCode  = @ZIPCode OR @ZIPCode IS NULL)
  and (EmailAddress  = @EmailAddress OR @EmailAddress IS NULL)
  and (PhoneNumber  = @PhoneNumber OR @PhoneNumber IS NULL)
  and (ContactName like N'%'+@ContactName+'%' OR @ContactName IS NULL)
  and (BankAccountNumber  = @AccountNumber OR @AccountNumber IS NULL)
  and ((@RecurringPayments = 1 and RecurringPayments  = 'Y') OR @RecurringPayments = 0)
  and ((@OneTimePayment = 1 and OneTimePayment  = 'Y') OR @OneTimePayment = 0)
  AND (CompanyName LIKE N'%'+@CompanyName+'%' or  @CompanyName IS null  )

  -------------------------------- If Ascending Oder--------------------------------------------------------------------
	IF ISNULL(@SortDirection,'Ascending') = 'Ascending'
		BEGIN
		SELECT * from
	(SELECT [ACHTransactionLogId]
      ,[DateTimeStamp]
      ,[OrganizationId]
      ,[InsuredType]
      ,[GroupMemberNumber]
      ,[HIASPrimaryNumber]
      ,[FirstName]
      ,[LastName]
      ,[CompanyName]
      ,[HIASCustomerNumber]
      --,[PhoneNumber]
	  ,[dbo].[GetPhoneFormatted]([PhoneNumber]) PhoneNumber
      ,[EmailAddress]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[State]
      ,[ZIPCode]
      ,[ContactName]
      ,[AccountName]
      ,[CheckingSaving]
      ,[BankRoutingNumber]
      ,[BankAccountNumber]
      ,[RecurringPayments]
      ,[RecurringStartDate]
      ,[OneTimePayment]
      ,[OneTimeAmount]
      ,[OneTimeDate]
	  ,[Signature]
	  ,[IPAddress]
      ,[ErrorCorrection]
      ,[ValidationTimeStamp]
      ,[ValidationStatus]
      ,[ErrorState]
      ,[ErrorZIPCode]
      ,[ErrorBankRoutingNumber]
      ,[ErrorGeneral]
	  ,[EmailConfirmationDateTime]
      ,[HIASExportDateTime]
      ,[OnlineACHReconciliationId]
	  ,CASE ISNULL(@SortField,'default')WHEN 'default' THEN ROW_NUMBER() OVER(ORDER BY ACHTransactionLogId DESC)
							WHEN 'DateTimeStamp' THEN ROW_NUMBER() OVER(ORDER BY DateTimeStamp ASC)
							WHEN 'HIASPrimaryNumber' THEN ROW_NUMBER() OVER(ORDER BY HIASPrimaryNumber ASC)
							WHEN 'HIASCustomerNumber' THEN ROW_NUMBER() OVER(ORDER BY HIASCustomerNumber ASC)
							WHEN 'OrganizationId' THEN ROW_NUMBER() OVER(ORDER BY OrganizationId ASC)
							WHEN 'InsuredType' THEN ROW_NUMBER() OVER(ORDER BY InsuredType ASC)
							WHEN 'GroupMemberNumber' THEN ROW_NUMBER() OVER(ORDER BY GroupMemberNumber ASC)
							WHEN 'FirstName' THEN ROW_NUMBER() OVER(ORDER BY FirstName ASC)
							WHEN 'LastName' THEN ROW_NUMBER() OVER(ORDER BY LastName ASC)
							WHEN 'CompanyName' THEN ROW_NUMBER() OVER(ORDER BY CompanyName ASC)
							WHEN 'PhoneNumber' THEN ROW_NUMBER() OVER(ORDER BY PhoneNumber ASC)
							WHEN 'EmailAddress' THEN ROW_NUMBER() OVER(ORDER BY EmailAddress ASC)
							WHEN 'AddressLine1' THEN ROW_NUMBER() OVER(ORDER BY AddressLine1 ASC)
							WHEN 'AddressLine2' THEN ROW_NUMBER() OVER(ORDER BY AddressLine2 ASC)
							WHEN 'City' THEN ROW_NUMBER() OVER(ORDER BY City ASC)
							WHEN 'State' THEN ROW_NUMBER() OVER(ORDER BY [State] ASC)
							WHEN 'ZIPCode' THEN ROW_NUMBER() OVER(ORDER BY ZIPCode ASC)
							WHEN 'ContactName' THEN ROW_NUMBER() OVER(ORDER BY ContactName ASC)
							WHEN 'AccountName' THEN ROW_NUMBER() OVER(ORDER BY AccountName ASC)
							WHEN 'CheckingSaving' THEN ROW_NUMBER() OVER(ORDER BY CheckingSaving ASC)
							WHEN 'BankRoutingNumber' THEN ROW_NUMBER() OVER(ORDER BY BankRoutingNumber ASC)
							WHEN 'BankAccountNumber' THEN ROW_NUMBER() OVER(ORDER BY BankAccountNumber ASC)
							WHEN 'RecurringPayments' THEN ROW_NUMBER() OVER(ORDER BY RecurringPayments ASC)
							WHEN 'RecurringStartDate' THEN ROW_NUMBER() OVER(ORDER BY RecurringStartDate ASC)
							WHEN 'OneTimePayment' THEN ROW_NUMBER() OVER(ORDER BY OneTimePayment ASC)
							WHEN 'OneTimeAmount' THEN ROW_NUMBER() OVER(ORDER BY OneTimeAmount ASC)
							WHEN 'OneTimeDate' THEN ROW_NUMBER() OVER(ORDER BY OneTimeDate ASC)
							WHEN 'Signature' THEN ROW_NUMBER() OVER(ORDER BY [Signature] ASC)
							WHEN 'IPAddress' THEN ROW_NUMBER() OVER(ORDER BY IPAddress ASC)
							WHEN 'ErrorCorrection' THEN ROW_NUMBER() OVER(ORDER BY ErrorCorrection ASC)
							WHEN 'ValidationTimeStamp' THEN ROW_NUMBER() OVER(ORDER BY ValidationTimeStamp ASC)
							WHEN 'ValidationStatus' THEN ROW_NUMBER() OVER(ORDER BY ValidationStatus ASC)
							WHEN 'ErrorState' THEN ROW_NUMBER() OVER(ORDER BY ErrorState ASC)
							WHEN 'ErrorZIPCode' THEN ROW_NUMBER() OVER(ORDER BY ErrorZIPCode ASC)
							WHEN 'ErrorBankRoutingNumber' THEN ROW_NUMBER() OVER(ORDER BY ErrorBankRoutingNumber ASC)
							WHEN 'ErrorGeneral' THEN ROW_NUMBER() OVER(ORDER BY ErrorGeneral ASC)
							WHEN 'EmailConfirmationDateTime' THEN ROW_NUMBER() OVER(ORDER BY EmailConfirmationDateTime ASC)
							WHEN 'HIASExportDateTime' THEN ROW_NUMBER() OVER(ORDER BY HIASExportDateTime ASC)
							WHEN 'OnlineACHReconciliationId' THEN ROW_NUMBER() OVER(ORDER BY OnlineACHReconciliationId ASC)
							
							
							 
						END AS RowNum 
  FROM [CC].[ACHTransactionLog]
  WHERE 
  (CAST(DateTimeStamp AS DATE) >= CAST(@DateFrom AS DATE) OR @DateFrom IS NULL)
  and (CAST(DateTimeStamp AS DATE) <=  CAST(@DateTo AS DATE) OR @DateTo IS NULL)
  and (HIASPrimaryNumber  = @HIASPrimaryNumber OR @HIASPrimaryNumber IS NULL)
  and (HIASCustomerNumber  = @HIASCustomerNumber OR @HIASCustomerNumber IS NULL)
  and (OrganizationId  = @OrganizationId OR @OrganizationId IS NULL)
  and (InsuredType  = @InsuredType OR @InsuredType IS NULL)
  and (LastName like N'%'+@LastName+'%' OR @LastName IS NULL)
  and (FirstName like N'%'+@FirstName+'%' OR @FirstName IS NULL)
  and (AddressLine1 like N'%'+@Address+'%' OR AddressLine2 like N'%'+@Address+'%' OR @Address IS NULL)
  and (City like N'%'+@City+'%' OR @City IS NULL)
  and ([State]  = @State OR @State IS NULL)
  and (ZIPCode  = @ZIPCode OR @ZIPCode IS NULL)
  and (EmailAddress  = @EmailAddress OR @EmailAddress IS NULL)
  and (PhoneNumber  = @PhoneNumber OR @PhoneNumber IS NULL)
  and (ContactName like N'%'+@ContactName+'%' OR @ContactName IS NULL)
  and (BankAccountNumber  = @AccountNumber OR @AccountNumber IS NULL)
  and ((@RecurringPayments = 1 and RecurringPayments  = 'Y') OR @RecurringPayments = 0)
  and ((@OneTimePayment = 1 and OneTimePayment  = 'Y') OR @OneTimePayment = 0)
  AND (CompanyName LIKE N'%'+@CompanyName+'%' or  @CompanyName IS null  )
  ) InnerQuery
  WHERE 
    RowNum >= @LowerLimit  AND
				RowNum <= @UpperLimit  OR
				@PageSize IS NULL
			ORDER BY
				RowNum
  END
  -------------------------------- If Descending Oder--------------------------------------------------------------------
	ELSE 
		BEGIN
			SELECT * from
	(SELECT [ACHTransactionLogId]
      ,[DateTimeStamp]
      ,[OrganizationId]
      ,[InsuredType]
      ,[GroupMemberNumber]
      ,[HIASPrimaryNumber]
      ,[FirstName]
      ,[LastName]
      ,[CompanyName]
      ,[HIASCustomerNumber]
      --,[PhoneNumber]
	  ,[dbo].[GetPhoneFormatted]([PhoneNumber]) PhoneNumber
      ,[EmailAddress]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[State]
      ,[ZIPCode]
      ,[ContactName]
      ,[AccountName]
      ,[CheckingSaving]
      ,[BankRoutingNumber]
      ,[BankAccountNumber]
      ,[RecurringPayments]
      ,[RecurringStartDate]
      ,[OneTimePayment]
      ,[OneTimeAmount]
      ,[OneTimeDate]
	  ,[Signature]
	  ,[IPAddress]
      ,[ErrorCorrection]
      ,[ValidationTimeStamp]
      ,[ValidationStatus]
      ,[ErrorState]
      ,[ErrorZIPCode]
      ,[ErrorBankRoutingNumber]
      ,[ErrorGeneral]
	  ,[EmailConfirmationDateTime]
      ,[HIASExportDateTime]
      ,[OnlineACHReconciliationId]
	  ,CASE ISNULL(@SortField,'default')WHEN 'default' THEN ROW_NUMBER() OVER(ORDER BY ACHTransactionLogId ASC)
							WHEN 'DateTimeStamp' THEN ROW_NUMBER() OVER(ORDER BY DateTimeStamp DESC)
							WHEN 'HIASPrimaryNumber' THEN ROW_NUMBER() OVER(ORDER BY HIASPrimaryNumber DESC)
							WHEN 'HIASCustomerNumber' THEN ROW_NUMBER() OVER(ORDER BY HIASCustomerNumber DESC)
							WHEN 'OrganizationId' THEN ROW_NUMBER() OVER(ORDER BY OrganizationId DESC)
							WHEN 'InsuredType' THEN ROW_NUMBER() OVER(ORDER BY InsuredType DESC)
							WHEN 'GroupMemberNumber' THEN ROW_NUMBER() OVER(ORDER BY GroupMemberNumber DESC)
							WHEN 'FirstName' THEN ROW_NUMBER() OVER(ORDER BY FirstName DESC)
							WHEN 'LastName' THEN ROW_NUMBER() OVER(ORDER BY LastName DESC)
							WHEN 'CompanyName' THEN ROW_NUMBER() OVER(ORDER BY CompanyName DESC)
							WHEN 'PhoneNumber' THEN ROW_NUMBER() OVER(ORDER BY PhoneNumber DESC)
							WHEN 'EmailAddress' THEN ROW_NUMBER() OVER(ORDER BY EmailAddress DESC)
							WHEN 'AddressLine1' THEN ROW_NUMBER() OVER(ORDER BY AddressLine1 DESC)
							WHEN 'AddressLine2' THEN ROW_NUMBER() OVER(ORDER BY AddressLine2 DESC)
							WHEN 'City' THEN ROW_NUMBER() OVER(ORDER BY City DESC)
							WHEN 'State' THEN ROW_NUMBER() OVER(ORDER BY [State] DESC)
							WHEN 'ZIPCode' THEN ROW_NUMBER() OVER(ORDER BY ZIPCode DESC)
							WHEN 'ContactName' THEN ROW_NUMBER() OVER(ORDER BY ContactName DESC)
							WHEN 'AccountName' THEN ROW_NUMBER() OVER(ORDER BY AccountName DESC)
							WHEN 'CheckingSaving' THEN ROW_NUMBER() OVER(ORDER BY CheckingSaving DESC)
							WHEN 'BankRoutingNumber' THEN ROW_NUMBER() OVER(ORDER BY BankRoutingNumber DESC)
							WHEN 'BankAccountNumber' THEN ROW_NUMBER() OVER(ORDER BY BankAccountNumber DESC)
							WHEN 'RecurringPayments' THEN ROW_NUMBER() OVER(ORDER BY RecurringPayments DESC)
							WHEN 'RecurringStartDate' THEN ROW_NUMBER() OVER(ORDER BY RecurringStartDate DESC)
							WHEN 'OneTimePayment' THEN ROW_NUMBER() OVER(ORDER BY OneTimePayment DESC)
							WHEN 'OneTimeAmount' THEN ROW_NUMBER() OVER(ORDER BY OneTimeAmount DESC)
							WHEN 'OneTimeDate' THEN ROW_NUMBER() OVER(ORDER BY OneTimeDate DESC)
							WHEN 'Signature' THEN ROW_NUMBER() OVER(ORDER BY [Signature] DESC)
							WHEN 'IPAddress' THEN ROW_NUMBER() OVER(ORDER BY IPAddress DESC)
							WHEN 'ErrorCorrection' THEN ROW_NUMBER() OVER(ORDER BY ErrorCorrection DESC)
							WHEN 'ValidationTimeStamp' THEN ROW_NUMBER() OVER(ORDER BY ValidationTimeStamp DESC)
							WHEN 'ValidationStatus' THEN ROW_NUMBER() OVER(ORDER BY ValidationStatus DESC)
							WHEN 'ErrorState' THEN ROW_NUMBER() OVER(ORDER BY ErrorState DESC)
							WHEN 'ErrorZIPCode' THEN ROW_NUMBER() OVER(ORDER BY ErrorZIPCode DESC)
							WHEN 'ErrorBankRoutingNumber' THEN ROW_NUMBER() OVER(ORDER BY ErrorBankRoutingNumber DESC)
							WHEN 'ErrorGeneral' THEN ROW_NUMBER() OVER(ORDER BY ErrorGeneral DESC)
							WHEN 'EmailConfirmationDateTime' THEN ROW_NUMBER() OVER(ORDER BY EmailConfirmationDateTime DESC)
							WHEN 'HIASExportDateTime' THEN ROW_NUMBER() OVER(ORDER BY HIASExportDateTime DESC)
							WHEN 'OnlineACHReconciliationId' THEN ROW_NUMBER() OVER(ORDER BY OnlineACHReconciliationId DESC)
							
							 
						END AS RowNum 
  FROM [CC].[ACHTransactionLog]
  WHERE 
    (CAST(DateTimeStamp AS DATE) >= CAST(@DateFrom AS DATE) OR @DateFrom IS NULL)
  and (CAST(DateTimeStamp AS DATE) <=  CAST(@DateTo AS DATE) OR @DateTo IS NULL)
  and (HIASPrimaryNumber  = @HIASPrimaryNumber OR @HIASPrimaryNumber IS NULL)
  and (HIASCustomerNumber  = @HIASCustomerNumber OR @HIASCustomerNumber IS NULL)
  and (OrganizationId  = @OrganizationId OR @OrganizationId IS NULL)
  and (InsuredType  = @InsuredType OR @InsuredType IS NULL)
  and (LastName like N'%'+@LastName+'%' OR @LastName IS NULL)
  and (FirstName like N'%'+@FirstName+'%' OR @FirstName IS NULL)
  and (AddressLine1 like N'%'+@Address+'%' OR AddressLine2 like N'%'+@Address+'%' OR @Address IS NULL)
  and (City like N'%'+@City+'%' OR @City IS NULL)
  and ([State]  = @State OR @State IS NULL)
  and (ZIPCode  = @ZIPCode OR @ZIPCode IS NULL)
  and (EmailAddress  = @EmailAddress OR @EmailAddress IS NULL)
  and (PhoneNumber  = @PhoneNumber OR @PhoneNumber IS NULL)
  and (ContactName like N'%'+@ContactName+'%' OR @ContactName IS NULL)
  and (BankAccountNumber  = @AccountNumber OR @AccountNumber IS NULL)
  and ((@RecurringPayments = 1 and RecurringPayments  = 'Y') OR @RecurringPayments = 0)
  and ((@OneTimePayment = 1 and OneTimePayment  = 'Y') OR @OneTimePayment = 0)
  AND (CompanyName LIKE N'%'+@CompanyName+'%' or  @CompanyName IS null  )
  ) InnerQuery
  WHERE 
    RowNum >= @LowerLimit  AND
				RowNum <= @UpperLimit  OR
				@PageSize IS NULL
			ORDER BY
				RowNum
		End
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ahmed Elgendy>
-- Create date: <02/26/2023>
-- Description:	<get Organizations>
-- =============================================
CREATE PROCEDURE [CC].[GetAllOrganizations] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT  [OrganizationId]
			  ,[Name]
			  ,[DecryptionKey]
			  ,[CallBackURL]
			  ,[CreatedBy]
			  ,[CreationDate]
			  ,[UpdatedBy]
			  ,[UpdatedDate]
			  ,[IsDeleted]
			  ,[DeletedDate]
			  ,[EncryptionKey]
		  FROM  [CC].[Organizations]
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ahmed Elgendy>
-- Create date: <3/2/2023>
-- Description:	<Get valide ACHTransactionLog To Export To OnlineACHReconciliation table>
-- =============================================
CREATE PROCEDURE [Finance].[GetACHTransactionLogToExport]
AS
BEGIN

----- Get ACH Transaction Log To Export (type GR only) with Member Number Duplication Index for distinguish these rows
CREATE TABLE #DuplicatedGroupMemberNumberGRRowsIndex (
    ACHTransactionLogId int,
    GroupMemberNumber nvarchar(40),
    DuplicationIndex BIGINT
)

INSERT INTO #DuplicatedGroupMemberNumberGRRowsIndex
SELECT  DISTINCT 
  ACHTransactionLogId,
  GroupMemberNumber,
 ROW_NUMBER()  over (partition by GroupMemberNumber  order by ACHTransactionLogId) DuplicationIndex
  FROM [CC].[ACHTransactionLog]
  WHERE ValidationStatus = 1 AND HIASExportDateTime IS NULL AND InsuredType = 'GR'
--------------------------------------------------------------------------------------------------
 

	SELECT [ACHTransactionLogId] --> TransactionID 
	  ,[OrganizationId] --> OrganizationId
	  ,[DateTimeStamp] --> ACHTransactionLogEnrollmentDateTimeStamp
      ,[InsuredType] --> InsuredType [new]
      ,[GroupMemberNumber] --> PrimaryNumber ??
      ,[FirstName] --> FirstName
      ,[LastName]  --> LastName
      ,[CompanyName] --> Group Name [new]
      ,[dbo].[GetPhoneFormatted]([PhoneNumber]) PhoneNumber --> Phone
      ,[EmailAddress] --> Email
      ,[AddressLine1] --> AddressLine1
      ,[AddressLine2] --> AddressLine2
      ,[City] --> City
      ,[State] --> stCode
      ,[ZIPCode] --> ZipCode
      ,[AccountName] --> BankAccountHolderName ??
      ,[CheckingSaving] --> BankAccountTypeId
      ,[BankRoutingNumber] --> BankRoutingNumber
      ,[BankAccountNumber] --> BankAccountNumber
      ,[RecurringPayments] --> RecurringFlag
      ,[RecurringStartDate] --> StartDate
      ,[OneTimePayment] --> RecurringFlag
      ,[OneTimeAmount] --> One Time amount [new]
      ,[OneTimeDate] --> StartDate ??
      ,CASE WHEN InsuredType = 'GR' and EXISTS (SELECT ACHTransactionLogId FROM #DuplicatedGroupMemberNumberGRRowsIndex WHERE   GroupMemberNumber = achTransLog.GroupMemberNumber AND DuplicationIndex > 1 )
	  THEN 'H' ELSE 'U' END [ACHReconciliationProcessStatus] -- H -> HOLD, U-> Unprocessed
       
  FROM [CC].[ACHTransactionLog] achTransLog
  WHERE ValidationStatus = 1 AND HIASExportDateTime IS NULL

  DROP TABLE #DuplicatedGroupMemberNumberGRRowsIndex

END

  
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Finance].[InsertOnlineACHReconciliationFromACHTransactionLog] 
    @OnlineACHReconciliationID INT OUT,
    @Status varchar(1),
	@FileID varchar(100) ,
	@TransactionID varchar(100) ,
	@Amount money ,
	@BankRoutingNumber varchar(100) ,
	@BankAccountNumber varchar(100) ,
	@BankAccountTypeId INT ,
	@PrimaryNumber varchar(22) ,
	@LastName varchar(100) ,
	@FirstName varchar(100) ,
	@AddressLine1 varchar(500) ,
	@AddressLine2 varchar(500) ,
	@City varchar(50) ,
	@STCode varchar(50) ,
	@ZipCode varchar(5) ,
	@Phone varchar(20) ,
	@Email varchar(255) ,
	@RecurringFlag varchar(1) ,
	@BankAccountHolderName varchar(200) ,
	@StartDate datetime ,
	@CreationDate datetime ,
	@CreatedBy varchar(20) ,
	@HIASPrimaryMemberNumber int ,
	@MemberMatchingUserID varchar(20) ,
	@MemberMatchingDate datetime ,
	@MemberMatchingRule varchar(10) ,
	@MemberMatchingComment varchar(2000),
	@RoutingNumberCorrectionUserID VARCHAR(20) = NULL ,
    @RoutingNumberCorrectionDate datetime = NULL,
	@InsuredType NVARCHAR(2),
	@InsuredTypeActual NVARCHAR(2),
	@GroupName NVARCHAR(100),
	@OrganizationId NVARCHAR(10),
	@ACHTransactionLogEnrollmentDateTimeStamp datetime = NULL,
	@ACHTransactionLogId BIGINT
AS 
BEGIN
  SET NOCOUNT ON
	
        BEGIN TRY
			BEGIN TRAN
--------------------------- OutPut Table For Insterted ID ----------------------- 
			DECLARE @OutPutTable table( OnlineACHReconciliationID int);

------------------------- Insert into table Finance.OnlineACHReconciliation ----------------------------------------------------
						INSERT INTO Finance.OnlineACHReconciliation
								( [Status] ,
								FileID ,
								TransactionID ,
								Amount ,
								BankRoutingNumber ,
								BankAccountNumber ,
								BankAccountTypeId ,
								PrimaryNumber ,
								LastName ,
								FirstName ,
								AddressLine1 ,
								AddressLine2 ,
								City ,
								STCode ,
								ZipCode ,
								Phone ,
								Email ,
								RecurringFlag ,
								BankAccountHolderName ,
								StartDate ,
								CreationDate ,
								CreatedBy ,
								HIASPrimaryMemberNumber ,
								MemberMatchingUserID ,
								MemberMatchingDate ,
								MemberMatchingRule ,
								MemberMatchingComment,
								RoutingNumberCorrectionUserID,
								RoutingNumberCorrectionDate,
								InsuredType,
								InsuredTypeActual,
								GroupName,
								OrganizationId,
								ACHTransactionLogEnrollmentDateTimeStamp,
								ACHTransactionLogId
								)
								OUTPUT INSERTED.OnlineACHReconciliationID
                                       INTO @OutPutTable
						VALUES  ( @Status , -- Status - varchar(1)
								@FileID , -- FileID - varchar(100)
								@TransactionID , -- TransactionID - varchar(100)
								@Amount , -- Amount - money
								@BankRoutingNumber , -- BankRoutingNumber - varchar(100)
								@BankAccountNumber , -- BankAccountNumber - varchar(100)
								@BankAccountTypeId , -- CheckingFlag - varchar(1)
								@PrimaryNumber , -- PrimaryNumber - varchar(22)
								@LastName , -- LastName - varchar(100)
								@FirstName , -- FirstName - varchar(100)
								@AddressLine1 , -- AddressLine1 - varchar(500)
								@AddressLine2 , -- AddressLine2 - varchar(500)
								@City , -- City - varchar(50)
								@STCode , -- STCode - varchar(50)
								@ZipCode , -- ZipCode - varchar(5)
								@Phone , -- Phone - varchar(20)
								@Email , -- Email - varchar(255)
								@RecurringFlag , -- RecurringFlag - varchar(1)
								@BankAccountHolderName , -- BankAccountHolderName - varchar(200)
								@StartDate, -- StartDate - datetime
								@CreationDate , -- CreationDate - datetime
								@CreatedBy , -- CreatedBy - varchar(20)
								@HIASPrimaryMemberNumber , -- HIASPrimaryMemberNumber - int
								@MemberMatchingUserID , -- MemberMatchingUserID - varchar(20)
								@MemberMatchingDate , -- MemberMatchingDate - datetime
								@MemberMatchingRule , -- MemberMatchingRule - varchar(10)
								@MemberMatchingComment,  -- MemberMatchingComment - varchar(2000)
								@RoutingNumberCorrectionUserID, -- RoutingNumberCorrectionUserID - varchar(20)
								@RoutingNumberCorrectionDate, -- RoutingNumberCorrectionDate - datetime
								@InsuredType,
								@InsuredTypeActual,
								@GroupName,
								@OrganizationId,
								@ACHTransactionLogEnrollmentDateTimeStamp,
								@ACHTransactionLogId
								)  
	-------------------------------- set Inserted ID --------------------------------------------							
						SET @OnlineACHReconciliationID = (SELECT OnlineACHReconciliationID FROM @OutPutTable)
    ------------------------------------UPDATE Table cc.ACHTransactionLog ----------------------------------------------
						UPDATE cc.ACHTransactionLog
						SET OnlineACHReconciliationId = @OnlineACHReconciliationID,
						    HIASExportDateTime = GETDATE()
							WHERE ACHTransactionLogId = @ACHTransactionLogId
			COMMIT TRAN
        END TRY

        BEGIN CATCH
		  ROLLBACK TRAN
            EXEC RethrowError ;
        END CATCH

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Finance].[RetrieveOnlineACHReconciliation]
    @OnlineACHReconciliation INT , --
    @PrimaryNumber VARCHAR(22) , --
    @FileID VARCHAR(100) ,
    @TransactionID VARCHAR(100) ,
    @BankAccountNumber VARCHAR(100) ,
    @Amount MONEY ,
    @MemberMatchingUserId VARCHAR(20) ,
    @LastName VARCHAR(100) ,
    @FirstName VARCHAR(100) ,
    @Address VARCHAR(500) ,
    @PageNumber INT ,
    @PageSize INT ,
    @SortField VARCHAR(128) ,
    @SortDirection VARCHAR(20) ,
    @City VARCHAR(50) ,
    @STCode VARCHAR(2) ,
    @ZIPCode VARCHAR(5) ,
    @Phone VARCHAR(20) ,
    @Email VARCHAR(255) ,
	@OneTimePayment BIT,
	@InsuredTypeActual VARCHAR(2),
	@HIASCustomerNumber VARCHAR(50),
	@GroupName VARCHAR(100),
    @UnprocessedStatus VARCHAR(1) ,
    @MatchStatus VARCHAR(1) ,
    @ErrorStatus VARCHAR(1) ,
	@HoldMultipleAccountsStatus VARCHAR(1) ,
    @InvalidRoutingNumberStatus VARCHAR(1) ,
    @ACHSettingsApplied VARCHAR(1),
	@AmountExceedPremiumXTimes int = 12 -- Is 12 as client's specifications
    
AS 
    BEGIN

        DECLARE @LowerLimit INT;
        DECLARE @UpperLimit INT;

        SET @LowerLimit = ( @PageNumber - 1 ) * @PageSize + 1;
        SET @UpperLimit = @PageNumber * @PageSize;

        SELECT  SUM(Amount) TotalAmount ,
                COUNT(1) TotalRecords
        FROM    Finance.OnlineACHReconciliation AS oar
        WHERE   ( @OnlineACHReconciliation IS NULL
                  OR OnlineACHReconciliationID = @OnlineACHReconciliation
                ) --1st Search Criteria
                AND ( ( @MatchStatus IS NULL
                        AND @ErrorStatus IS NULL
                        AND @UnprocessedStatus IS NULL
                        AND @ACHSettingsApplied IS NULL
                        AND @InvalidRoutingNumberStatus IS NULL
						AND @HoldMultipleAccountsStatus IS NULL
                      )
                      OR ( Status IN ( @MatchStatus, @ErrorStatus,
                                       @UnprocessedStatus, @ACHSettingsApplied,
                                       @InvalidRoutingNumberStatus, @HoldMultipleAccountsStatus ) )
                    )
                AND --2nd Search Criteria
                ( @TransactionID IS NULL
                  OR TransactionID LIKE @TransactionID + '%'
                )
                AND --3rd Search Criteria
                ( @Amount IS NULL
                  OR Amount = @Amount
                )
                AND ( @PrimaryNumber IS NULL
                      OR PrimaryNumber =@PrimaryNumber
					  OR HIASNumber = @PrimaryNumber
                    )
                AND ( @LastName IS NULL
                      OR REPLACE(LastName, ' ', '') LIKE @LastName + '%'
                    )
                AND ( @FirstName IS NULL
                      OR REPLACE(FirstName, ' ', '') LIKE @FirstName + '%'
                    )
                AND ( @Address IS NULL
                      OR REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(AddressLine1,
                                                              '.', ''), ',',
                                                              ''), '-', ''),
                                                 '&', ''), '/', ''), ' ', '') LIKE @Address
                      + '%'
                    )
                AND ( @City IS NULL
                      OR REPLACE(City, ' ', '') LIKE @City + '%'
                    )
                AND ( @STCode IS NULL
                      OR STCode = @STCode
                    )
                AND ( @ZIPCode IS NULL
                      OR ZIPCode = @ZIPCode
                    )
                AND ( @FileID IS NULL
                      OR @FileID = FileID
                    )
                AND ( @BankAccountNumber IS NULL
                      OR @BankAccountNumber = BankAccountNumber
                    )
                AND ( @MemberMatchingUserId IS NULL
                      OR @MemberMatchingUserId = MemberMatchingUserID
                    )
                AND ( @Phone IS NULL
                      OR REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Phone,
                                                              '.', ''), ',',
                                                              ''), '-', ''),
                                                 ')', ''), '(', ''), ' ', '') = @Phone
                    )
                AND ( @Email IS NULL
                      OR Email LIKE @Email + '%'
                    )
				AND Status <>'D'
				AND ((@OneTimePayment = 1 AND RecurringFlag  = 0) OR @OneTimePayment = 0)
				AND(InsuredTypeActual = @InsuredTypeActual OR @InsuredTypeActual IS NULL)
				AND(HIASNumber = @HIASCustomerNumber
				    OR PrimaryNumber = @HIASCustomerNumber
					OR @HIASCustomerNumber IS NULL)
				AND(GroupName LIKE @GroupName+ '%' OR @GroupName IS NULL)

        SELECT  *
        FROM    ( SELECT    OnlineACHReconciliationID ,
                            Status ,
                            FileID ,
                            TransactionID ,
                            Amount ,
                            BankRoutingNumber ,
                            BankAccountNumber ,
                            BankAccountTypeId ,
                            PrimaryNumber ,
                            ISNULL(LTRIM(RTRIM(LastName)),'') AS LastName ,
                            ISNULL(LTRIM(RTRIM(FirstName)),'') AS FirstName ,
                            ISNULL(LTRIM(RTRIM(AddressLine1)),'') AS AddressLine1 ,
                            AddressLine2 ,
                            City ,
                            STCode ,
                            ZipCode ,
                            ISNULL(LTRIM(RTRIM(Phone)),'') AS Phone ,
                            ISNULL(LTRIM(RTRIM(Email)),'') AS Email ,
                            RecurringFlag ,
                            BankAccountHolderName ,
                            StartDate ,
                            CreationDate ,
                            CreatedBy ,
                            HIASPrimaryMemberNumber ,
							HIASPrimaryMemberShipNumber,
							UwMemberId,
                            MemberMatchingUserID ,
                            MemberMatchingDate ,
                            MemberMatchingRule ,
                            MemberMatchingComment ,
							RoutingNumberCorrectionUserID ,
                            RoutingNumberCorrectionDate ,
							InsuredType,
							InsuredTypeActual,
							GroupName,
							CASE WHEN RecurringFlag = 0 THEN CAST(Amount AS DECIMAL(16,2)) ELSE NULL END OneTimeAmount,
							CASE WHEN  RecurringFlag = 0 AND @PageSize > 0  THEN -- to make this function work when Retrieving data to grid only
							[Finance].[ACHReconciliationAmountExceedPremiumXTimes](InsuredTypeActual, UwCustomerId, UwMemberId, Amount, @AmountExceedPremiumXTimes ) ELSE CAST( 0 AS bit)  END IsAmountExceedPremium12Times,
							UwCustomerId,
							HIASCustomerNumber,
							HIASNumber ,
							OrganizationId,
							ACHTransactionLogEnrollmentDateTimeStamp,
							ACHTransactionLogId,
							
                            ROW_NUMBER() OVER ( ORDER BY OnlineACHReconciliationID DESC ) RowNum
                  FROM      Finance.OnlineACHReconciliation AS oar
                  WHERE     
				            Status <>'D' 
							AND 
							( @OnlineACHReconciliation IS NULL
                              OR OnlineACHReconciliationID = @OnlineACHReconciliation
                            ) --1st Search Criteria
                            AND ( ( @MatchStatus IS NULL
                                    AND @ErrorStatus IS NULL
                                    AND @UnprocessedStatus IS NULL
                                    AND @ACHSettingsApplied IS NULL
                                    AND @InvalidRoutingNumberStatus IS NULL
                                    AND @HoldMultipleAccountsStatus IS NULL
                                  )
                                  OR ( Status IN ( @MatchStatus, @ErrorStatus,
                                                   @UnprocessedStatus,
                                                   @ACHSettingsApplied,
                                                   @InvalidRoutingNumberStatus, @HoldMultipleAccountsStatus ) )
                                )
                            AND --2nd Search Criteria
                            ( @TransactionID IS NULL
                              OR TransactionID LIKE @TransactionID + '%'
                            )
                            AND --3rd Search Criteria
                            ( @Amount IS NULL
                              OR Amount = @Amount
                            )
                             AND ( @PrimaryNumber IS NULL
								  OR PrimaryNumber =@PrimaryNumber
								  OR HIASNumber = @PrimaryNumber
                                 )
                            AND ( @LastName IS NULL
                                  OR REPLACE(LastName, ' ', '') LIKE @LastName
                                  + '%'
                                )
                            AND ( @FirstName IS NULL
                                  OR REPLACE(FirstName, ' ', '') LIKE @FirstName
                                  + '%'
                                )
                            AND ( @Address IS NULL
                                  OR REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(AddressLine1,
                                                              '.', ''), ',',
                                                              ''), '-', ''),
                                                             '&', ''), '/', ''),
                                             ' ', '') LIKE @Address + '%'
                                )
                            AND ( @City IS NULL
                                  OR REPLACE(City, ' ', '') LIKE @City + '%'
                                )
                            AND ( @STCode IS NULL
                                  OR STCode = @STCode
                                )
                            AND ( @ZIPCode IS NULL
                                  OR ZIPCode = @ZIPCode
                                )
                            AND ( @FileID IS NULL
                                  OR @FileID = FileID
                                )
                            AND ( @BankAccountNumber IS NULL
                                  OR @BankAccountNumber = BankAccountNumber
                                )
                            AND ( @MemberMatchingUserId IS NULL
                                  OR @MemberMatchingUserId = MemberMatchingUserID
                                )
                            AND ( @Phone IS NULL
                                  OR REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Phone,
                                                              '.', ''), ',',
                                                              ''), '-', ''),
                                                             ')', ''), '(', ''),
                                             ' ', '') = @Phone
                                )
                            AND ( @Email IS NULL
                                  OR Email LIKE @Email + '%'
                                )
								AND ((@OneTimePayment = 1 and RecurringFlag  = 0) OR @OneTimePayment = 0)
								AND(InsuredTypeActual = @InsuredTypeActual OR @InsuredTypeActual Is null)
								AND(HIASNumber = @HIASCustomerNumber
									OR PrimaryNumber = @HIASCustomerNumber
									OR @HIASCustomerNumber Is null)
								AND(GroupName LIKE @GroupName+ '%' OR @GroupName Is null)
                ) InnerQuery
        WHERE   InnerQuery.RowNum >= @LowerLimit
                AND InnerQuery.RowNum <= @UpperLimit
                OR @PageSize IS NULL
        ORDER BY InnerQuery.RowNum;            

			
    END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Customers].[GenericMatchingCustomers]
    @MatchingRule VARCHAR(50) ,
    @CustomerNumber VARCHAR(22) = NULL ,
    @Company VARCHAR(255) = NULL ,
    @StateCode VARCHAR(20) = NULL,
    @UwMemberId int = NULL
AS 
BEGIN
---------------------------------------------------------------------------------------------------------------------
     IF @MatchingRule = 'A-CID' 
                        BEGIN
							SELECT
								   UC.UwCustomerId,
								   uc.CustomerId,
								   UC.CustomerNumber,
								   UC.CustomerStatusId,
								   UC.[Name],
								   UC.Address1,
								   UC.Address2,
								   UC.ContactPhone,
								   UC.ContactEmail,
								   null AS MatchedUwMemberId,
								   null AS MatchedUwMemberNumber
							FROM Customers.UwCustomer AS UC
							WHERE UC.CustomerNumber = @CustomerNumber
							ORDER BY uc.UwCustomerId desc
                        END   
						ELSE
						IF @MatchingRule = 'A-CAS' 
                        BEGIN
							SELECT TOP 1
								   UC.UwCustomerId,
								   uc.CustomerId,
								   UC.CustomerNumber,
								   UC.CustomerStatusId,
								   UC.[Name],
								   UC.Address1,
								   UC.Address2,
								   UC.ContactPhone,
								   UC.ContactEmail,
								   null AS MatchedUwMemberId,
								   null AS MatchedUwMemberNumber
							FROM Customers.UwCustomer AS UC
							JOIN dbo.ZipCode ZC ON zc.ZipCode = uc.ZipCode
							WHERE UC.[Name] LIKE N'%' + @Company + '%'
							AND ZC.StateCode =  @StateCode
							ORDER BY uc.UwCustomerId DESC
                        END   
						ELSE
						IF @MatchingRule = 'A-CM' 
                        BEGIN
							SELECT TOP 1
								   UC.UwCustomerId,
								   uc.CustomerId,
								   UC.CustomerNumber,
								   UC.CustomerStatusId,
								   UC.[Name],
								   UC.Address1,
								   UC.Address2,
								   UC.ContactPhone,
								   UC.ContactEmail,
								   UM.UwMemberId AS MatchedUwMemberId,
								   UM.MemberNumber AS MatchedUwMemberNumber
							FROM Customers.UwCustomer AS UC
							INNER JOIN Customers.UwMember AS UM
									ON UM.UwCustomerId = UC.UwCustomerId
									WHERE UM.UwMemberId = @UwMemberId
							ORDER BY uc.UwCustomerId DESC
                        END   
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Finance].[UpdateOnlineACHReconciliation]
    @OnlineACHReconciliation INT ,
    @Status VARCHAR(1) ,
    @TransactionID VARCHAR(100) = NULL ,
    @Amount MONEY = NULL ,
    @PrimaryNumber VARCHAR(22) = NULL ,
    @LastName VARCHAR(100) = NULL ,
    @FirstName VARCHAR(100) = NULL ,
    @Address VARCHAR(500) = NULL ,
    @City VARCHAR(50) = NULL ,
    @STCode VARCHAR(2) = NULL ,
    @ZIPCode VARCHAR(5) = NULL ,
    @Phone VARCHAR(20) = NULL ,
    @Email VARCHAR(255) = NULL ,
	@RecurringFlag  bit,
    @CreationDate SMALLDATETIME = NULL ,
    @CreatedBy VARCHAR(20) = NULL ,
    @UwMemberId INT = NULL ,
    @MemberMatchingUserID VARCHAR(20) = NULL ,
    @MemberMatchingDate SMALLDATETIME = NULL ,
    @BankAccountNumber VARCHAR(50) = NULL ,
    @MemberMatchingComment VARCHAR(2000) = NULL ,
    @MemberMatchingRule VARCHAR(10) = NULL,
	@StartDate SMALLDATETIME,
	@BankAccountHolderName varchar(200),
	@FileID varchar(100),
	@BankRoutingNumber varchar(100),
	@BankAccountTypeId INT,
	@HIASPrimaryMemberNumber VARCHAR(50),
	@HIASPrimaryMemberShipNumber VARCHAR(50),
	@RoutingNumberCorrectionUserID VARCHAR(20) = NULL ,
    @RoutingNumberCorrectionDate SMALLDATETIME = NULL,
	@UwCustomerId INT = NULL ,
	@HIASCustomerNumber VARCHAR(50) = null
AS 
    BEGIN 
        SET NOCOUNT ON;

        BEGIN TRY
        
            UPDATE  Finance.OnlineACHReconciliation
            SET     Status = @Status ,
                    TransactionID = @TransactionID ,
                    Amount = @Amount ,
                    PrimaryNumber = @PrimaryNumber ,
                    LastName = @LastName ,
                    FirstName = @FirstName ,
                    AddressLine1 = @Address ,
                    City = @City ,
                    STCode = @STCode ,
                    ZIPCode = @ZIPCode ,
                    Phone = @Phone ,
                    Email = @Email ,
                    RecurringFlag = @RecurringFlag ,
                    CreationDate = @CreationDate ,
                    CreatedBy = @CreatedBy ,
                    HIASPrimaryMemberNumber = @HIASPrimaryMemberNumber ,
                    MemberMatchingUserID = @MemberMatchingUserID ,
                    MemberMatchingDate = @MemberMatchingDate ,
                    MemberMatchingComment = @MemberMatchingComment ,
                    MemberMatchingRule = @MemberMatchingRule,
					StartDate =@StartDate,
					BankAccountNumber=@BankAccountNumber,
					BankAccountHolderName=@BankAccountHolderName,
					FileID = @FileID,
				    BankRoutingNumber=@BankRoutingNumber,
					BankAccountTypeId=@BankAccountTypeId,
				    UwMemberId=@UwMemberId,
					HIASPrimaryMemberShipNumber = @HIASPrimaryMemberShipNumber,
					RoutingNumberCorrectionUserID = @RoutingNumberCorrectionUserID,
					RoutingNumberCorrectionDate = @RoutingNumberCorrectionDate,
					UwCustomerId = @UwCustomerId,
					HIASCustomerNumber = @HIASCustomerNumber 


            WHERE   OnlineACHReconciliationID = @OnlineACHReconciliation;
            IF @@ROWCOUNT = 0 
                BEGIN
                    RAISERROR('Concurrent update error. Updated aborted.', 16, 2);
                END;
        END TRY

        BEGIN CATCH
            EXEC RethrowError;
        END CATCH;	

        SET NOCOUNT OFF;
    END;



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Finance].[UpdateAfterMatchingOnlineACHReconciliation]
    @OnlineACHReconciliationID INT ,
    @Status VARCHAR(1) ,
    @UwMemberId INT = NULL ,
    @MemberMatchingDate SMALLDATETIME = NULL ,
	@MemberMatchingUserID  VARCHAR(100) = NULL,
    @MemberMatchingComment VARCHAR(2000) = NULL ,
    @MemberMatchingRule VARCHAR(10) = NULL,
	@InsuredTypeActual NVARCHAR(2),
	@HIASPrimaryMemberNumber VARCHAR(50),
	@HIASPrimaryMemberShipNumber VARCHAR(50),
	@UwCustomerId INT = NULL ,
	@HIASCustomerNumber VARCHAR(50) = NULL,
	@HIASNumber VARCHAR(50) = NULL,

    @ACHTransactionLogId BIGINT = null
     
AS 
    BEGIN 
        SET NOCOUNT ON;

        BEGIN TRY
       

            UPDATE  Finance.OnlineACHReconciliation
            SET     [Status] = @Status ,
                    HIASPrimaryMemberNumber = @HIASPrimaryMemberNumber ,
                    MemberMatchingDate = @MemberMatchingDate ,
                    MemberMatchingUserID = @MemberMatchingUserID ,
                    MemberMatchingComment = @MemberMatchingComment ,
                    MemberMatchingRule = @MemberMatchingRule,
				    UwMemberId=@UwMemberId,
					HIASPrimaryMemberShipNumber = @HIASPrimaryMemberShipNumber,
					UwCustomerId = @UwCustomerId,
					HIASCustomerNumber = @HIASCustomerNumber,
					HIASNumber = @HIASNumber,
					InsuredTypeActual = @InsuredTypeActual
					

            WHERE   OnlineACHReconciliationID = @OnlineACHReconciliationID;

				----------------- Update table ACHTransactionLog --------------------------------------
				--IF(@MemberMatchingRule = 'A-CID' OR @MemberMatchingRule = 'A-CAS' OR  @MemberMatchingRule = 'A-CM') -- customer match
				--BEGIN
				--   UPDATE CC.ACHTransactionLog
				--	SET HIASCustomerNumber = @HIASCustomerNumber 
				--	WHERE ACHTransactionLogId = @ACHTransactionLogId
				--END 
				--ELSE-- member mactch
    --            begin
				--	UPDATE CC.ACHTransactionLog
				--	SET HIASPrimaryNumber = @HIASPrimaryMemberNumber
				--    WHERE ACHTransactionLogId = @ACHTransactionLogId
    --             END
                UPDATE CC.ACHTransactionLog
					SET HIASPrimaryNumber = @HIASPrimaryMemberNumber
					 ,HIASCustomerNumber = @HIASCustomerNumber 
				     WHERE ACHTransactionLogId = @ACHTransactionLogId
		 
        END TRY

        BEGIN CATCH
		  
            EXEC RethrowError;
        END CATCH;	

        SET NOCOUNT OFF;
    END;



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Set row status as D' Duplicate for all rows except one, if there are more than one matching recurring row or AdHoc row for the same member or customer
CREATE PROCEDURE [Finance].[CleanUpOnlineACHReconciliation]
AS 
    BEGIN
        DECLARE @MemberNumber VARCHAR(20) ,
		        @CustomerId int ,
            @startdate SMALLDATETIME


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- IN --------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------- Cursor for Recurring Members----------------------------------------
        DECLARE delcurr CURSOR FAST_FORWARD READ_ONLY
        FOR
            SELECT  HIASPrimaryMemberNumber
            FROM    Finance.OnlineACHReconciliation AS oar
            WHERE   Status = 'M'
                    AND ISNULL(RecurringFlag, 0) = 1
					AND InsuredTypeActual = 'IN'
            GROUP BY HIASPrimaryMemberNumber
            HAVING  COUNT(1) > 1
        OPEN delcurr
        FETCH NEXT FROM delcurr INTO @MemberNumber
        WHILE @@FETCH_STATUS = 0 
            BEGIN
                UPDATE  Finance.OnlineACHReconciliation
                SET     Status = 'D'
                WHERE   HIASPrimaryMemberNumber = @MemberNumber
                        AND ISNULL(RecurringFlag, 0) = 1
                        AND Status = 'M'
                        AND OnlineACHReconciliationID <> ( SELECT TOP 1
                                                              OnlineACHReconciliationID
                                                           FROM
                                                              Finance.OnlineACHReconciliation t
                                                           WHERE
                                                              t.HIASPrimaryMemberNumber = Finance.OnlineACHReconciliation.HIASPrimaryMemberNumber
                                                              AND Status = 'M'
                                                              AND ISNULL(RecurringFlag,
                                                              0) = 1
                                                           ORDER BY OnlineACHReconciliationID DESC
                                                         )

                FETCH NEXT FROM delcurr INTO @MemberNumber
            END
        CLOSE delcurr
        DEALLOCATE delcurr

---------------------------- Cursor for AdHoc Members ----------------------------------------------------------------------------- 
        DECLARE delcurr CURSOR FAST_FORWARD READ_ONLY
        FOR
            SELECT  HIASPrimaryMemberNumber ,
                    StartDate
            FROM    Finance.OnlineACHReconciliation AS oar
            WHERE   Status = 'M'
                    AND ISNULL(RecurringFlag, 0) = 0
					AND InsuredTypeActual = 'IN'
            GROUP BY HIASPrimaryMemberNumber ,
                    StartDate
            HAVING  COUNT(1) > 1
        OPEN delcurr
        FETCH NEXT FROM delcurr INTO @MemberNumber, @startdate

        WHILE @@FETCH_STATUS = 0 
            BEGIN

                UPDATE  Finance.OnlineACHReconciliation
                SET     Status = 'D'
                WHERE   HIASPrimaryMemberNumber = @MemberNumber
                        AND StartDate = @startdate
                        AND ISNULL(RecurringFlag, 0) = 0
                        AND Status = 'M'
                        AND OnlineACHReconciliationID <> ( SELECT TOP 1
                                                              OnlineACHReconciliationID
                                                           FROM
                                                              Finance.OnlineACHReconciliation t
                                                           WHERE
                                                              t.HIASPrimaryMemberNumber = Finance.OnlineACHReconciliation.HIASPrimaryMemberNumber
                                                              AND Status = 'M'
                                                              AND t.StartDate = Finance.OnlineACHReconciliation.StartDate
                                                              AND ISNULL(RecurringFlag,
                                                              0) = 0
                                                           ORDER BY OnlineACHReconciliationID DESC
                                                         )

                FETCH NEXT FROM delcurr INTO @MemberNumber, @startdate
            END
        CLOSE delcurr
        DEALLOCATE delcurr


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- GR -----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------- Cursor for Recurring Customers ----------------------------------------
        DECLARE delcurr CURSOR FAST_FORWARD READ_ONLY
        FOR
            SELECT  UwCustomerId
            FROM    Finance.OnlineACHReconciliation AS oar
            WHERE   Status = 'M'
                    AND ISNULL(RecurringFlag, 0) = 1
					AND InsuredTypeActual = 'GR'
            GROUP BY UwCustomerId
            HAVING  COUNT(1) > 1
        OPEN delcurr
        FETCH NEXT FROM delcurr INTO @CustomerId
        WHILE @@FETCH_STATUS = 0 
            BEGIN
                UPDATE  Finance.OnlineACHReconciliation
                SET     Status = 'D'
                WHERE   UwCustomerId = @CustomerId
                        AND ISNULL(RecurringFlag, 0) = 1
                        AND Status = 'M'
                        AND OnlineACHReconciliationID <> ( SELECT TOP 1
                                                              OnlineACHReconciliationID
                                                           FROM
                                                              Finance.OnlineACHReconciliation t
                                                           WHERE
                                                              t.UwCustomerId = Finance.OnlineACHReconciliation.UwCustomerId
                                                              AND Status = 'M'
                                                              AND ISNULL(RecurringFlag,
                                                              0) = 1
                                                           ORDER BY OnlineACHReconciliationID DESC
                                                         )

                FETCH NEXT FROM delcurr INTO @CustomerId
            END
        CLOSE delcurr
        DEALLOCATE delcurr

---------------------------- Cursor for AdHoc customers ----------------------------------------------------------------------------- 
        DECLARE delcurr CURSOR FAST_FORWARD READ_ONLY
        FOR
            SELECT  UwCustomerId ,
                    StartDate
            FROM    Finance.OnlineACHReconciliation AS oar
            WHERE   Status = 'M'
                    AND ISNULL(RecurringFlag, 0) = 0
					AND InsuredTypeActual = 'GR'
            GROUP BY UwCustomerId ,
                    StartDate
            HAVING  COUNT(1) > 1
        OPEN delcurr
        FETCH NEXT FROM delcurr INTO @CustomerId, @startdate

        WHILE @@FETCH_STATUS = 0 
            BEGIN

                UPDATE  Finance.OnlineACHReconciliation
                SET     Status = 'D'
                WHERE   UwCustomerId = @CustomerId
                        AND StartDate = @startdate
                        AND ISNULL(RecurringFlag, 0) = 0
                        AND Status = 'M'
                        AND OnlineACHReconciliationID <> ( SELECT TOP 1
                                                              OnlineACHReconciliationID
                                                           FROM
                                                              Finance.OnlineACHReconciliation t
                                                           WHERE
                                                              t.UwCustomerId = Finance.OnlineACHReconciliation.UwCustomerId
                                                              AND Status = 'M'
                                                              AND t.StartDate = Finance.OnlineACHReconciliation.StartDate
                                                              AND ISNULL(RecurringFlag,
                                                              0) = 0
                                                           ORDER BY OnlineACHReconciliationID DESC
                                                         )

                FETCH NEXT FROM delcurr INTO @CustomerId, @startdate
            END
        CLOSE delcurr
        DEALLOCATE delcurr

    END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [Customers].[GetUnderwritingMembersForManualMatch]
    @UwMemberId INT ,
    @UwCustomerId INT ,
    @FirstName VARCHAR(50) ,
    @ExchangeAlternateID VARCHAR(50) = NULL ,
    @MiddleInitial VARCHAR(1) ,
    @LastName VARCHAR(50) ,
    @BirthDate DATETIME ,
    @Gender VARCHAR(6) ,
    @Address1 VARCHAR(255) ,
    @Address2 VARCHAR(255) ,
    @ZipCode VARCHAR(5) ,
    @MaritalStatusId TINYINT ,
    @SSN VARCHAR(9) ,
    @Phone VARCHAR(20) ,
    @Fax VARCHAR(20) ,
    @EmailAddress VARCHAR(255) ,
    @MemberNumber VARCHAR(22) ,
    @MemberId INT ,
    @UwCustomerClassId INT ,
    @UwCustomerDivisionId INT ,
    @EmployeeTypeId TINYINT ,
    @HiringDate DATETIME ,
    @PageNumber INT = 1 ,
    @PageSize INT = NULL ,
    @SortField VARCHAR(128) = NULL ,
    @SortDirection VARCHAR(20) = NULL ,
    @WeeklyHours TINYINT ,
    @AnnualSalary MONEY ,
    @CobraContinueCoverage BIT ,
    @CobraElectionForm BIT ,
    @CobraOnPriorBill BIT ,
    @CobraQualifyingEventId TINYINT ,
    @CobraDateOfQualifyingEvent DATETIME ,
    @CobraMonthsEligible SMALLINT ,
    @CobraMonthsRemaining SMALLINT ,
    @IsSocialSecurityDocumentationProvided BIT ,
    @CobraEffectiveFromDate DATETIME = NULL ,
    @CobraEffectiveToDate DATETIME = NULL ,
    @CobraTypeId TINYINT = NULL ,
    @IsSmoker BIT = NULL ,
    @IsResponsibleParty BIT = NULL ,
    @ReportingPreference VARCHAR(8) = NULL ,
    @RosterNumber INT = NULL ,
    @MembershipNumber VARCHAR(22) = NULL ,
    @MemberNumberOrMembershipNumber VARCHAR(22) = NULL ,
    @StateCode VARCHAR(50) = NULL ,
    @City VARCHAR(50) = NULL,
	@IsDeleted BIT = NULL,
	@IsGroupMember BIT = NULL
AS
    BEGIN
    
        IF ( @MemberNumberOrMembershipNumber IS NOT NULL
             AND @MemberNumberOrMembershipNumber LIKE 'A%'
           )
            BEGIN 
                SET @MembershipNumber = @MemberNumberOrMembershipNumber;
                SET @MemberNumberOrMembershipNumber = NULL;
            END;
        ELSE
            IF ( @MemberNumberOrMembershipNumber IS NOT NULL )
                BEGIN
                    SET @MemberNumber = @MemberNumberOrMembershipNumber;
                    SET @MemberNumberOrMembershipNumber = NULL;

                END;
                
                /*fix the performance for the crdit card transactions*/
                /*
                IF (@MemberNumber IS NOT NULL AND @UwMemberId IS NULL)
                BEGIN
                	SET @UwMemberId=CAST(LEFT(@MemberNumber,8) AS int)
                	SET @MemberNumber=NULL
                END
                */
                 
        DECLARE @LowerLimit INT;
        DECLARE @UpperLimit INT;

        SET @LowerLimit = ( @PageNumber - 1 ) * @PageSize + 1;
        SET @UpperLimit = @PageNumber * @PageSize;

        SELECT  COUNT(1) TotalRecords
        FROM    Customers.[UwMember]  
        join    Customers.[UwCustomer]  ON UwCustomer.UwCustomerId =UwMember.UwCustomerId
                LEFT JOIN dbo.ZipCode z ON z.ZipCode = UwMember.ZipCode
        WHERE   ( @UwMemberId IS NULL
                  OR UwMemberId = @UwMemberId
                )
                AND ( @UwCustomerId IS NULL
                      OR UwMember.UwCustomerId = @UwCustomerId
                    )
                AND ( @FirstName IS NULL
                      OR FirstName LIKE @FirstName + '%'
                    )
                AND ( @ExchangeAlternateID IS NULL
                      OR EXISTS ( SELECT    1
                                  FROM      Customers.UwMemberExchangeIdentifier exch
                                  WHERE     exch.UwMemberId = Customers.[UwMember].UwMemberId
                                            AND exch.ExchangeAlternateId = @ExchangeAlternateID )
                    )
                AND ( @MiddleInitial IS NULL
                      OR MiddleInitial LIKE @MiddleInitial + '%'
                    )
                AND ( @LastName IS NULL
                      OR LastName LIKE @LastName + '%'
                    )
                AND ( @BirthDate IS NULL
                      OR BirthDate = @BirthDate
                    )
                AND ( @Gender IS NULL
                      OR Gender LIKE @Gender + '%'
                    )
                AND ( @Address1 IS NULL OR (UwMember.Address1 LIKE @Address1 + '%' ) OR (MailingAddress1 LIKE @Address1 + '%'))
                AND ( @Address2 IS NULL
                      OR UwMember.Address2 LIKE @Address2 + '%'
                    )
                AND ( @ZipCode IS NULL
                      OR UwMember.ZipCode LIKE @ZipCode + '%'
                    )
                AND ( @MaritalStatusId IS NULL
                      OR MaritalStatusId = @MaritalStatusId
                    )
                AND ( @SSN IS NULL
                      OR SSN = @SSN
                    )
                AND ( @Phone IS NULL OR Phone LIKE @Phone + '%' OR AlternatePhone LIKE @Phone + '%' )
                AND ( @Fax IS NULL
                      OR Fax LIKE @Fax + '%'
                    )
                AND ( @EmailAddress IS NULL
                      OR EmailAddress LIKE @EmailAddress + '%'
                    )
                AND ( @MemberNumber IS NULL
                      OR MemberNumber LIKE @MemberNumber + '%'
                    )
                AND ( @MemberId IS NULL
                      OR MemberId = @MemberId
                    )
                AND ( @UwCustomerClassId IS NULL
                      OR UwCustomerClassId = @UwCustomerClassId
                    )
                AND ( @UwCustomerDivisionId IS NULL
                      OR UwCustomerDivisionId = @UwCustomerDivisionId
                    )
                AND ( @EmployeeTypeId IS NULL
                      OR EmployeeTypeId = @EmployeeTypeId
                    )
                AND ( @HiringDate IS NULL
                      OR HiringDate = @HiringDate
                    )
                AND ( @WeeklyHours IS NULL
                      OR WeeklyHours = @WeeklyHours
                    )
                AND ( @AnnualSalary IS NULL
                      OR AnnualSalary = @AnnualSalary
                    )
                AND ( @CobraContinueCoverage IS NULL
                      OR CobraContinueCoverage = @CobraContinueCoverage
                    )
                AND ( @CobraElectionForm IS NULL
                      OR CobraElectionForm = @CobraElectionForm
                    )
                AND ( @CobraOnPriorBill IS NULL
                      OR CobraOnPriorBill = @CobraOnPriorBill
                    )
                AND ( @CobraQualifyingEventId IS NULL
                      OR CobraQualifyingEventId = @CobraQualifyingEventId
                    )
                AND ( @CobraDateOfQualifyingEvent IS NULL
                      OR CobraDateOfQualifyingEvent = @CobraDateOfQualifyingEvent
                    )
                AND ( @CobraMonthsEligible IS NULL
                      OR CobraMonthsEligible = @CobraMonthsEligible
                    )
                AND ( @CobraMonthsRemaining IS NULL
                      OR CobraMonthsRemaining = @CobraMonthsRemaining
                    )
                AND ( @IsSocialSecurityDocumentationProvided IS NULL
                      OR IsSocialSecurityDocumentationProvided = @IsSocialSecurityDocumentationProvided
                    )
                AND ( @CobraEffectiveFromDate IS NULL
                      OR CobraEffectiveFromDate = @CobraEffectiveFromDate
                    )
                AND ( @CobraEffectiveToDate IS NULL
                      OR CobraEffectiveToDate = @CobraEffectiveToDate
                    )
                AND ( @CobraTypeId IS NULL
                      OR CobraTypeId = @CobraTypeId
                    )
                AND ( @IsSmoker IS NULL
                      OR IsSmoker = @IsSmoker
                    )
                AND ( @IsResponsibleParty IS NULL
                      OR IsResponsibleParty = @IsResponsibleParty
                    )
                AND ( @ReportingPreference IS NULL
                      OR UwMember.ReportingPreference = @ReportingPreference
                    )
                AND ( @RosterNumber IS NULL
                      OR RoasterNumber = @RosterNumber
                    )
                AND ( @MembershipNumber IS NULL
                      OR MembershipNumber = @MembershipNumber
                    )
                AND ( @StateCode IS NULL
                      OR z.StateCode = @StateCode
                    )
                AND ( @City IS NULL
                      OR REPLACE(z.City, ' ', '') LIKE @City + '%'
                    )
				AND ( @IsDeleted IS NULL
                      OR IsDeleted = @IsDeleted
                    )
			    AND ( @IsGroupMember IS NULL
				      OR (@IsGroupMember = 0 AND (UwCustomer.MarketingSegmentId IN (6,7,13)))
                      OR (@IsGroupMember = 1 AND (UwCustomer.MarketingSegmentId IN (8,9,14) OR UwCustomer.MarketingSegmentId IS null))
                    )
					;                  

        IF ISNULL(@SortDirection, 'Ascending') = 'Ascending'
            BEGIN
                SELECT  UwMemberId ,
                        UwCustomerId ,
                        CustomerName ,
                        CustomerNumber ,
                        FirstName ,
                        ExchangeAlternateID ,
                        MiddleInitial ,
                        LastName ,
                        BirthDate ,
                        Gender ,
                        Address1 ,
                        Address2 ,
                        ZipCode ,
                        MaritalStatusId ,
                        SSN ,
                        Phone ,
                        Fax ,
                        EmailAddress ,
                        MemberNumber ,
                        MemberId ,
                        UwCustomerClassId ,
                        UwCustomerDivisionId ,
                        EmployeeTypeId ,
                        HiringDate ,
                        WeeklyHours ,
                        AnnualSalary ,
                        CobraContinueCoverage ,
                        CobraElectionForm ,
                        CobraOnPriorBill ,
                        CobraQualifyingEventId ,
                        CobraDateOfQualifyingEvent ,
                        CobraMonthsEligible ,
                        CobraMonthsRemaining ,
                        IsSocialSecurityDocumentationProvided ,
                        IsSmoker ,
                        IsResponsibleParty ,
                        CobraEffectiveFromDate ,
                        CobraEffectiveToDate ,
                        CobraTypeId ,
                        MemberStatusId ,
                        ReportingPreference ,
                        RoasterNumber ,
                        MembershipNumber ,
                        AddressChangeDate ,
                        CountyId ,
                        RatingAreaNumber ,
                        ResponsiblePartyFirstName ,
                        ResponsiblePartyMiddleInitial ,
                        ResponsiblePartyLastName ,
                        ResponsiblePartySSN ,
                        MailingAddress1 ,
                        MailingAddress2 ,
                        MailingZipCode ,
                        MailingAddressSameAsCoverageAddress ,
                        AlternatePhone ,
                        MoveFromMemberNumber ,
                        MoveToMemberNumber ,
						CoverageAddressChangedByHIAS,
						CoverageAddressLastChangeDateByHIAS,
						MailingAddressChangedByHIAS,
						MailingAddressLastChangeDateByHIAS,
						LifeCoverageInvoiceBillingCycleTypeId,
						PrimaryPreferenceInReceivingInvoicesTypeId
                FROM    ( SELECT    UwMemberId ,
                                    UwMember.UwCustomerId ,
                                    UwCustomer.[Name] CustomerName,
                                    UwCustomer.CustomerNumber CustomerNumber,
                                    FirstName ,
                                    UwMember.ExchangeAlternateID ,
                                    MiddleInitial ,
                                    LastName ,
                                    BirthDate ,
                                    Gender ,
                                    UwMember.Address1 ,
                                    UwMember.Address2 ,
                                    UwMember.ZipCode ,
                                    MaritalStatusId ,
                                    SSN ,
                                    Phone ,
                                    Fax ,
                                    EmailAddress ,
                                    Customers.[UwMember].MemberNumber ,
                                    MemberId ,
                                    UwCustomerClassId ,
                                    UwCustomerDivisionId ,
                                    EmployeeTypeId ,
                                    HiringDate ,
                                    WeeklyHours ,
                                    AnnualSalary ,
                                    CobraContinueCoverage ,
                                    CobraElectionForm ,
                                    CobraOnPriorBill ,
                                    CobraQualifyingEventId ,
                                    CobraDateOfQualifyingEvent ,
                                    CobraMonthsEligible ,
                                    CobraMonthsRemaining ,
                                    IsSocialSecurityDocumentationProvided ,
                                    IsSmoker ,
                                    IsResponsibleParty ,
                                    CobraEffectiveFromDate ,
                                    CobraEffectiveToDate ,
                                    CobraTypeId ,
                                    MemberStatusId ,
                                    UwMember.ReportingPreference ,
                                    RoasterNumber ,
                                    MembershipNumber ,
                                    AddressChangeDate ,
                                    CountyId ,
                                    RatingAreaNumber ,
                                    ResponsiblePartyFirstName ,
                                    ResponsiblePartyMiddleInitial ,
                                    ResponsiblePartyLastName ,
                                    ResponsiblePartySSN ,
                                    MailingAddress1 ,
                                    MailingAddress2 ,
                                    MailingZipCode ,
                                    MailingAddressSameAsCoverageAddress ,
                                    AlternatePhone ,
                                    MemberMoveFrom.MemberNumber AS MoveFromMemberNumber ,
                                    MemberMoveTo.MemberNumber AS MoveToMemberNumber ,
									UwMember.CoverageAddressChangedByHIAS AS CoverageAddressChangedByHIAS,
									UwMember.CoverageAddressLastChangeDateByHIAS AS CoverageAddressLastChangeDateByHIAS,
									UwMember.MailingAddressChangedByHIAS AS MailingAddressChangedByHIAS,
									UwMember.MailingAddressLastChangeDateByHIAS AS MailingAddressLastChangeDateByHIAS,
									LifeCoverageInvoiceBillingCycleTypeId,
									PrimaryPreferenceInReceivingInvoicesTypeId,
                                    CASE ISNULL(@SortField, 'Default')
                                      WHEN 'Default'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMemberId ASC, LastName ASC, FirstName ASC )
                                      WHEN 'UwCustomerId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.UwCustomerId ASC, LastName ASC, FirstName ASC )
									   WHEN 'CustomerName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomer.[Name] ASC, LastName ASC, FirstName ASC )
									   WHEN 'CustomerNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomer.CustomerNumber ASC, LastName ASC, FirstName ASC )
                                      WHEN 'FirstName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY FirstName ASC, LastName ASC, FirstName ASC )
                                      WHEN 'ExchangeAlternateID'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.ExchangeAlternateID ASC, LastName ASC, FirstName ASC )
                                      WHEN 'MiddleInitial'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MiddleInitial ASC, LastName ASC, FirstName ASC )
                                      WHEN 'LastName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY LastName ASC, LastName ASC, FirstName ASC )
                                      WHEN 'BirthDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY BirthDate ASC, LastName ASC, FirstName ASC )
                                      WHEN 'Gender'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Gender ASC, LastName ASC, FirstName ASC )
                                      WHEN 'Address1'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.Address1 ASC, LastName ASC, FirstName ASC )
                                      WHEN 'Address2'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.Address2 ASC, LastName ASC, FirstName ASC )
                                      WHEN 'ZipCode'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.ZipCode ASC, LastName ASC, FirstName ASC )
                                      WHEN 'MaritalStatusId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MaritalStatusId ASC, LastName ASC, FirstName ASC )
                                      WHEN 'SSN'
                                      THEN ROW_NUMBER() OVER ( ORDER BY SSN ASC, LastName ASC, FirstName ASC )
                                      WHEN 'Phone'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Phone ASC, LastName ASC, FirstName ASC )
                                      WHEN 'Fax'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Fax ASC, LastName ASC, FirstName ASC )
                                      WHEN 'EmailAddress'
                                      THEN ROW_NUMBER() OVER ( ORDER BY EmailAddress ASC, LastName ASC, FirstName ASC )
                                      WHEN 'MemberNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Customers.[UwMember].MemberNumber ASC, LastName ASC, FirstName ASC )
                                      WHEN 'MemberId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MemberId ASC, LastName ASC, FirstName ASC )
                                      WHEN 'UwCustomerClassId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomerClassId ASC, LastName ASC, FirstName ASC )
                                      WHEN 'UwCustomerDivisionId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomerDivisionId ASC, LastName ASC, FirstName ASC )
                                      WHEN 'EmployeeTypeId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY EmployeeTypeId ASC, LastName ASC, FirstName ASC )
                                      WHEN 'HiringDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY HiringDate ASC, LastName ASC, FirstName ASC )
                                      WHEN 'WeeklyHours'
                                      THEN ROW_NUMBER() OVER ( ORDER BY WeeklyHours ASC )
                                      WHEN 'AnnualSalary'
                                      THEN ROW_NUMBER() OVER ( ORDER BY AnnualSalary ASC )
                                      WHEN 'CobraContinueCoverage'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraContinueCoverage ASC )
                                      WHEN 'CobraElectionForm'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraElectionForm ASC )
                                      WHEN 'CobraOnPriorBill'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraOnPriorBill ASC )
                                      WHEN 'CobraQualifyingEventId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraQualifyingEventId ASC )
                                      WHEN 'CobraDateOfQualifyingEvent'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraDateOfQualifyingEvent ASC )
                                      WHEN 'CobraMonthsEligible'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraMonthsEligible ASC )
                                      WHEN 'CobraMonthsRemaining'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraMonthsRemaining ASC )
                                      WHEN 'IsSocialSecurityDocumentationProvided'
                                      THEN ROW_NUMBER() OVER ( ORDER BY IsSocialSecurityDocumentationProvided ASC )
                                      WHEN 'CobraEffectiveFromDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraEffectiveFromDate ASC )
                                      WHEN 'CobraEffectiveToDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraEffectiveToDate ASC )
                                      WHEN 'CobraTypeId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraTypeId ASC )
                                      WHEN 'RoasterNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY RoasterNumber ASC )
                                    END AS RowNum
                          FROM      Customers.[UwMember]
						  join      Customers.[UwCustomer]  ON UwCustomer.UwCustomerId =UwMember.UwCustomerId
                                    LEFT JOIN dbo.ZipCode z ON z.ZipCode = UwMember.ZipCode
                                    OUTER APPLY ( SELECT TOP 1
                                                            inner_uwm.MemberNumber
                                                  FROM      dbo.UwMemberMoveMapping
                                                            AS mmm
                                                            INNER JOIN Customers.UwMember
                                                            AS inner_uwm ON mmm.ExchangeUwMemberID = inner_uwm.UwMemberId
                                                  WHERE     mmm.OffExchangeUwMemberID = Customers.[UwMember].UwMemberId
                                                  --ORDER BY  mmm.CreationDate DESC
                                                ) AS MemberMoveFrom
                                    OUTER APPLY ( SELECT TOP 1
                                                            inner_uwm.MemberNumber
                                                  FROM      dbo.UwMemberMoveMapping
                                                            AS mmm
                                                            INNER JOIN Customers.UwMember
                                                            AS inner_uwm ON mmm.OffExchangeUwMemberID = inner_uwm.UwMemberId
                                                  WHERE     mmm.ExchangeUwMemberID = Customers.[UwMember].UwMemberId
                                                 -- ORDER BY  mmm.CreationDate DESC
                                                ) AS MemberMoveTo
                          WHERE     ( @UwMemberId IS NULL
                                      OR UwMemberId = @UwMemberId
                                    )
                                    AND ( @UwCustomerId IS NULL
                                          OR UwMember.UwCustomerId = @UwCustomerId
                                        )
                                    AND ( @FirstName IS NULL
                                          OR FirstName LIKE @FirstName + '%'
                                        )
                                    AND ( @ExchangeAlternateID IS NULL
                                          OR EXISTS ( SELECT  1
                                                      FROM    Customers.UwMemberExchangeIdentifier exch
                                                      WHERE   exch.UwMemberId = Customers.[UwMember].UwMemberId
                                                              AND exch.ExchangeAlternateId = @ExchangeAlternateID )
                                        )
                                    AND ( @MiddleInitial IS NULL
                                          OR MiddleInitial LIKE @MiddleInitial
                                          + '%'
                                        )
                                    AND ( @LastName IS NULL
                                          OR LastName LIKE @LastName + '%'
                                        )
                                    AND ( @BirthDate IS NULL
                                          OR BirthDate = @BirthDate
                                        )
                                    AND ( @Gender IS NULL
                                          OR Gender LIKE @Gender + '%'
                                        )
									AND ( @Address1 IS NULL OR (UwMember.Address1 LIKE @Address1 + '%' ) OR (UwMember.MailingAddress1 LIKE @Address1 + '%'))
                                    AND ( @Address2 IS NULL
                                          OR UwMember.Address2 LIKE @Address2 + '%'
                                        )
                                    AND ( @ZipCode IS NULL
                                          OR UwMember.ZipCode LIKE @ZipCode
                                          + '%'
                                        )
                                    AND ( @MaritalStatusId IS NULL
                                          OR MaritalStatusId = @MaritalStatusId
                                        )
                                    AND ( @SSN IS NULL
                                          OR SSN = @SSN
                                        )
									AND ( @Phone IS NULL OR Phone LIKE @Phone + '%' OR AlternatePhone LIKE @Phone + '%' )
                                    AND ( @Fax IS NULL
                                          OR Fax LIKE @Fax + '%'
                                        )
                                    AND ( @EmailAddress IS NULL
                                          OR EmailAddress LIKE @EmailAddress
                                          + '%'
                                        )
                                    AND ( @MemberNumber IS NULL
                                          OR Customers.[UwMember].MemberNumber LIKE @MemberNumber
                                          + '%'
                                        )
                                    AND ( @MemberId IS NULL
                                          OR MemberId = @MemberId
                                        )
                                    AND ( @UwCustomerClassId IS NULL
                                          OR UwCustomerClassId = @UwCustomerClassId
                                        )
                                    AND ( @UwCustomerDivisionId IS NULL
                                          OR UwCustomerDivisionId = @UwCustomerDivisionId
                                        )
                                    AND ( @EmployeeTypeId IS NULL
                                          OR EmployeeTypeId = @EmployeeTypeId
                                        )
                                    AND ( @HiringDate IS NULL
                                          OR HiringDate = @HiringDate
                                        )
                                    AND ( @WeeklyHours IS NULL
                                          OR WeeklyHours = @WeeklyHours
                                        )
                                    AND ( @AnnualSalary IS NULL
                                          OR AnnualSalary = @AnnualSalary
                                        )
                                    AND ( @CobraContinueCoverage IS NULL
                                          OR CobraContinueCoverage = @CobraContinueCoverage
                                        )
                                    AND ( @CobraElectionForm IS NULL
                                          OR CobraElectionForm = @CobraElectionForm
                                        )
                                    AND ( @CobraOnPriorBill IS NULL
                                          OR CobraOnPriorBill = @CobraOnPriorBill
                                        )
                                    AND ( @CobraQualifyingEventId IS NULL
                                          OR CobraQualifyingEventId = @CobraQualifyingEventId
                                        )
                                    AND ( @CobraDateOfQualifyingEvent IS NULL
                                          OR CobraDateOfQualifyingEvent = @CobraDateOfQualifyingEvent
                                        )
                                    AND ( @CobraMonthsEligible IS NULL
                                          OR CobraMonthsEligible = @CobraMonthsEligible
                                        )
                                    AND ( @CobraMonthsRemaining IS NULL
                                          OR CobraMonthsRemaining = @CobraMonthsRemaining
                                        )
                                    AND ( @IsSocialSecurityDocumentationProvided IS NULL
                                          OR IsSocialSecurityDocumentationProvided = @IsSocialSecurityDocumentationProvided
                                        )
                                    AND ( @CobraEffectiveFromDate IS NULL
                                          OR CobraEffectiveFromDate = @CobraEffectiveFromDate
                                        )
                                    AND ( @CobraEffectiveToDate IS NULL
                                          OR CobraEffectiveToDate = @CobraEffectiveToDate
                                        )
                                    AND ( @CobraTypeId IS NULL
                                          OR CobraTypeId = @CobraTypeId
                                        )
                                    AND ( @IsSmoker IS NULL
                                          OR IsSmoker = @IsSmoker
                                        )
                                    AND ( @IsResponsibleParty IS NULL
                                          OR IsResponsibleParty = @IsResponsibleParty
                                        )
                                    AND ( @ReportingPreference IS NULL
                                          OR UwMember.ReportingPreference = @ReportingPreference
                                        )
                                    AND ( @RosterNumber IS NULL
                                          OR RoasterNumber = @RosterNumber
                                        )
                                    AND ( @MembershipNumber IS NULL
                                          OR MembershipNumber = @MembershipNumber
                                        )
                                    AND ( @StateCode IS NULL
                                          OR z.StateCode = @StateCode
                                        )
                                    AND ( @City IS NULL
                                          OR REPLACE(z.City, ' ', '') LIKE @City
                                          + '%'
                                        )
										  AND ( @IsGroupMember IS NULL
												  OR (@IsGroupMember = 0 AND (UwCustomer.MarketingSegmentId IN (6,7,13)))
												  OR (@IsGroupMember = 1 AND (UwCustomer.MarketingSegmentId IN (8,9,14) OR UwCustomer.MarketingSegmentId IS null))
												)
                        ) InnerQuery
                WHERE   RowNum >= @LowerLimit
                        AND RowNum <= @UpperLimit
                        OR @PageSize IS NULL
                ORDER BY RowNum;
            END;
        ELSE
            BEGIN
                SELECT  UwMemberId ,
                        UwCustomerId ,
						CustomerName ,
                        CustomerNumber ,
                        FirstName ,
                        ExchangeAlternateID ,
                        MiddleInitial ,
                        LastName ,
                        BirthDate ,
                        Gender ,
                        Address1 ,
                        Address2 ,
                        ZipCode ,
                        MaritalStatusId ,
                        SSN ,
                        Phone ,
                        Fax ,
                        EmailAddress ,
                        MemberNumber ,
                        MemberId ,
                        UwCustomerClassId ,
                        UwCustomerDivisionId ,
                        EmployeeTypeId ,
                        HiringDate ,
                        WeeklyHours ,
                        AnnualSalary ,
                        CobraContinueCoverage ,
                        CobraElectionForm ,
                        CobraOnPriorBill ,
                        CobraQualifyingEventId ,
                        CobraDateOfQualifyingEvent ,
                        CobraMonthsEligible ,
                        CobraMonthsRemaining ,
                        IsSocialSecurityDocumentationProvided ,
                        IsSmoker ,
                        IsResponsibleParty ,
                        CobraEffectiveFromDate ,
                        CobraEffectiveToDate ,
                        CobraTypeId ,
                        MemberStatusId ,
                        ReportingPreference ,
                        RoasterNumber ,
                        MembershipNumber ,
                        AddressChangeDate ,
                        CountyId ,
                        RatingAreaNumber ,
                        ResponsiblePartyFirstName ,
                        ResponsiblePartyMiddleInitial ,
                        ResponsiblePartyLastName ,
                        ResponsiblePartySSN ,
                        MailingAddress1 ,
                        MailingAddress2 ,
                        MailingZipCode ,
                        MailingAddressSameAsCoverageAddress ,
                        AlternatePhone ,
                        MoveFromMemberNumber ,
                        MoveToMemberNumber ,
						CoverageAddressChangedByHIAS,
						CoverageAddressLastChangeDateByHIAS,
						MailingAddressChangedByHIAS,
						MailingAddressLastChangeDateByHIAS,
						LifeCoverageInvoiceBillingCycleTypeId,
						PrimaryPreferenceInReceivingInvoicesTypeId
                FROM    ( SELECT    UwMemberId ,
                                    UwMember.UwCustomerId ,
									UwCustomer.[Name] CustomerName,
                                    UwCustomer.CustomerNumber CustomerNumber,
                                    FirstName ,
                                    UwMember.ExchangeAlternateID ,
                                    MiddleInitial ,
                                    LastName ,
                                    BirthDate ,
                                    Gender ,
                                    UwMember.Address1 ,
                                    UwMember.Address2 ,
                                    UwMember.ZipCode ,
                                    MaritalStatusId ,
                                    SSN ,
                                    Phone ,
                                    Fax ,
                                    EmailAddress ,
                                    Customers.[UwMember].MemberNumber ,
                                    MemberId ,
                                    UwCustomerClassId ,
                                    UwCustomerDivisionId ,
                                    EmployeeTypeId ,
                                    HiringDate ,
                                    WeeklyHours ,
                                    AnnualSalary ,
                                    CobraContinueCoverage ,
                                    CobraElectionForm ,
                                    CobraOnPriorBill ,
                                    CobraQualifyingEventId ,
                                    CobraDateOfQualifyingEvent ,
                                    CobraMonthsEligible ,
                                    CobraMonthsRemaining ,
                                    IsSocialSecurityDocumentationProvided ,
                                    IsSmoker ,
                                    IsResponsibleParty ,
                                    CobraEffectiveFromDate ,
                                    CobraEffectiveToDate ,
                                    CobraTypeId ,
                                    MemberStatusId ,
                                    UwMember.ReportingPreference ,
                                    RoasterNumber ,
                                    MembershipNumber ,
                                    AddressChangeDate ,
                                    CountyId ,
                                    RatingAreaNumber ,
                                    ResponsiblePartyFirstName ,
                                    ResponsiblePartyMiddleInitial ,
                                    ResponsiblePartyLastName ,
                                    ResponsiblePartySSN ,
                                    MailingAddress1 ,
                                    MailingAddress2 ,
                                    MailingZipCode ,
                                    MailingAddressSameAsCoverageAddress ,
                                    AlternatePhone ,
                                    MemberMoveFrom.MemberNumber AS MoveFromMemberNumber ,
                                    MemberMoveTo.MemberNumber AS MoveToMemberNumber ,
									UwMember.CoverageAddressChangedByHIAS AS CoverageAddressChangedByHIAS,
									UwMember.CoverageAddressLastChangeDateByHIAS AS CoverageAddressLastChangeDateByHIAS,
									UwMember.MailingAddressChangedByHIAS AS MailingAddressChangedByHIAS,
									UwMember.MailingAddressLastChangeDateByHIAS AS MailingAddressLastChangeDateByHIAS ,
									LifeCoverageInvoiceBillingCycleTypeId,
									PrimaryPreferenceInReceivingInvoicesTypeId,
                                    CASE ISNULL(@SortField, 'Default')
                                      WHEN 'Default'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMemberId DESC, LastName ASC, FirstName ASC )
                                      WHEN 'UwCustomerId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.UwCustomerId DESC, LastName ASC, FirstName ASC )
									  WHEN 'CustomerName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomer.[Name] ASC, LastName ASC, FirstName ASC )
									   WHEN 'CustomerNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomer.CustomerNumber ASC, LastName ASC, FirstName ASC )
                                      WHEN 'FirstName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY FirstName DESC, LastName ASC, FirstName ASC )
                                      WHEN 'ExchangeAlternateID'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.ExchangeAlternateID DESC, LastName ASC, FirstName ASC )
                                      WHEN 'MiddleInitial'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MiddleInitial DESC, LastName ASC, FirstName ASC )
                                      WHEN 'LastName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY LastName DESC, LastName ASC, FirstName ASC )
                                      WHEN 'BirthDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY BirthDate DESC, LastName ASC, FirstName ASC )
                                      WHEN 'Gender'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Gender DESC, LastName ASC, FirstName ASC )
                                      WHEN 'Address1'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.Address1 DESC, LastName ASC, FirstName ASC )
                                      WHEN 'Address2'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.Address2 DESC, LastName ASC, FirstName ASC )
                                      WHEN 'ZipCode'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwMember.ZipCode DESC, LastName ASC, FirstName ASC )
                                      WHEN 'MaritalStatusId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MaritalStatusId DESC, LastName ASC, FirstName ASC )
                                      WHEN 'SSN'
                                      THEN ROW_NUMBER() OVER ( ORDER BY SSN DESC, LastName ASC, FirstName ASC )
                                      WHEN 'Phone'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Phone DESC, LastName ASC, FirstName ASC )
                                      WHEN 'Fax'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Fax DESC, LastName ASC, FirstName ASC )
                                      WHEN 'EmailAddress'
                                      THEN ROW_NUMBER() OVER ( ORDER BY EmailAddress DESC, LastName ASC, FirstName ASC )
                                      WHEN 'MemberNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Customers.[UwMember].MemberNumber DESC, LastName ASC, FirstName ASC )
                                      WHEN 'MemberId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MemberId DESC, LastName ASC, FirstName ASC )
                                      WHEN 'UwCustomerClassId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomerClassId DESC, LastName ASC, FirstName ASC )
                                      WHEN 'UwCustomerDivisionId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomerDivisionId DESC, LastName ASC, FirstName ASC )
                                      WHEN 'EmployeeTypeId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY EmployeeTypeId DESC, LastName ASC, FirstName ASC )
                                      WHEN 'HiringDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY HiringDate DESC, LastName ASC, FirstName ASC )
                                      WHEN 'WeeklyHours'
                                      THEN ROW_NUMBER() OVER ( ORDER BY WeeklyHours ASC )
                                      WHEN 'AnnualSalary'
                                      THEN ROW_NUMBER() OVER ( ORDER BY AnnualSalary ASC )
                                      WHEN 'CobraContinueCoverage'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraContinueCoverage ASC )
                                      WHEN 'CobraElectionForm'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraElectionForm ASC )
                                      WHEN 'CobraOnPriorBill'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraOnPriorBill ASC )
                                      WHEN 'CobraQualifyingEventId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraQualifyingEventId ASC )
                                      WHEN 'CobraDateOfQualifyingEvent'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraDateOfQualifyingEvent ASC )
                                      WHEN 'CobraMonthsEligible'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraMonthsEligible ASC )
                                      WHEN 'CobraMonthsRemaining'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraMonthsRemaining ASC )
                                      WHEN 'IsSocialSecurityDocumentationProvided'
                                      THEN ROW_NUMBER() OVER ( ORDER BY IsSocialSecurityDocumentationProvided ASC )
                                      WHEN 'CobraEffectiveFromDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraEffectiveFromDate ASC )
                                      WHEN 'CobraEffectiveToDate'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraEffectiveToDate ASC )
                                      WHEN 'CobraTypeId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CobraTypeId ASC )
                                      WHEN 'RoasterNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY RoasterNumber DESC )
                                    END AS RowNum
                          FROM      Customers.[UwMember]
						  join Customers.[UwCustomer]  ON UwCustomer.UwCustomerId =UwMember.UwCustomerId
                                    LEFT JOIN dbo.ZipCode z ON z.ZipCode = UwMember.ZipCode
                                    OUTER APPLY ( SELECT TOP 1
                                                            inner_uwm.MemberNumber
                                                  FROM      dbo.UwMemberMoveMapping
                                                            AS mmm
                                                            INNER JOIN Customers.UwMember
                                                            AS inner_uwm ON mmm.ExchangeUwMemberID = inner_uwm.UwMemberId
                                                  WHERE     mmm.OffExchangeUwMemberID = Customers.[UwMember].UwMemberId
                                                  --ORDER BY  mmm.CreationDate DESC
                                                ) AS MemberMoveFrom
                                    OUTER APPLY ( SELECT TOP 1
                                                            inner_uwm.MemberNumber
                                                  FROM      dbo.UwMemberMoveMapping
                                                            AS mmm
                                                            INNER JOIN Customers.UwMember
                                                            AS inner_uwm ON mmm.OffExchangeUwMemberID = inner_uwm.UwMemberId
                                                  WHERE     mmm.ExchangeUwMemberID = Customers.[UwMember].UwMemberId
                                                 -- ORDER BY  mmm.CreationDate DESC
                                                ) AS MemberMoveTo
                          WHERE     ( @UwMemberId IS NULL
                                      OR UwMemberId = @UwMemberId
                                    )
                                    AND ( @UwCustomerId IS NULL
                                          OR UwMember.UwCustomerId = @UwCustomerId
                                        )
                                    AND ( @FirstName IS NULL
                                          OR FirstName LIKE @FirstName + '%'
                                        )
                                    AND ( @ExchangeAlternateID IS NULL
                                          OR EXISTS ( SELECT  1
                                                      FROM    Customers.UwMemberExchangeIdentifier exch
                                                      WHERE   exch.UwMemberId = Customers.[UwMember].UwMemberId
                                                              AND exch.ExchangeAlternateId = @ExchangeAlternateID )
                                        )
                                    AND ( @MiddleInitial IS NULL
                                          OR MiddleInitial LIKE @MiddleInitial
                                          + '%'
                                        )
                                    AND ( @LastName IS NULL
                                          OR LastName LIKE @LastName + '%'
                                        )
                                    AND ( @BirthDate IS NULL
                                          OR BirthDate = @BirthDate
                                        )
                                    AND ( @Gender IS NULL
                                          OR Gender LIKE @Gender + '%'
                                        )
									AND ( @Address1 IS NULL OR (UwMember.Address1 LIKE @Address1 + '%' ) OR (MailingAddress1 LIKE @Address1 + '%'))
                                    AND ( @Address2 IS NULL
                                          OR UwMember.Address2 LIKE @Address2 + '%'
                                        )
                                    AND ( @ZipCode IS NULL
                                          OR UwMember.ZipCode LIKE @ZipCode
                                          + '%'
                                        )
                                    AND ( @MaritalStatusId IS NULL
                                          OR MaritalStatusId = @MaritalStatusId
                                        )
                                    AND ( @SSN IS NULL
                                          OR SSN = @SSN
                                        )
									AND ( @Phone IS NULL OR Phone LIKE @Phone + '%' OR AlternatePhone LIKE @Phone + '%' )
                                    AND ( @Fax IS NULL
                                          OR Fax LIKE @Fax + '%'
                                        )
                                    AND ( @EmailAddress IS NULL
                                          OR EmailAddress LIKE @EmailAddress
                                          + '%'
                                        )
                                    AND ( @MemberNumber IS NULL
                                          OR Customers.[UwMember].MemberNumber LIKE @MemberNumber
                                          + '%'
                                        )
                                    AND ( @MemberId IS NULL
                                          OR MemberId = @MemberId
                                        )
                                    AND ( @UwCustomerClassId IS NULL
                                          OR UwCustomerClassId = @UwCustomerClassId
                                        )
                                    AND ( @UwCustomerDivisionId IS NULL
                                          OR UwCustomerDivisionId = @UwCustomerDivisionId
                                        )
                                    AND ( @EmployeeTypeId IS NULL
                                          OR EmployeeTypeId = @EmployeeTypeId
                                        )
                                    AND ( @HiringDate IS NULL
                                          OR HiringDate = @HiringDate
                                        )
                                    AND ( @WeeklyHours IS NULL
                                          OR WeeklyHours = @WeeklyHours
                                        )
                                    AND ( @AnnualSalary IS NULL
                                          OR AnnualSalary = @AnnualSalary
                                        )
                                    AND ( @CobraContinueCoverage IS NULL
                                          OR CobraContinueCoverage = @CobraContinueCoverage
                                        )
                                    AND ( @CobraElectionForm IS NULL
                                          OR CobraElectionForm = @CobraElectionForm
                                        )
                                    AND ( @CobraOnPriorBill IS NULL
                                          OR CobraOnPriorBill = @CobraOnPriorBill
                                        )
                                    AND ( @CobraQualifyingEventId IS NULL
                                          OR CobraQualifyingEventId = @CobraQualifyingEventId
                                        )
                                    AND ( @CobraDateOfQualifyingEvent IS NULL
                                          OR CobraDateOfQualifyingEvent = @CobraDateOfQualifyingEvent
                                        )
                                    AND ( @CobraMonthsEligible IS NULL
                                          OR CobraMonthsEligible = @CobraMonthsEligible
                                        )
                                    AND ( @CobraMonthsRemaining IS NULL
                                          OR CobraMonthsRemaining = @CobraMonthsRemaining
                                        )
                                    AND ( @IsSocialSecurityDocumentationProvided IS NULL
                                          OR IsSocialSecurityDocumentationProvided = @IsSocialSecurityDocumentationProvided
                                        )
                                    AND ( @CobraEffectiveFromDate IS NULL
                                          OR CobraEffectiveFromDate = @CobraEffectiveFromDate
                                        )
                                    AND ( @CobraEffectiveToDate IS NULL
                                          OR CobraEffectiveToDate = @CobraEffectiveToDate
                                        )
                                    AND ( @CobraTypeId IS NULL
                                          OR CobraTypeId = @CobraTypeId
                                        )
                                    AND ( @IsSmoker IS NULL
                                          OR IsSmoker = @IsSmoker
                                        )
                                    AND ( @IsResponsibleParty IS NULL
                                          OR IsResponsibleParty = @IsResponsibleParty
                                        )
                                    AND ( @ReportingPreference IS NULL
                                          OR UwMember.ReportingPreference = @ReportingPreference
                                        )
                                    AND ( @RosterNumber IS NULL
                                          OR RoasterNumber = @RosterNumber
                                        )
                                    AND ( @MembershipNumber IS NULL
                                          OR MembershipNumber = @MembershipNumber
                                        )
                                    AND ( @StateCode IS NULL
                                          OR z.StateCode = @StateCode
                                        )
                                    AND ( @City IS NULL
                                          OR REPLACE(z.City, ' ', '') LIKE @City
                                          + '%'
                                        )
									 AND ( @IsGroupMember IS NULL
												  OR (@IsGroupMember = 0 AND (UwCustomer.MarketingSegmentId IN (6,7,13)))
												  OR (@IsGroupMember = 1 AND (UwCustomer.MarketingSegmentId IN (8,9,14) OR UwCustomer.MarketingSegmentId IS null))
										 )
                        ) InnerQuery
                WHERE   RowNum >= @LowerLimit
                        AND RowNum <= @UpperLimit
                        OR @PageSize IS NULL
                ORDER BY RowNum;
            END;
    END;




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Customers].[GetUnderwritingCustomersForManualMatch]
    @ExchangeAlternateID VARCHAR(50) = NULL,
    @UwCustomerId INT,
    @CustomerNumber VARCHAR(8),
    @Name VARCHAR(255),
    @Address1 VARCHAR(255),
    @Address2 VARCHAR(255),
    @ZipCode VARCHAR(5),
    @FederalTaxId VARCHAR(255),
    @SicId INT,
    @ContactName VARCHAR(255),
    @ContactPhone VARCHAR(20),
    @ContactFax VARCHAR(20),
    @ContactEmail VARCHAR(128),
    @MarketingSegmentId INT,
    @SalesAgentName VARCHAR(255),
    @SalesAgentAddress1 VARCHAR(255),
    @SalesAgentAddress2 VARCHAR(255),
    @SalesAgentZipCode VARCHAR(5),
    @SalesAgentPhone VARCHAR(20),
    @SalesAgentFax VARCHAR(20),
    @SalesAgentEmail VARCHAR(128),
    @SalesAgentId INT,
    @QuotingAgentId INT,
    @DoingBusinessAs VARCHAR(255),
    @CustomerStatusId TINYINT,
    @CustomerId INT,
    @IsNewCustomer BIT = NULL,
    @PageNumber INT = 1,
    @PageSize INT = NULL,
    @SortField VARCHAR(128) = NULL,
    @SortDirection VARCHAR(20) = NULL,
    @BillingName VARCHAR(255) = NULL,
    @BillingAddress1 VARCHAR(255) = NULL,
    @BillingAddress2 VARCHAR(255) = NULL,
    @BillingZipCode VARCHAR(5) = NULL,
    @NoEmployeesOnPayroll INT = NULL,
    @NoEmployeesOnPayrollLastUpdateDate DATETIME = NULL,
    @CustomerPreferenceInReceivingInvoicesTypeId TINYINT = NULL,
    @CustomerPreferenceInReceivingRenewalsAndLettersTypeId TINYINT = NULL,
	@StateCode VARCHAR(50) = NULL ,
    @City VARCHAR(50) = NULL
AS
BEGIN

    DECLARE @LowerLimit INT;
    DECLARE @UpperLimit INT;

	--SET @SalesAgentId = IIF(@SalesAgentId = 8694, -1, @SalesAgentId)
	--SET @QuotingAgentId = IIF(@QuotingAgentId = 8694, -1, @QuotingAgentId)

    SET @LowerLimit = (@PageNumber - 1) * @PageSize + 1;
    SET @UpperLimit = @PageNumber * @PageSize;

    SELECT COUNT(1) TotalRecords
    FROM Customers.[UwCustomer]
	LEFT JOIN dbo.ZipCode z ON z.ZipCode = UwCustomer.ZipCode
    WHERE (
              @UwCustomerId IS NULL
              OR UwCustomerId = @UwCustomerId
          )
          AND
          (
              @CustomerNumber IS NULL
              OR CustomerNumber = @CustomerNumber
          )
          AND
          (
              @Name IS NULL
              OR Name LIKE @Name + '%'
          )
          AND
          (
              @Address1 IS NULL
              OR Address1 LIKE @Address1 + '%'
          )
          AND
          (
              @Address2 IS NULL
              OR Address2 LIKE @Address2 + '%'
          )
          AND
          (
              @ExchangeAlternateID IS NULL
              OR ExchangeAlternateID = @ExchangeAlternateID
          )
          AND
          (
              @ZipCode IS NULL
              OR UwCustomer.ZipCode LIKE @ZipCode + '%'
          )
          AND
          (
              @FederalTaxId IS NULL
              OR FederalTaxId LIKE @FederalTaxId + '%'
          )
          AND
          (
              @SicId IS NULL
              OR SicId = @SicId
          )
          AND
          (
              @ContactName IS NULL
              OR ContactName LIKE @ContactName + '%'
          )
          AND
          (
              @ContactPhone IS NULL
              OR ContactPhone LIKE @ContactPhone + '%'
          )
          AND
          (
              @ContactFax IS NULL
              OR ContactFax LIKE @ContactFax + '%'
          )
          AND
          (
              @ContactEmail IS NULL
              OR ContactEmail LIKE @ContactEmail + '%'
          )
          AND
          (
              @MarketingSegmentId IS NULL
              OR MarketingSegmentId = @MarketingSegmentId
          )
          AND
          (
              @SalesAgentName IS NULL
              OR SalesAgentName LIKE @SalesAgentName + '%'
          )
          AND
          (
              @SalesAgentAddress1 IS NULL
              OR SalesAgentAddress1 LIKE @SalesAgentAddress1 + '%'
          )
          AND
          (
              @SalesAgentAddress2 IS NULL
              OR SalesAgentAddress2 LIKE @SalesAgentAddress2 + '%'
          )
          AND
          (
              @SalesAgentZipCode IS NULL
              OR SalesAgentZipCode LIKE @SalesAgentZipCode + '%'
          )
          AND
          (
              @SalesAgentPhone IS NULL
              OR SalesAgentPhone LIKE @SalesAgentPhone + '%'
          )
          AND
          (
              @SalesAgentFax IS NULL
              OR SalesAgentFax LIKE @SalesAgentFax + '%'
          )
          AND
          (
              @SalesAgentEmail IS NULL
              OR SalesAgentEmail LIKE @SalesAgentEmail + '%'
          )
          AND
          (
              @SalesAgentId IS NULL
              OR SalesAgentId = @SalesAgentId
          )
          AND
          (
              @QuotingAgentId IS NULL
              OR QuotingAgentId = @QuotingAgentId
          )
          AND
          (
              @DoingBusinessAs IS NULL
              OR DoingBusinessAs LIKE @DoingBusinessAs + '%'
          )
          AND
          (
              @CustomerStatusId IS NULL
              OR CustomerStatusId = @CustomerStatusId
          )
          AND
          (
              @CustomerId IS NULL
              OR CustomerId = @CustomerId
          )
          AND
          (
              @BillingName IS NULL
              OR BillingName LIKE @BillingName + '%'
          )
          AND
          (
              @BillingAddress1 IS NULL
              OR BillingAddress1 LIKE @BillingAddress1 + '%'
          )
          AND
          (
              @BillingAddress2 IS NULL
              OR BillingAddress2 LIKE @BillingAddress2 + '%'
          )
          AND
          (
              @BillingZipCode IS NULL
              OR BillingZipCode LIKE @BillingZipCode + '%'
          )
          AND
          (
              @NoEmployeesOnPayroll IS NULL
              OR NoEmployeesOnPayroll = @NoEmployeesOnPayroll
          )
          AND
          (
              @NoEmployeesOnPayrollLastUpdateDate IS NULL
              OR NoEmployeesOnPayrollLastUpdateDate = @NoEmployeesOnPayrollLastUpdateDate
          )
          AND
          (
              @IsNewCustomer IS NULL
              OR IsNewCustomer = @IsNewCustomer
          )
          AND
          (
              @CustomerPreferenceInReceivingInvoicesTypeId IS NULL
              OR CustomerPreferenceInReceivingInvoicesTypeId = @CustomerPreferenceInReceivingInvoicesTypeId
          )
		  AND
          (
              @CustomerPreferenceInReceivingRenewalsAndLettersTypeId IS NULL
              OR CustomerPreferenceInReceivingRenewalsAndLettersTypeId = @CustomerPreferenceInReceivingRenewalsAndLettersTypeId
          )

		  AND ( @StateCode IS NULL
				OR z.StateCode = @StateCode
			)
		  AND ( @City IS NULL
				OR REPLACE(z.City, ' ', '') LIKE @City + '%'
			)

    IF ISNULL(@SortDirection, 'Ascending') = 'Ascending'
    BEGIN
        SELECT UwCustomerId,
               CustomerNumber,
               Name,
               Address1,
               Address2,
               ExchangeAlternateID,
               ZipCode,
               FederalTaxId,
               SicId,
               ContactName,
               ContactPhone,
               ContactFax,
               ContactEmail,
               MarketingSegmentId,
               SalesAgentName,
               SalesAgentAddress1,
               SalesAgentAddress2,
               SalesAgentZipCode,
               SalesAgentPhone,
               SalesAgentFax,
               SalesAgentEmail,
               SalesAgentId,
               QuotingAgentId,
               DoingBusinessAs,
               CustomerStatusId,
               CustomerId,
               DateCompanyFormed,
               MailToId,
               BillingName,
               BillingAddress1,
               BillingAddress2,
               BillingZipCode,
               ReportingPreference,
               NoEmployeesOnPayroll,
               NetMonths,
               AllowAgentCATs,
               NoEmployeesOnPayrollLastUpdateDate,
               IsNewCustomer,
               CustomerPreferenceInReceivingInvoicesTypeId,
               ReportMembersByDivision,
			   CustomerPreferenceInReceivingRenewalsAndLettersTypeId,
			   OptOutOfEmailNotification
        FROM
        (
            SELECT UwCustomerId,
                   CustomerNumber,
                   Name,
                   Address1,
                   Address2,
                   ExchangeAlternateID,
                   UwCustomer.ZipCode,
                   FederalTaxId,
                   SicId,
                   ContactName,
                   ContactPhone,
                   ContactFax,
                   ContactEmail,
                   MarketingSegmentId,
                   SalesAgentName,
                   SalesAgentAddress1,
                   SalesAgentAddress2,
                   SalesAgentZipCode,
                   SalesAgentPhone,
                   SalesAgentFax,
                   SalesAgentEmail,
                   SalesAgentId,
                   QuotingAgentId,
                   DoingBusinessAs,
                   CustomerStatusId,
                   CustomerId,
                   DateCompanyFormed,
                   MailToId,
                   BillingName,
                   BillingAddress1,
                   BillingAddress2,
                   BillingZipCode,
                   ReportingPreference,
                   NoEmployeesOnPayroll,
                   NoEmployeesOnPayrollLastUpdateDate,
                   NetMonths,
                   AllowAgentCATs,
                   IsNewCustomer,
                   CustomerPreferenceInReceivingInvoicesTypeId,
                   ReportMembersByDivision,
				   CustomerPreferenceInReceivingRenewalsAndLettersTypeId,
				   OptOutOfEmailNotification,
                   CASE ISNULL(@SortField, 'Default')
                       WHEN 'Default' THEN
                           ROW_NUMBER() OVER (ORDER BY UwCustomerId ASC)
                       WHEN 'UwCustomerId' THEN
                           ROW_NUMBER() OVER (ORDER BY UwCustomerId ASC)
                       WHEN 'CustomerNumber' THEN
                           ROW_NUMBER() OVER (ORDER BY CustomerNumber ASC)
                       WHEN 'Name' THEN
                           ROW_NUMBER() OVER (ORDER BY Name ASC)
                       WHEN 'Address1' THEN
                           ROW_NUMBER() OVER (ORDER BY Address1 ASC)
                       WHEN 'Address2' THEN
                           ROW_NUMBER() OVER (ORDER BY Address2 ASC)
                       WHEN 'ExchangeAlternateID' THEN
                           ROW_NUMBER() OVER (ORDER BY ExchangeAlternateID ASC)
                       WHEN 'ZipCode' THEN
                           ROW_NUMBER() OVER (ORDER BY UwCustomer.ZipCode ASC)
                       WHEN 'FederalTaxId' THEN
                           ROW_NUMBER() OVER (ORDER BY FederalTaxId ASC)
                       WHEN 'SicId' THEN
                           ROW_NUMBER() OVER (ORDER BY SicId ASC)
                       WHEN 'ContactName' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactName ASC)
                       WHEN 'ContactPhone' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactPhone ASC)
                       WHEN 'ContactFax' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactFax ASC)
                       WHEN 'ContactEmail' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactEmail ASC)
                       WHEN 'MarketingSegmentId' THEN
                           ROW_NUMBER() OVER (ORDER BY MarketingSegmentId ASC)
                       WHEN 'SalesAgentName' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentName ASC)
                       WHEN 'SalesAgentAddress1' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentAddress1 ASC)
                       WHEN 'SalesAgentAddress2' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentAddress2 ASC)
                       WHEN 'SalesAgentZipCode' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentZipCode ASC)
                       WHEN 'SalesAgentPhone' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentPhone ASC)
                       WHEN 'SalesAgentFax' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentFax ASC)
                       WHEN 'SalesAgentEmail' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentEmail ASC)
                       WHEN 'SalesAgentId' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentId ASC)
                       WHEN 'QuotingAgentId' THEN
                           ROW_NUMBER() OVER (ORDER BY QuotingAgentId ASC)
                       WHEN 'DoingBusinessAs' THEN
                           ROW_NUMBER() OVER (ORDER BY DoingBusinessAs ASC)
                       WHEN 'CustomerStatusId' THEN
                           ROW_NUMBER() OVER (ORDER BY CustomerStatusId ASC)
                       WHEN 'CustomerId' THEN
                           ROW_NUMBER() OVER (ORDER BY CustomerId ASC)
                       WHEN 'BillingName' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingName ASC)
                       WHEN 'BillingAddress1' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingAddress1 ASC)
                       WHEN 'BillingAddress2' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingAddress2 ASC)
                       WHEN 'BillingZipCode' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingZipCode ASC)
                       WHEN 'NoEmployeesOnPayroll' THEN
                           ROW_NUMBER() OVER (ORDER BY NoEmployeesOnPayroll ASC)
                       WHEN 'NoEmployeesOnPayrollLastUpdateDate' THEN
                           ROW_NUMBER() OVER (ORDER BY NoEmployeesOnPayrollLastUpdateDate ASC)
                       WHEN 'IsNewCustomer' THEN
                           ROW_NUMBER() OVER (ORDER BY IsNewCustomer ASC)
                   END AS RowNum
            FROM Customers.[UwCustomer]
			LEFT JOIN dbo.ZipCode z ON z.ZipCode = UwCustomer.ZipCode
            WHERE (
                      @UwCustomerId IS NULL
                      OR UwCustomerId = @UwCustomerId
                  )
                  AND
                  (
                      @CustomerNumber IS NULL
                      OR CustomerNumber = @CustomerNumber
                  )
                  AND
                  (
                      @Name IS NULL
                      OR Name LIKE @Name + '%'
                  )
                  AND
                  (
                      @Address1 IS NULL
                      OR Address1 LIKE @Address1 + '%'
                  )
                  AND
                  (
                      @Address2 IS NULL
                      OR Address2 LIKE @Address2 + '%'
                  )
                  AND
                  (
                      @ExchangeAlternateID IS NULL
                      OR ExchangeAlternateID = @ExchangeAlternateID
                  )
                  AND
                  (
                      @ZipCode IS NULL
                      OR UwCustomer.ZipCode LIKE @ZipCode + '%'
                  )
                  AND
                  (
                      @FederalTaxId IS NULL
                      OR FederalTaxId LIKE @FederalTaxId + '%'
                  )
                  AND
                  (
                      @SicId IS NULL
                      OR SicId = @SicId
                  )
                  AND
                  (
                      @ContactName IS NULL
                      OR ContactName LIKE @ContactName + '%'
                  )
                  AND
                  (
                      @ContactPhone IS NULL
                      OR ContactPhone LIKE @ContactPhone + '%'
                  )
                  AND
                  (
                      @ContactFax IS NULL
                      OR ContactFax LIKE @ContactFax + '%'
                  )
                  AND
                  (
                      @ContactEmail IS NULL
                      OR ContactEmail LIKE @ContactEmail + '%'
                  )
                  AND
                  (
                      @MarketingSegmentId IS NULL
                      OR MarketingSegmentId = @MarketingSegmentId
                  )
                  AND
                  (
                      @SalesAgentName IS NULL
                      OR SalesAgentName LIKE @SalesAgentName + '%'
                  )
                  AND
                  (
                      @SalesAgentAddress1 IS NULL
                      OR SalesAgentAddress1 LIKE @SalesAgentAddress1 + '%'
                  )
                  AND
                  (
                      @SalesAgentAddress2 IS NULL
                      OR SalesAgentAddress2 LIKE @SalesAgentAddress2 + '%'
                  )
                  AND
                  (
                      @SalesAgentZipCode IS NULL
                      OR SalesAgentZipCode LIKE @SalesAgentZipCode + '%'
                  )
                  AND
                  (
                      @SalesAgentPhone IS NULL
                      OR SalesAgentPhone LIKE @SalesAgentPhone + '%'
                  )
                  AND
                  (
                      @SalesAgentFax IS NULL
                      OR SalesAgentFax LIKE @SalesAgentFax + '%'
                  )
                  AND
                  (
                      @SalesAgentEmail IS NULL
                      OR SalesAgentEmail LIKE @SalesAgentEmail + '%'
                  )
                  AND
                  (
                      @SalesAgentId IS NULL
                      OR SalesAgentId = @SalesAgentId
                  )
                  AND
                  (
                      @QuotingAgentId IS NULL
                      OR QuotingAgentId = @QuotingAgentId
                  )
                  AND
                  (
                      @DoingBusinessAs IS NULL
                      OR DoingBusinessAs LIKE @DoingBusinessAs + '%'
                  )
                  AND
                  (
                      @CustomerStatusId IS NULL
                      OR CustomerStatusId = @CustomerStatusId
                  )
                  AND
                  (
                      @CustomerId IS NULL
                      OR CustomerId = @CustomerId
                  )
                  AND
                  (
                      @BillingName IS NULL
                      OR BillingName LIKE @BillingName + '%'
                  )
                  AND
                  (
                      @BillingAddress1 IS NULL
                      OR BillingAddress1 LIKE @BillingAddress1 + '%'
                  )
                  AND
                  (
                      @BillingAddress2 IS NULL
                      OR BillingAddress2 LIKE @BillingAddress2 + '%'
                  )
                  AND
                  (
                      @BillingZipCode IS NULL
                      OR BillingZipCode LIKE @BillingZipCode + '%'
                  )
                  AND
                  (
                      @NoEmployeesOnPayroll IS NULL
                      OR NoEmployeesOnPayroll = @NoEmployeesOnPayroll
                  )
                  AND
                  (
                      @NoEmployeesOnPayrollLastUpdateDate IS NULL
                      OR NoEmployeesOnPayrollLastUpdateDate = @NoEmployeesOnPayrollLastUpdateDate
                  )
                  AND
                  (
                      @IsNewCustomer IS NULL
                      OR IsNewCustomer = @IsNewCustomer
                  )
                  AND
                  (
                      @CustomerPreferenceInReceivingInvoicesTypeId IS NULL
                      OR CustomerPreferenceInReceivingInvoicesTypeId = @CustomerPreferenceInReceivingInvoicesTypeId
                  )
				  AND
				  (
					  @CustomerPreferenceInReceivingRenewalsAndLettersTypeId IS NULL
					  OR CustomerPreferenceInReceivingRenewalsAndLettersTypeId = @CustomerPreferenceInReceivingRenewalsAndLettersTypeId
				  )
				   AND ( @StateCode IS NULL
						OR z.StateCode = @StateCode
					)
				  AND ( @City IS NULL
						OR REPLACE(z.City, ' ', '') LIKE @City + '%'
					)
        ) InnerQuery
        WHERE RowNum >= @LowerLimit
              AND RowNum <= @UpperLimit
              OR @PageSize IS NULL
        ORDER BY RowNum;
    END;
    ELSE
    BEGIN
        SELECT UwCustomerId,
               CustomerNumber,
               Name,
               Address1,
               Address2,
               ExchangeAlternateID,
               ZipCode,
               FederalTaxId,
               SicId,
               ContactName,
               ContactPhone,
               ContactFax,
               ContactEmail,
               MarketingSegmentId,
               SalesAgentName,
               SalesAgentAddress1,
               SalesAgentAddress2,
               SalesAgentZipCode,
               SalesAgentPhone,
               SalesAgentFax,
               SalesAgentEmail,
               SalesAgentId,
               QuotingAgentId,
               DoingBusinessAs,
               CustomerStatusId,
               CustomerId,
               DateCompanyFormed,
               MailToId,
               BillingName,
               BillingAddress1,
               BillingAddress2,
               BillingZipCode,
               ReportingPreference,
               NoEmployeesOnPayroll,
               NetMonths,
               AllowAgentCATs,
               NoEmployeesOnPayrollLastUpdateDate,
               IsNewCustomer,
               CustomerPreferenceInReceivingInvoicesTypeId,
               ReportMembersByDivision,
			   CustomerPreferenceInReceivingRenewalsAndLettersTypeId,
			   OptOutOfEmailNotification
        FROM
        (
            SELECT UwCustomerId,
                   CustomerNumber,
                   Name,
                   Address1,
                   Address2,
                   ExchangeAlternateID,
                   UwCustomer.ZipCode,
                   FederalTaxId,
                   SicId,
                   ContactName,
                   ContactPhone,
                   ContactFax,
                   ContactEmail,
                   MarketingSegmentId,
                   SalesAgentName,
                   SalesAgentAddress1,
                   SalesAgentAddress2,
                   SalesAgentZipCode,
                   SalesAgentPhone,
                   SalesAgentFax,
                   SalesAgentEmail,
                   SalesAgentId,
                   QuotingAgentId,
                   DoingBusinessAs,
                   CustomerStatusId,
                   CustomerId,
                   DateCompanyFormed,
                   MailToId,
                   BillingName,
                   BillingAddress1,
                   BillingAddress2,
                   BillingZipCode,
                   ReportingPreference,
                   NoEmployeesOnPayroll,
                   NoEmployeesOnPayrollLastUpdateDate,
                   NetMonths,
                   AllowAgentCATs,
                   IsNewCustomer,
                   CustomerPreferenceInReceivingInvoicesTypeId,
                   ReportMembersByDivision,
				   CustomerPreferenceInReceivingRenewalsAndLettersTypeId,
				   OptOutOfEmailNotification,
                   CASE ISNULL(@SortField, 'Default')
                       WHEN 'Default' THEN
                           ROW_NUMBER() OVER (ORDER BY UwCustomerId DESC)
                       WHEN 'UwCustomerId' THEN
                           ROW_NUMBER() OVER (ORDER BY UwCustomerId DESC)
                       WHEN 'CustomerNumber' THEN
                           ROW_NUMBER() OVER (ORDER BY CustomerNumber DESC)
                       WHEN 'Name' THEN
                           ROW_NUMBER() OVER (ORDER BY Name DESC)
                       WHEN 'Address1' THEN
                           ROW_NUMBER() OVER (ORDER BY Address1 DESC)
                       WHEN 'Address2' THEN
                           ROW_NUMBER() OVER (ORDER BY Address2 DESC)
                       WHEN 'ExchangeAlternateID' THEN
                           ROW_NUMBER() OVER (ORDER BY ExchangeAlternateID DESC)
                       WHEN 'ZipCode' THEN
                           ROW_NUMBER() OVER (ORDER BY UwCustomer.ZipCode DESC)
                       WHEN 'FederalTaxId' THEN
                           ROW_NUMBER() OVER (ORDER BY FederalTaxId DESC)
                       WHEN 'SicId' THEN
                           ROW_NUMBER() OVER (ORDER BY SicId DESC)
                       WHEN 'ContactName' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactName DESC)
                       WHEN 'ContactPhone' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactPhone DESC)
                       WHEN 'ContactFax' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactFax DESC)
                       WHEN 'ContactEmail' THEN
                           ROW_NUMBER() OVER (ORDER BY ContactEmail DESC)
                       WHEN 'MarketingSegmentId' THEN
                           ROW_NUMBER() OVER (ORDER BY MarketingSegmentId DESC)
                       WHEN 'SalesAgentName' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentName DESC)
                       WHEN 'SalesAgentAddress1' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentAddress1 DESC)
                       WHEN 'SalesAgentAddress2' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentAddress2 DESC)
                       WHEN 'SalesAgentZipCode' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentZipCode DESC)
                       WHEN 'SalesAgentPhone' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentPhone DESC)
                       WHEN 'SalesAgentFax' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentFax DESC)
                       WHEN 'SalesAgentEmail' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentEmail DESC)
                       WHEN 'SalesAgentId' THEN
                           ROW_NUMBER() OVER (ORDER BY SalesAgentId DESC)
                       WHEN 'QuotingAgentId' THEN
                           ROW_NUMBER() OVER (ORDER BY QuotingAgentId DESC)
                       WHEN 'DoingBusinessAs' THEN
                           ROW_NUMBER() OVER (ORDER BY DoingBusinessAs DESC)
                       WHEN 'CustomerStatusId' THEN
                           ROW_NUMBER() OVER (ORDER BY CustomerStatusId DESC)
                       WHEN 'CustomerId' THEN
                           ROW_NUMBER() OVER (ORDER BY CustomerId DESC)
                       WHEN 'BillingName' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingName DESC)
                       WHEN 'BillingAddress1' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingAddress1 DESC)
                       WHEN 'BillingAddress2' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingAddress2 DESC)
                       WHEN 'BillingZipCode' THEN
                           ROW_NUMBER() OVER (ORDER BY BillingZipCode DESC)
                       WHEN 'NoEmployeesOnPayroll' THEN
                           ROW_NUMBER() OVER (ORDER BY NoEmployeesOnPayroll DESC)
                       WHEN 'NoEmployeesOnPayrollLastUpdateDate' THEN
                           ROW_NUMBER() OVER (ORDER BY NoEmployeesOnPayrollLastUpdateDate DESC)
                       WHEN 'IsNewCustomer' THEN
                           ROW_NUMBER() OVER (ORDER BY IsNewCustomer DESC)
                   END AS RowNum
            FROM Customers.[UwCustomer]
			LEFT JOIN dbo.ZipCode z ON z.ZipCode = UwCustomer.ZipCode
            WHERE (
                      @UwCustomerId IS NULL
                      OR UwCustomerId = @UwCustomerId
                  )
                  AND
                  (
                      @CustomerNumber IS NULL
                      OR CustomerNumber = @CustomerNumber
                  )
                  AND
                  (
                      @Name IS NULL
                      OR Name LIKE @Name + '%'
                  )
                  AND
                  (
                      @Address1 IS NULL
                      OR Address1 LIKE @Address1 + '%'
                  )
                  AND
                  (
                      @Address2 IS NULL
                      OR Address2 LIKE @Address2 + '%'
                  )
                  AND
                  (
                      @ExchangeAlternateID IS NULL
                      OR ExchangeAlternateID = @ExchangeAlternateID
                  )
                  AND
                  (
                      @ZipCode IS NULL
                      OR UwCustomer.ZipCode LIKE @ZipCode + '%'
                  )
                  AND
                  (
                      @FederalTaxId IS NULL
                      OR FederalTaxId LIKE @FederalTaxId + '%'
                  )
                  AND
                  (
                      @SicId IS NULL
                      OR SicId = @SicId
                  )
                  AND
                  (
                      @ContactName IS NULL
                      OR ContactName LIKE @ContactName + '%'
                  )
                  AND
                  (
                      @ContactPhone IS NULL
                      OR ContactPhone LIKE @ContactPhone + '%'
                  )
                  AND
                  (
                      @ContactFax IS NULL
                      OR ContactFax LIKE @ContactFax + '%'
                  )
                  AND
                  (
                      @ContactEmail IS NULL
                      OR ContactEmail LIKE @ContactEmail + '%'
                  )
                  AND
                  (
                      @MarketingSegmentId IS NULL
                      OR MarketingSegmentId = @MarketingSegmentId
                  )
                  AND
                  (
                      @SalesAgentName IS NULL
                      OR SalesAgentName LIKE @SalesAgentName + '%'
                  )
                  AND
                  (
                      @SalesAgentAddress1 IS NULL
                      OR SalesAgentAddress1 LIKE @SalesAgentAddress1 + '%'
                  )
                  AND
                  (
                      @SalesAgentAddress2 IS NULL
                      OR SalesAgentAddress2 LIKE @SalesAgentAddress2 + '%'
                  )
                  AND
                  (
                      @SalesAgentZipCode IS NULL
                      OR SalesAgentZipCode LIKE @SalesAgentZipCode + '%'
                  )
                  AND
                  (
                      @SalesAgentPhone IS NULL
                      OR SalesAgentPhone LIKE @SalesAgentPhone + '%'
                  )
                  AND
                  (
                      @SalesAgentFax IS NULL
                      OR SalesAgentFax LIKE @SalesAgentFax + '%'
                  )
                  AND
                  (
                      @SalesAgentEmail IS NULL
                      OR SalesAgentEmail LIKE @SalesAgentEmail + '%'
                  )
                  AND
                  (
                      @SalesAgentId IS NULL
                      OR SalesAgentId = @SalesAgentId
                  )
                  AND
                  (
                      @QuotingAgentId IS NULL
                      OR QuotingAgentId = @QuotingAgentId
                  )
                  AND
                  (
                      @DoingBusinessAs IS NULL
                      OR DoingBusinessAs LIKE @DoingBusinessAs + '%'
                  )
                  AND
                  (
                      @CustomerStatusId IS NULL
                      OR CustomerStatusId = @CustomerStatusId
                  )
                  AND
                  (
                      @CustomerId IS NULL
                      OR CustomerId = @CustomerId
                  )
                  AND
                  (
                      @BillingName IS NULL
                      OR BillingName LIKE @BillingName + '%'
                  )
                  AND
                  (
                      @BillingAddress1 IS NULL
                      OR BillingAddress1 LIKE @BillingAddress1 + '%'
                  )
                  AND
                  (
                      @BillingAddress2 IS NULL
                      OR BillingAddress2 LIKE @BillingAddress2 + '%'
                  )
                  AND
                  (
                      @BillingZipCode IS NULL
                      OR BillingZipCode LIKE @BillingZipCode + '%'
                  )
                  AND
                  (
                      @NoEmployeesOnPayroll IS NULL
                      OR NoEmployeesOnPayroll = @NoEmployeesOnPayroll
                  )
                  AND
                  (
                      @NoEmployeesOnPayrollLastUpdateDate IS NULL
                      OR NoEmployeesOnPayrollLastUpdateDate = @NoEmployeesOnPayrollLastUpdateDate
                  )
                  AND
                  (
                      @IsNewCustomer IS NULL
                      OR IsNewCustomer = @IsNewCustomer
                  )
                  AND
                  (
                      @CustomerPreferenceInReceivingInvoicesTypeId IS NULL
                      OR CustomerPreferenceInReceivingInvoicesTypeId = @CustomerPreferenceInReceivingInvoicesTypeId
                  )
				  AND
				  (
					  @CustomerPreferenceInReceivingRenewalsAndLettersTypeId IS NULL
					  OR CustomerPreferenceInReceivingRenewalsAndLettersTypeId = @CustomerPreferenceInReceivingRenewalsAndLettersTypeId
				  )
				  AND ( @StateCode IS NULL
                      OR z.StateCode = @StateCode
                    )
                 AND ( @City IS NULL
                      OR REPLACE(z.City, ' ', '') LIKE @City + '%'
                    )
        ) InnerQuery
        WHERE RowNum >= @LowerLimit
              AND RowNum <= @UpperLimit
              OR @PageSize IS NULL
        ORDER BY RowNum;
    END;

END;





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Finance].[GetUwMembersForACHReturnReconciliation]
    @FirstName VARCHAR(50) = NULL,
    @LastName VARCHAR(50) = NULL,
    @MemberNumber VARCHAR(22) = NULL,
    @RoutingNumber VARCHAR(22) = NULL,
    @AccountNumber VARCHAR(22) = NULL,
    @CheckSpouse BIT = 0,
    @Premium MONEY = NULL,
	@IsGroupMember BIT = 0
AS
BEGIN
    SELECT um.UwMemberId AS UnderwritingMemberId,
           um.MemberNumber AS PrimaryNumber,
           um.MembershipNumber AS MembershipNumber,
           um.LastName + ' ' + um.FirstName AS PrimaryName,
           Spouse.SpouseName AS SpouseName,
           aa.AbaNumber AS RoutingNumber,
           aa.AccountNumber AS AccountNumber,
           TransactionAmount.Amount AS Premium,
           ms.Code AS [Status],
           uc.Name AS CustomerName
    FROM Customers.UwMember AS um
        JOIN Customers.UwCustomer AS uc
            ON uc.UwCustomerId = um.UwCustomerId
        JOIN Finance.Account AS a
            ON a.UwMemberId = um.UwMemberId
		JOIN Customers.MemberStatus AS ms
			ON ms.MemberStatusId = um.MemberStatusId
        JOIN Finance.ACHAccount AS aa
            ON aa.AccountId = a.AccountId
        OUTER APPLY
    (
        SELECT TOP 1
               aat.Amount
        FROM Finance.ACHAccountTransaction AS aat
        WHERE aat.ACHAccountId = aa.ACHAccountId
        ORDER BY aat.ScheduleDate DESC
    ) TransactionAmount
        OUTER APPLY
    (
        SELECT TOP 1
               umd.LastName + ' ' + umd.FirstName AS SpouseName
        FROM Customers.UwMemberDependent AS umd
        WHERE umd.UwMemberId = um.UwMemberId
              AND umd.Relation = 'Spouse'
             -- AND @CheckSpouse = 1
        ORDER BY umd.UwMemberDependentId DESC
    ) Spouse
    WHERE (
              @FirstName IS NULL
              OR FirstName LIKE @FirstName + '%'
          )
          AND
          (
              @LastName IS NULL
              OR LastName LIKE @LastName + '%'
          )
          AND
          (
              @MemberNumber IS NULL
              OR um.MemberNumber LIKE @MemberNumber
          )
          AND
          (
              @RoutingNumber IS NULL
              OR aa.AbaNumber = @RoutingNumber
          )
          AND
          (
              @AccountNumber IS NULL
              OR SUBSTRING(@AccountNumber, PATINDEX('%[^0]%', @AccountNumber + '.'), LEN(@AccountNumber)) = SUBSTRING(
                                                                                                                         aa.AccountNumber,
                                                                                                                         PATINDEX(
                                                                                                                                     '%[^0]%',
                                                                                                                                     aa.AccountNumber
                                                                                                                                     + '.'
                                                                                                                                 ),
                                                                                                                         LEN(aa.AccountNumber)
                                                                                                                     )
          )
          AND
          (
              @Premium IS NULL
              OR TransactionAmount.Amount = @Premium
          )
          AND
          ( @CheckSpouse = 0 OR EXISTS
				 (
					SELECT 1
					FROM Customers.UwMemberDependent AS umd2
					WHERE umd2.UwMemberId = um.UwMemberId
					AND umd2.Relation = 'Spouse'
				)
          )
		AND ( @IsGroupMember IS NULL
			OR (@IsGroupMember = 0 AND (uc.MarketingSegmentId IN (6,7,13)))
			OR (@IsGroupMember = 1 AND (uc.MarketingSegmentId IN (8,9,14) OR uc.MarketingSegmentId IS null))
		);
END;







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Finance].[GetUwCustomersForACHReturnReconciliation]
    @CustomerNumber VARCHAR(22) = NULL,
    @CustomerName VARCHAR(50) = NULL,
    @RoutingNumber VARCHAR(22) = NULL,
    @AccountNumber VARCHAR(22) = NULL,
    @Premium MONEY = NULL
AS
BEGIN
    SELECT uc.UwCustomerId AS UnderwritingCustomerId,
           uc.CustomerNumber AS CustomerNumber,
           uc.[Name] AS CustomerName,
           aa.AbaNumber AS RoutingNumber,
           aa.AccountNumber AS AccountNumber,
           TransactionAmount.Amount AS Premium,
           cs.[Name] AS [Status]
          
    FROM   Customers.UwCustomer AS uc
        JOIN Finance.Account AS a
            ON a.UwCustomerId = uc.UwCustomerId
		JOIN Customers.CustomerStatus AS cs
			ON cs.CustomerStatusId = uc.CustomerStatusId
        JOIN Finance.ACHAccount AS aa
            ON aa.AccountId = a.AccountId
        OUTER APPLY
    (
        SELECT TOP 1
               aat.Amount
        FROM Finance.ACHAccountTransaction AS aat
        WHERE aat.ACHAccountId = aa.ACHAccountId
        ORDER BY aat.ScheduleDate DESC
    ) TransactionAmount
      
    WHERE 
	      (
              @CustomerNumber IS NULL
              OR uc.CustomerNumber = @CustomerNumber 
          )
		  and
	     (
              @CustomerName IS NULL
              OR uc.[Name] LIKE @CustomerName + '%'
          )
         
          AND
          (
              @RoutingNumber IS NULL
              OR aa.AbaNumber = @RoutingNumber
          )
          AND
          (
              @AccountNumber IS NULL
              OR SUBSTRING(@AccountNumber, PATINDEX('%[^0]%', @AccountNumber + '.'), LEN(@AccountNumber)) = SUBSTRING(
                                                                                                                         aa.AccountNumber,
                                                                                                                         PATINDEX(
                                                                                                                                     '%[^0]%',
                                                                                                                                     aa.AccountNumber
                                                                                                                                     + '.'
                                                                                                                                 ),
                                                                                                                         LEN(aa.AccountNumber)
                                                                                                                     )
          )
          AND
          (
              @Premium IS NULL
              OR TransactionAmount.Amount = @Premium
          )
          
END;







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [Finance].[GetAgenciesForACHReturnReconciliation]
    @AgencyNumber VARCHAR(22) = NULL,
    @AgencyName VARCHAR(50) = NULL,
    @RoutingNumber VARCHAR(22) = NULL,
    @AccountNumber VARCHAR(22) = NULL,
    @Premium MONEY = NULL
AS
BEGIN
    SELECT Agency.AgencyId AS AgencyId,
           CAST(Agency.AgencyId AS VARCHAR(50)) AS AgencyNumber,
           Agency.[Name] AS AgencyName,
           aa.AbaNumber AS RoutingNumber,
           aa.AccountNumber AS AccountNumber,
           TransactionAmount.Amount AS Premium,
		   CASE WHEN Agency.IsTerminated = 1 THEN 'Terminated' ELSE 'Active' END  [Status]
          
    FROM   Quoting.Agency AS Agency
        JOIN Finance.Account AS a
            ON a.AgencyId = Agency.AgencyId
        JOIN Finance.ACHAccount AS aa
            ON aa.AccountId = a.AccountId
        OUTER APPLY
    (
        SELECT TOP 1
               aat.Amount
        FROM Finance.ACHAccountTransaction AS aat
        WHERE aat.ACHAccountId = aa.ACHAccountId
        ORDER BY aat.ScheduleDate DESC
    ) TransactionAmount
      
    WHERE 
	      (
              @AgencyNumber IS NULL
              OR CAST(Agency.AgencyId AS VARCHAR(22)) = @AgencyNumber 
          )
		  AND
	     (
              @AgencyName IS NULL
              OR Agency.[Name] LIKE @AgencyName + '%'
          )
         
          AND
          (
              @RoutingNumber IS NULL
              OR aa.AbaNumber = @RoutingNumber
          )
          AND
          (
              @AccountNumber IS NULL
              OR SUBSTRING(@AccountNumber, PATINDEX('%[^0]%', @AccountNumber + '.'), LEN(@AccountNumber)) = SUBSTRING(
                                                                                                                         aa.AccountNumber,
                                                                                                                         PATINDEX(
                                                                                                                                     '%[^0]%',
                                                                                                                                     aa.AccountNumber
                                                                                                                                     + '.'
                                                                                                                                 ),
                                                                                                                         LEN(aa.AccountNumber)
                                                                                                                     )
          )
          AND
          (
              @Premium IS NULL
              OR TransactionAmount.Amount = @Premium
          )
          
END;







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ahmed Elgendy>
-- Create date: <2023-02-22>
-- Description:	<Getting and searching Transaction Log which is data of ACH enrolled accounts>
-- =============================================
CREATE PROCEDURE [Finance].[GetACHTransactionLogById]
 @ACHTransactionLogId INT
AS
BEGIN

	 SELECT [ACHTransactionLogId]
      ,[DateTimeStamp]
      ,[OrganizationId]
      ,[InsuredType]
      ,[GroupMemberNumber]
      ,[HIASPrimaryNumber]
      ,[FirstName]
      ,[LastName]
      ,[CompanyName]
      ,[HIASCustomerNumber]
	  ,[dbo].[GetPhoneFormatted]([PhoneNumber]) PhoneNumber
      ,[EmailAddress]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[State]
      ,[ZIPCode]
      ,[ContactName]
      ,[AccountName]
      ,[CheckingSaving]
      ,[BankRoutingNumber]
      ,[BankAccountNumber]
      ,[RecurringPayments]
      ,[RecurringStartDate]
      ,[OneTimePayment]
      ,[OneTimeAmount]
      ,[OneTimeDate]
	  ,[Signature]
	  ,[IPAddress]
      ,[ErrorCorrection]
      ,[ValidationTimeStamp]
      ,[ValidationStatus]
      ,[ErrorState]
      ,[ErrorZIPCode]
      ,[ErrorBankRoutingNumber]
      ,[ErrorGeneral]
	  ,[EmailConfirmationDateTime]
      ,[HIASExportDateTime]
      ,[OnlineACHReconciliationId]
  FROM [CC].[ACHTransactionLog]
  WHERE ACHTransactionLogId = @ACHTransactionLogId
   
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Finance].[UpdateACHReturnReconciliation]
    @ACHReturnReconciliationID INT,
    @Status varchar(1) = NULL,
	@FileID varchar(100) = NULL ,
	@TraceNumber varchar(100) = NULL ,
	@BatchNumber varchar(100) = NULL ,
	@EntryDescription varchar(100) = NULL ,
	@SEC varchar(10) = NULL,
	@EffectiveDate DATETIME = NULL,
    @PrimaryNumber varchar(22) = NULL,
	@LastName varchar(100) = NULL,
	@FirstName varchar(100) = NULL,
	@RoutingNumber varchar(100) = NULL,
	@AccountNumber varchar(100) = NULL,
	@TransactionCode varchar(100) = NULL,
	@ChangeCode varchar(10) = NULL,
	@Change varchar(100) = NULL,
	@ChangeFrom  varchar(100) = NULL,
	@ChangeTo varchar(100) = NULL,
	@ReturnCode varchar(10) = NULL,
	@ReturnReason  varchar(100) = NULL,
	@Amount MONEY = NULL,
	@Comment varchar(100) = NULL,
	@CreationDate  DATETIME = NULL,
	@CreatedBy varchar(100) = NULL,
	@MatchingUwMemberId INT = NULL,
	@MatchingAgencyId INT = NULL,
	@MatchingRule  varchar(100) = NULL,
	@MatchingDate DATETIME = NULL,
	@MatchingAccountId INT = NULL,
	@ManualMatchingUserName VARCHAR(100) = NULL,
	@RoutingNumberCorrectionUserName VARCHAR(100) = NULL,
	@RoutingNumberCorrectionDate DATETIME = NULL,
	@HIASPrimaryMemberNumber varchar(100) = NULL,
	@HIASPrimaryMembershipNumber varchar(100) = NULL,
	@MatchingUwCustomerId INT = NULL,
	@HIASCustomerNumber varchar(100) = NULL

AS 
    BEGIN 
        SET NOCOUNT ON;

        BEGIN TRY
        
            UPDATE  Finance.ACHReturnReconciliation
            SET     Status = @Status ,
			        FileID = @FileID,
					TraceNumber = @TraceNumber,
					BatchNumber = @BatchNumber,
					EntryDescription = @EntryDescription,
					SEC = @SEC,
					EffectiveDate = @EffectiveDate,
					PrimaryNumber = @PrimaryNumber,
					LastName = @LastName,
					FirstName = @FirstName ,
					RoutingNumber = @RoutingNumber,
					AccountNumber = @AccountNumber,
					TransactionCode = @TransactionCode,
					ChangeCode = @ChangeCode ,
					Change = @Change,
					ChangeFrom  = @ChangeFrom,
					ChangeTo  = @ChangeTo,
					ReturnCode = @ReturnCode,
					ReturnReason = @ReturnReason,
					Amount  = @Amount,
					Comment = @Comment,
					CreationDate = @CreationDate,
	                CreatedBy = @CreatedBy,
	                MatchingUwMemberId = @MatchingUwMemberId,
					MatchingAgencyId = @MatchingAgencyId,
	                MatchingRule = @MatchingRule,
	                MatchingDate = @MatchingDate,
					MatchingAccountId = @MatchingAccountId,
					ManualMatchingUserName = @ManualMatchingUserName,
					RoutingNumberCorrectionUserName = @RoutingNumberCorrectionUserName,
					RoutingNumberCorrectionDate = @RoutingNumberCorrectionDate,
					HIASPrimaryMemberNumber = @HIASPrimaryMemberNumber,
					HIASPrimaryMembershipNumber = @HIASPrimaryMembershipNumber,
					MatchingUwCustomerId = @MatchingUwCustomerId,
					HIASCustomerNumber = @HIASCustomerNumber
            WHERE  ACHReturnReconciliationID = @ACHReturnReconciliationID;
            IF @@ROWCOUNT = 0 
                BEGIN
                    RAISERROR('Concurrent update error. Updated aborted.', 16, 2);
                END;
        END TRY

        BEGIN CATCH
            EXEC RethrowError;
        END CATCH;	

        SET NOCOUNT OFF;
    END;





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Finance].[RetrieveACHReturnReconciliation]
    @ACHReturnReconciliationId INT ,
    @MatchedStatus VARCHAR(1),
	@AppliedStatus VARCHAR(1),
	@ErrorNoStatus VARCHAR(1),
	@InactiveStatus VARCHAR(1),
    @FileID VARCHAR(100) ,
    @TraceNumber VARCHAR(100) ,
    @BatchNumber VARCHAR(100) ,
	@EntryDescription VARCHAR(100) ,
	@SEC VARCHAR(10) ,
	@EffectiveDate datetime ,
	@LastName VARCHAR(100) ,
    @FirstName VARCHAR(100) ,
	@RoutingNumber VARCHAR(100) ,
    @AccountNumber VARCHAR(100) ,
	@ChangeCode VARCHAR(10) ,
	@Change VARCHAR(100) ,
	@ChangeFrom VARCHAR(100) ,
	@ChangeTo VARCHAR(100) ,
	@ReturnCode VARCHAR(100) ,
	@ReturnReason VARCHAR(100) ,
    @Amount MONEY ,
    @Comment VARCHAR(1000) ,
	@PrimaryNumber VARCHAR(100) ,
	@ManualMatchMemberId VARCHAR(100),
    @PageNumber INT ,
    @PageSize INT ,
    @SortField VARCHAR(128) ,
    @SortDirection VARCHAR(20)
AS 
    BEGIN

        DECLARE @LowerLimit INT;
        DECLARE @UpperLimit INT;


		 SELECT  SUM(Amount) TotalAmount ,
                COUNT(1) TotalRecords
        FROM    Finance.ACHReturnReconciliation AS oar
        WHERE   ( @ACHReturnReconciliationId IS NULL
                  OR ACHReturnReconciliationId = @ACHReturnReconciliationId
                ) --1st Search Criteria
                AND ( ( @MatchedStatus IS NULL
                        AND @AppliedStatus IS NULL
                        AND @ErrorNoStatus IS NULL
                        AND @InactiveStatus IS NULL
                      )
                      OR ( Status IN ( @MatchedStatus, @AppliedStatus,
                                       @ErrorNoStatus, @InactiveStatus ) )
                    )
                AND --3nd Search Criteria
                            ( @TraceNumber IS NULL
                              OR TraceNumber LIKE @TraceNumber + '%'
                            )
							AND 
                            ( @TraceNumber IS NULL
                              OR TraceNumber LIKE @TraceNumber + '%'
                            )
                            AND 
                            ( @BatchNumber IS NULL
                              OR BatchNumber = @BatchNumber
                            )
							AND 
                            ( @EntryDescription IS NULL
                              OR EntryDescription = @EntryDescription
                            )
							AND 
                            ( @SEC IS NULL
                              OR SEC = @SEC
                            )
							AND ( @FileID IS NULL
                                  OR @FileID = FileID
                                )
							AND 
                            ( @EffectiveDate IS NULL
                              OR EffectiveDate = @EffectiveDate
                            )
							 AND ( @LastName IS NULL
                                  OR REPLACE(LastName, ' ', '') LIKE @LastName
                                  + '%'
                                )
                            AND ( @FirstName IS NULL
                                  OR REPLACE(FirstName, ' ', '') LIKE @FirstName
                                  + '%'
                                )
                            AND ( @RoutingNumber IS NULL
                                  OR RoutingNumber = @RoutingNumber
                                )
                            AND ( @AccountNumber IS NULL
                                  OR AccountNumber = @AccountNumber
                                )
                            AND ( @ChangeCode IS NULL
                                  OR ChangeCode = @ChangeCode
                                )
							AND ( @Change IS NULL
                                  OR Change = @Change
                                )
							AND ( @ChangeFrom IS NULL
                                  OR ChangeFrom = @ChangeFrom
                                )
							AND ( @ChangeTo IS NULL
                                  OR ChangeTo= @ChangeTo
                                )
							AND ( @ChangeTo IS NULL
                                  OR ChangeTo= @ChangeTo
                                )
							AND ( @ReturnCode IS NULL
                                  OR ReturnCode = @ReturnCode
                                )
								
							AND ( @ReturnReason IS NULL
                                  OR ReturnReason= @ReturnReason
                                )
							AND ( @Amount IS NULL
                                  OR Amount= @Amount
                                )
							AND ( @Comment IS NULL
                                  OR Comment= @Comment
                                )
								AND ( @PrimaryNumber IS NULL
                                  OR oar.PrimaryNumber = @PrimaryNumber
                                )
								AND ( @ManualMatchMemberId IS NULL
                                  OR oar.ManualMatchingUserName = @ManualMatchMemberId
                                )

        SET @LowerLimit = ( @PageNumber - 1 ) * @PageSize + 1;
        SET @UpperLimit = @PageNumber * @PageSize;

        SELECT  *
        FROM    ( SELECT    ACHReturnReconciliationId  ,
                            Status ,
                            FileID ,
                            TraceNumber ,
                            BatchNumber ,
                            EntryDescription ,
                            SEC ,
                            EffectiveDate ,
							PrimaryNumber,
                            ISNULL(LTRIM(RTRIM(LastName)),'') AS LastName ,
                            ISNULL(LTRIM(RTRIM(FirstName)),'') AS FirstName ,
                            RoutingNumber ,
                            AccountNumber ,
							TransactionCode,
                            ChangeCode ,
                            Change ,
                            ChangeFrom ,
                            ChangeTo ,
							ReturnCode ,
                            ReturnReason ,
							Amount,
							CreationDate,
							CreatedBy,
							MatchingDate,
							MatchingUwMemberId,
							MatchingAgencyId,
							MatchingRule,
							Comment,
							MatchingAccountId,
							ManualMatchingUserName,
							RoutingNumberCorrectionUserName,
							RoutingNumberCorrectionDate,
							HIASPrimaryMemberNumber,
							HIASPrimaryMembershipNumber,
							MatchingUwCustomerId,
							HIASCustomerNumber,
                            ROW_NUMBER() OVER ( ORDER BY ACHReturnReconciliationId DESC ) RowNum
                  FROM      Finance.ACHReturnReconciliation AS oar
                  WHERE     
							( @ACHReturnReconciliationId IS NULL
                              OR ACHReturnReconciliationId = @ACHReturnReconciliationId
                            ) --1st Search Criteria
                            AND ( ( @MatchedStatus IS NULL
                        AND @AppliedStatus IS NULL
                        AND @ErrorNoStatus IS NULL
                        AND @InactiveStatus IS NULL
                      )
                      OR ( Status IN ( @MatchedStatus, @AppliedStatus,
                                       @ErrorNoStatus, @InactiveStatus ) )
                    )
                            AND --3nd Search Criteria
                            ( @TraceNumber IS NULL
                              OR TraceNumber LIKE @TraceNumber + '%'
                            )
							AND 
                            ( @TraceNumber IS NULL
                              OR TraceNumber LIKE @TraceNumber + '%'
                            )
                            AND 
                            ( @BatchNumber IS NULL
                              OR BatchNumber = @BatchNumber
                            )
							AND 
                            ( @EntryDescription IS NULL
                              OR EntryDescription = @EntryDescription
                            )
							AND 
                            ( @SEC IS NULL
                              OR SEC = @SEC
                            )
							AND ( @FileID IS NULL
                                  OR @FileID = FileID
                                )
							AND 
                            ( @EffectiveDate IS NULL
                              OR EffectiveDate = @EffectiveDate
                            )
							 AND ( @LastName IS NULL
                                  OR REPLACE(LastName, ' ', '') LIKE @LastName
                                  + '%'
                                )
                            AND ( @FirstName IS NULL
                                  OR REPLACE(FirstName, ' ', '') LIKE @FirstName
                                  + '%'
                                )
                            AND ( @RoutingNumber IS NULL
                                  OR RoutingNumber = @RoutingNumber
                                )
                            AND ( @AccountNumber IS NULL
                                  OR AccountNumber = @AccountNumber
                                )
                            AND ( @ChangeCode IS NULL
                                  OR ChangeCode = @ChangeCode
                                )
							AND ( @Change IS NULL
                                  OR Change = @Change
                                )
							AND ( @ChangeFrom IS NULL
                                  OR ChangeFrom = @ChangeFrom
                                )
							AND ( @ChangeTo IS NULL
                                  OR ChangeTo= @ChangeTo
                                )
							AND ( @ChangeTo IS NULL
                                  OR ChangeTo= @ChangeTo
                                )
								AND ( @ReturnCode IS NULL
                                  OR ReturnCode = @ReturnCode
                                )
							AND ( @ReturnReason IS NULL
                                  OR ReturnReason= @ReturnReason
                                )
							AND ( @Amount IS NULL
                                  OR Amount= @Amount
                                )
							AND ( @Comment IS NULL
                                  OR Comment= @Comment
                                )
							AND ( @PrimaryNumber IS NULL
                                  OR oar.PrimaryNumber = @PrimaryNumber
                                )
							AND ( @ManualMatchMemberId IS NULL
                                  OR oar.ManualMatchingUserName = @ManualMatchMemberId
                                )
                ) InnerQuery
        WHERE   InnerQuery.RowNum >= @LowerLimit
                AND InnerQuery.RowNum <= @UpperLimit
                OR @PageSize IS NULL
        ORDER BY InnerQuery.RowNum;            

			
    END




GO
