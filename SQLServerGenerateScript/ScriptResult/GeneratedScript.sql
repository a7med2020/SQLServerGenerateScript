
    IF OBJECT_ID('[Rating].[MarketSegmentRTMVersion]', 'U') IS NOT NULL
    DROP Table [Rating].[MarketSegmentRTMVersion]
                   
GO

    IF OBJECT_ID('[Rating].[MarketSegmentRTMTable]', 'U') IS NOT NULL
    DROP Table [Rating].[MarketSegmentRTMTable]
                   
GO

    IF OBJECT_ID('[Policy].[MoveMemberCaseAgencyHistoryConfiguration]', 'U') IS NOT NULL
    DROP Table [Policy].[MoveMemberCaseAgencyHistoryConfiguration]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMoveHistory]', 'U') IS NOT NULL
    DROP Table [Policy].[UwMemberMoveHistory]
                   
GO

    IF OBJECT_ID('[Rating].[DeleteMarketSegmentRTMTableForSpecificVersion]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[DeleteMarketSegmentRTMTableForSpecificVersion]
                   
GO

    IF OBJECT_ID('[Rating].[DeleteMarketSegmentRTMVersion]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[DeleteMarketSegmentRTMVersion]
                   
GO

    IF OBJECT_ID('[Rating].[GetMarketSegmentRTMVersions]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[GetMarketSegmentRTMVersions]
                   
GO

    IF OBJECT_ID('[Rating].[InsertMarketSegmentRTMTable]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[InsertMarketSegmentRTMTable]
                   
GO

    IF OBJECT_ID('[Rating].[InsertMarketSegmentRTMVersion]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[InsertMarketSegmentRTMVersion]
                   
GO

    IF OBJECT_ID('[Rating].[RetrieveMarketSegmentRTMTable]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[RetrieveMarketSegmentRTMTable]
                   
GO

    IF OBJECT_ID('[Rating].[RetrieveMarketSegmentRTMVersions]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[RetrieveMarketSegmentRTMVersions]
                   
GO

    IF OBJECT_ID('[Rating].[UpdateMarketSegmentRTMVersion]', 'P') IS NOT NULL
    DROP PROCEDURE [Rating].[UpdateMarketSegmentRTMVersion]
                   
GO

    IF OBJECT_ID('[Quoting].[UpdateMarketingSegment]', 'P') IS NOT NULL
    DROP PROCEDURE [Quoting].[UpdateMarketingSegment]
                   
GO

    IF OBJECT_ID('[Quoting].[InsertMarketingSegment]', 'P') IS NOT NULL
    DROP PROCEDURE [Quoting].[InsertMarketingSegment]
                   
GO

    IF OBJECT_ID('[Quoting].[GetMarketingSegments]', 'P') IS NOT NULL
    DROP PROCEDURE [Quoting].[GetMarketingSegments]
                   
GO

    IF OBJECT_ID('[Policy].[GetIndividualRenewalProcessingMonths]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[GetIndividualRenewalProcessingMonths]
                   
GO

    IF OBJECT_ID('[Policy].[RetrieveIndividualRenewals]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[RetrieveIndividualRenewals]
                   
GO

    IF OBJECT_ID('[Policy].[RetrieveMemberMoveCurrentPlans]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[RetrieveMemberMoveCurrentPlans]
                   
GO

    IF OBJECT_ID('[Policy].[GetUwCustomerCasePlansActive]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[GetUwCustomerCasePlansActive]
                   
GO

    IF OBJECT_ID('[Policy].[GetMemberDetailsForMemberMove]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[GetMemberDetailsForMemberMove]
                   
GO

    IF OBJECT_ID('[Policy].[UWMemberMove_MoveMemberToNewCustomer]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UWMemberMove_MoveMemberToNewCustomer]
                   
GO

    IF OBJECT_ID('[Policy].[UWMemberMove_DeactivateMovedMemberCase]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UWMemberMove_DeactivateMovedMemberCase]
                   
GO

    IF OBJECT_ID('[Policy].[UWMemberMove_MoveMovedMemberCase]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UWMemberMove_MoveMovedMemberCase]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_CopyMovedMemberACHAccount]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_CopyMovedMemberACHAccount]
                   
GO

    IF OBJECT_ID('[Policy].[GetAppropriateNetworkFromMovedMemberCaseToNewMemberCase]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[GetAppropriateNetworkFromMovedMemberCaseToNewMemberCase]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_MoveMemberCaseAgencyHistory]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_MoveMemberCaseAgencyHistory]
                   
GO

    IF OBJECT_ID('[Policy].[UWMemberMove_CopyMovedMemberAccount]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UWMemberMove_CopyMovedMemberAccount]
                   
GO

    IF OBJECT_ID('[Policy].[RetrieveUwCustomerSummaries]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[RetrieveUwCustomerSummaries]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_MoveMemberBalance]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_MoveMemberBalance]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_UpdateUwMemberDemographicData]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_UpdateUwMemberDemographicData]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_MoveMemberBack]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_MoveMemberBack]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_MoveMember]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_MoveMember]
                   
GO

    IF OBJECT_ID('[Policy].[UwMemberMove_InsertUwMemberMoveHistory]', 'P') IS NOT NULL
    DROP PROCEDURE [Policy].[UwMemberMove_InsertUwMemberMoveHistory]
                   
GO

    IF OBJECT_ID('[Policy].[MapUwCustomerClassFromMovedMemberToNewMember]', 'FN') IS NOT NULL
    DROP FUNCTION [Policy].[MapUwCustomerClassFromMovedMemberToNewMember]
                   
GO

    IF OBJECT_ID('[Policy].[ValidateEffectiveDateAgainstCustomerCase]', 'FN') IS NOT NULL
    DROP FUNCTION [Policy].[ValidateEffectiveDateAgainstCustomerCase]
                   
GO

    IF OBJECT_ID('[Policy].[CheckIfZIPCodeIntheCutomerState]', 'FN') IS NOT NULL
    DROP FUNCTION [Policy].[CheckIfZIPCodeIntheCutomerState]
                   
GO

    IF OBJECT_ID('[Policy].[IsMemberAlreadyMoved]', 'FN') IS NOT NULL
    DROP FUNCTION [Policy].[IsMemberAlreadyMoved]
                   
GO

    IF OBJECT_ID('[Policy].[IsCustomerCaseInsuredTypeGroup]', 'FN') IS NOT NULL
    DROP FUNCTION [Policy].[IsCustomerCaseInsuredTypeGroup]
                   
GO

    IF OBJECT_ID('[Policy].[vUwCustomerSummary]', 'V') IS NOT NULL
    DROP View [Policy].[vUwCustomerSummary]
                   
GO
---===================================================================================================================================
---===================================================================================================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Policy].[MapUwCustomerClassFromMovedMemberToNewMember]
(
    @OriginalUwCustomerClassId INT,
    @NewUwCutomerId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @originalEmploymentClassId INT;
    DECLARE @NewUwCustomerClassId INT = NULL;
 
    IF (@OriginalUwCustomerClassId IS NOT NULL)
    BEGIN
        IF EXISTS -- If new customer has Classes
        (
            SELECT UwCustomerClassId
            FROM Customers.UwCustomerClass
            WHERE UwCustomerId = 12898
        )
        BEGIN
            SELECT @originalEmploymentClassId = EmploymentClassId
            FROM Customers.UwCustomerClass
            WHERE UwCustomerClassId = @OriginalUwCustomerClassId;
            SELECT @NewUwCustomerClassId = UwCustomerClassId --If the new customer has the same original EmploymentClassId
            FROM Customers.UwCustomerClass
            WHERE UwCustomerId = @NewUwCutomerId
                  AND EmploymentClassId = @originalEmploymentClassId;
            IF (@NewUwCustomerClassId IS NULL)
            BEGIN
                SELECT @NewUwCustomerClassId = UwCustomerClassId --If the new customer has 'All Employees' EmploymentClassId
                FROM Customers.UwCustomerClass
                WHERE UwCustomerId = @NewUwCutomerId
                      AND EmploymentClassId = 5; --All Employees
                IF (@NewUwCustomerClassId IS NULL)
                BEGIN
                    SELECT TOP 1 -- else get first NewUwCustomerClassId
                           @NewUwCustomerClassId = UwCustomerClassId
                    FROM Customers.UwCustomerClass
                    WHERE UwCustomerId = @NewUwCutomerId; --All Employees
                END;
            END;
        END;
    END;
 
    RETURN @NewUwCustomerClassId;

END;


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Policy].[ValidateEffectiveDateAgainstCustomerCase]
(
    @UwCustomerCaseId INT,
	@EffectiveDate DATETIME
)
RETURNS BIT
AS
BEGIN
 
    DECLARE @Valid BIT;

    SET @Valid = 0; 

    IF EXISTS
    (
         SELECT UwCustomerCaseId FROM Policy.UwCustomerCase 
		  JOIN Underwriting.AppCase 
            ON AppCase.AppCaseId = UwCustomerCase.AppCaseId
		 WHERE UwCustomerCaseId = @UwCustomerCaseId AND
		 (( @EffectiveDate >= CaseEffectiveDate AND DeactivationDate IS NULL )
          OR ( @EffectiveDate BETWEEN CaseEffectiveDate and DeactivationDate))
    )
    BEGIN
        SET @Valid = 1
    END

 
    RETURN @Valid;

END;

 
 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [Policy].[CheckIfZIPCodeIntheCutomerState]
(
    @UwCustomerId INT,
	@ZipCode VARCHAR(5)
)
RETURNS BIT
AS
BEGIN
 
    DECLARE @Valid BIT;

    SET @Valid = 0; 

    IF EXISTS
    (
        SELECT ZipCode FROM dbo.ZipCode WHERE StateCode =
         (SELECT StateCode FROM Customers.UwCustomer
		 JOIN dbo.ZipCode ON ZipCode.ZipCode = UwCustomer.ZipCode
		 WHERE  UwCustomer.UwCustomerId = @UwCustomerId) AND ZipCode.ZipCode = @ZipCode
    )
    BEGIN
        SET @Valid = 1
    END

 
    RETURN @Valid;

END;

 
 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Policy].[IsMemberAlreadyMoved]
(
    @OriginalUwMemberId INT
)
RETURNS BIT
AS
BEGIN
 
    DECLARE @Valid BIT;

    --SET @Valid = 0; 

    --IF EXISTS
    --(
    --     SELECT UwMemberMoveHistoryId FROM Policy.UwMemberMoveHistory WHERE OriginalUwMemberID = 0
    --)
    --BEGIN
      SET @Valid = 1
    --END

 
    RETURN @Valid;

END;

 
 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Policy].[IsCustomerCaseInsuredTypeGroup]
(
    @UwCustomerCaseId INT
)
RETURNS BIT
AS
BEGIN

    DECLARE @Valid BIT
    DECLARE @InsuredTypeIdForGroup INT

    SET @InsuredTypeIdForGroup =
    (
        SELECT it.InsuredTypeId FROM Plans.InsuredType AS it WHERE it.Code = 'Group'
    )

    SET @Valid = 0

    IF EXISTS
    (
        SELECT ucc.UwCustomerCaseId
        FROM Policy.UwCustomerCase AS ucc
            LEFT JOIN Underwriting.AppCase AS ac
                ON ac.AppCaseId = ucc.AppCaseId
            LEFT JOIN Policy.UwCustomerCasePlanVersion AS uccpv
                ON uccpv.UwCustomerCaseId = ucc.UwCustomerCaseId
                   AND uccpv.IsSubPlan = 0
            LEFT JOIN Plans.PlanVersion AS pv
                ON pv.PlanVersionId = uccpv.PlanVersionId
            LEFT JOIN Plans.[Plan] p
                ON p.PlanId = pv.PlanId
        WHERE p.InsuredTypeId = @InsuredTypeIdForGroup --OR p.InsuredTypeId = 7
              AND ucc.UwCustomerCaseId = @UwCustomerCaseId
    )
    BEGIN
        SET @Valid = 1
    END

    RETURN @Valid
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Policy].[vUwCustomerSummary]
AS
SELECT
	cust.UwCustomerId,
	cust.CustomerNumber,
	cust.[Name],
	cust.DoingBusinessAs,
	zip.ZipCode,
	zip.StateCode,
	cStatus.CustomerStatusId,
	cStatus.[Name] CustomerStatusName,
	zip.[City] CityName,
	cStatus.Code CustomerStatusCode,
	ms.MarketingSegmentId,
	ms.Name AS MarketingSegmentName
FROM
	Customers.UwCustomer cust INNER JOIN
	dbo.ZipCode zip ON cust.ZipCode = zip.ZipCode INNER JOIN
	Customers.CustomerStatus cStatus ON cStatus.CustomerStatusId = cust.CustomerStatusId left JOIN 
	Quoting.MarketingSegment AS ms ON ms.MarketingSegmentId = cust.MarketingSegmentId;



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rating].[MarketSegmentRTMVersion](
	[MarketSegmentRTMVersionId] [int] IDENTITY(1,1) NOT NULL,
	[RateVersion] [int] NOT NULL,
	[RateEffectiveDateFrom] [datetime] NOT NULL,
	[RateEffectiveDateTo] [datetime] NULL,
	[RateLoadedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ReleaseNotes] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rating].[MarketSegmentRTMTable](
	[MarketSegmentRTMTableId] [int] IDENTITY(1,1) NOT NULL,
	[MarketSegmentRTMVersionId] [int] NULL,
	[Year] [numeric](4, 0) NOT NULL,
	[MarketSegmentId] [int] NOT NULL,
	[FormNbr] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ZIP3] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RTMFactor] [decimal](18, 5) NOT NULL,
	[CreatedBy] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreationDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[MoveMemberCaseAgencyHistoryConfiguration](
	[MoveMemberCaseAgencyHistoryConfigurationID] [int] IDENTITY(1,1) NOT NULL,
	[OriginalMarketingSegmentID] [int] NULL,
	[NewMarketingSegmentID] [int] NULL,
	[MoveAgencyHistory] [bit] NULL,
	[UseCustomerAgencyHistory] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[UwMemberMoveHistory](
	[UwMemberMoveHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[OriginalUwMemberId] [int] NOT NULL,
	[NewUwCustomerId] [int] NOT NULL,
	[MembershipNumber] [varchar](22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewZipCode] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewUwCustomerCaseIDs] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewUwMemberId] [int] NULL,
	[NewUwMemberNumber] [varchar](22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreationDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Rating].[DeleteMarketSegmentRTMTableForSpecificVersion]
    @MarketSegmentRTMVersionId int
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        DELETE FROM [Rating].[MarketSegmentRTMTable]
        WHERE [MarketSegmentRTMVersionId] = @MarketSegmentRTMVersionId

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

CREATE PROCEDURE [Rating].[DeleteMarketSegmentRTMVersion]
    @MarketSegmentRTMVersionId int

AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM [Rating].[MarketSegmentRTMVersion]
        WHERE [MarketSegmentRTMVersionId] = @MarketSegmentRTMVersionId

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

CREATE PROCEDURE [Rating].[GetMarketSegmentRTMVersions]
@MarketSegmentRTMVersionId INT = null
AS
BEGIN
    SELECT [MarketSegmentRTMVersionId],
           [RateVersion],
           [RateEffectiveDateFrom],
           [RateEffectiveDateTo],
           [RateLoadedDate],
		   [ReleaseNotes],
           [CreatedBy],
           [CreationDate]
    FROM Rating.[MarketSegmentRTMVersion]
    WHERE @MarketSegmentRTMVersionId IS NULL or MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId;

END;




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Rating].[InsertMarketSegmentRTMTable]
    @MarketSegmentRTMTableId int OUTPUT,
    @MarketSegmentRTMVersionId int,
    @Year numeric,
    @MarketSegmentId int,
    @FormNbr varchar(255),
    @State varchar(2),
    @ZIP3 varchar(3),
    @RTMFactor DECIMAL(16,5),
	@CreatedBy varchar(20),
    @CreationDate datetime
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT  INTO [Rating].[MarketSegmentRTMTable]
            ( [MarketSegmentRTMVersionId],
              [Year],
              [MarketSegmentId],
              [FormNbr],
              [State],
              [ZIP3],
              [RTMFactor],
			  [CreatedBy],
              [CreationDate]            )
        VALUES ( @MarketSegmentRTMVersionId,
                @Year,
                @MarketSegmentId,
                @FormNbr,
                @State,
                @ZIP3,
                @RTMFactor,
				@CreatedBy,
                @CreationDate
            )
            SET @MarketSegmentRTMTableId = SCOPE_IDENTITY()
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

CREATE PROCEDURE [Rating].[InsertMarketSegmentRTMVersion]
    @MarketSegmentRTMVersionId INT OUTPUT,
    @RateVersion INT,
    @RateEffectiveDateFrom DATETIME,
    @RateEffectiveDateTo DATETIME,
    @RateLoadedDate DATETIME,
    @ReleaseNotes VARCHAR(1000),
    @CreatedBy VARCHAR(20),
    @CreationDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT  INTO [Rating].[MarketSegmentRTMVersion]
            ( [RateVersion],
              [RateEffectiveDateFrom],
              [RateEffectiveDateTo],
              [RateLoadedDate],
			  [ReleaseNotes],
              [CreatedBy],
              [CreationDate]            )
        VALUES ( @RateVersion,
                @RateEffectiveDateFrom,
                @RateEffectiveDateTo,
                @RateLoadedDate,
				@ReleaseNotes,
                @CreatedBy,
                @CreationDate
            )
            SET @MarketSegmentRTMVersionId = SCOPE_IDENTITY()
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

create PROCEDURE [Rating].[RetrieveMarketSegmentRTMTable]
    @MarketSegmentRTMVersionId int,
    @PageNumber INT=1,
    @PageSize INT=NULL,
    @SortField VARCHAR (128)=NULL,
    @SortDirection VARCHAR (20)=NULL
AS
BEGIN

    DECLARE @LowerLimit INT,
        @UpperLimit INT

    Set @LowerLimit = (@PageNumber - 1) * @PageSize + 1
    Set @UpperLimit = @PageNumber * @PageSize

    Select
        Count(1) TotalRecords,
		SUM(RTMFactor) TotalAmount
    From
        Rating.[MarketSegmentRTMTable]
    Where
         MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId

    IF ISNULL(@SortDirection,'Ascending') = 'Ascending'
        Begin
            Select
                [MarketSegmentRTMTableId],
                [MarketSegmentRTMVersionId],
                [Year],
                [MarketSegmentId],
                [MarketSegmentName],
                [FormNbr],
                [State],
                [ZIP3],
                [RTMFactor],
				[CreatedBy],
				[CreationDate]
            From
                (
                    Select
                        [MarketSegmentRTMTableId],
                        [MarketSegmentRTMVersionId],
                        [Year],
                        [MarketSegmentId],
						MarketingSegment.[Name] MarketSegmentName,
                        [FormNbr],
                        MarketSegmentRTMTable.[State],
                        [ZIP3],
                        [RTMFactor],
						[CreatedBy],
				        [CreationDate],
                        Case IsNull(@SortField,'Default') When 'Default' Then Row_Number() Over(Order by MarketSegmentRTMTableId ASC)
                         When 'MarketSegmentRTMTableId' Then Row_Number() Over(Order by MarketSegmentRTMTableId ASC)
                         When 'MarketSegmentRTMVersionId' Then Row_Number() Over(Order by MarketSegmentRTMVersionId ASC)
                         When 'Year' Then Row_Number() Over(Order by Year ASC)
                         When 'MarketSegmentId' Then Row_Number() Over(Order by MarketSegmentId ASC)
                         When 'FormNbr' Then Row_Number() Over(Order by FormNbr ASC)
                         When 'State' Then Row_Number() Over(Order by MarketSegmentRTMTable.[State] ASC)
                         When 'ZIP3' Then Row_Number() Over(Order by ZIP3 ASC)
                         When 'RTMFactor' Then Row_Number() Over(Order by RTMFactor ASC)
                        End as RowNum
                    From
                        Rating.[MarketSegmentRTMTable]
						JOIN Quoting.MarketingSegment ON MarketingSegment.MarketingSegmentId = MarketSegmentRTMTable.MarketSegmentId
                    Where
                       MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId 
                        
                ) InnerQuery
            Where
RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is Null
            Order By
                RowNum
        End
    ELSE
        Begin
            Select
                [MarketSegmentRTMTableId],
                [MarketSegmentRTMVersionId],
                [Year],
                [MarketSegmentId],
                [MarketSegmentName],
                [FormNbr],
                [State],
                [ZIP3],
                [RTMFactor]  
				[CreatedBy],
				[CreationDate]
				FROM
                (
                    Select
                        [MarketSegmentRTMTableId],
                        [MarketSegmentRTMVersionId],
                        [Year],
                        [MarketSegmentId],
						MarketingSegment.[Name] MarketSegmentName,
                        [FormNbr],
                        MarketSegmentRTMTable.[State],
                        [ZIP3],
                        [RTMFactor],
						[CreatedBy],
				        [CreationDate],
                        Case IsNull(@SortField,'Default') When 'Default' Then Row_Number() Over(Order by MarketSegmentRTMTableId DESC)
                         When 'MarketSegmentRTMTableId' Then Row_Number() Over(Order by MarketSegmentRTMTableId DESC)
                         When 'MarketSegmentRTMVersionId' Then Row_Number() Over(Order by MarketSegmentRTMVersionId DESC)
                         When 'Year' Then Row_Number() Over(Order by Year DESC)
                         When 'MarketSegmentId' Then Row_Number() Over(Order by MarketSegmentId DESC)
                         When 'FormNbr' Then Row_Number() Over(Order by FormNbr DESC)
                         When 'State' Then Row_Number() Over(Order by MarketSegmentRTMTable.[State] DESC)
                         When 'ZIP3' Then Row_Number() Over(Order by ZIP3 DESC)
                         When 'RTMFactor' Then Row_Number() Over(Order by RTMFactor DESC)
                        End as RowNum
                    From
                        Rating.[MarketSegmentRTMTable]
						JOIN Quoting.MarketingSegment ON MarketingSegment.MarketingSegmentId = MarketSegmentRTMTable.MarketSegmentId
                    Where
                         MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId
                ) InnerQuery
            Where
RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is Null
            Order By
                RowNum
        End
End




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Rating].[RetrieveMarketSegmentRTMVersions]
    @MarketSegmentRTMVersionId INT=null,
    @RateVersion INT=null,
    @RateEffectiveDateFrom DATETIME=null,
    @RateEffectiveDateTo DATETIME=null,
    @RateLoadedDate DATETIME=null,
    @CreatedBy VARCHAR(20)=null,
    @CreationDate DATETIME=null,
    @PageNumber INT=1,
    @PageSize INT=NULL,
    @SortField VARCHAR (128)=NULL,
    @SortDirection VARCHAR (20)=NULL
AS
BEGIN

    DECLARE @LowerLimit INT,
        @UpperLimit INT

    Set @LowerLimit = (@PageNumber - 1) * @PageSize + 1
    Set @UpperLimit = @PageNumber * @PageSize

	DECLARE @MostRecentRowId int

	set @MostRecentRowId = (SELECT TOP 1 MarketSegmentRTMVersionId FROM Rating.[MarketSegmentRTMVersion] ORDER BY MarketSegmentRTMVersionId DESC)

    Select
        Count(1) TotalRecords
    From
        Rating.[MarketSegmentRTMVersion]
    Where
        (@MarketSegmentRTMVersionId Is Null Or MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId) And
        (@RateVersion Is Null Or RateVersion = @RateVersion) And
        (@RateEffectiveDateFrom Is Null Or RateEffectiveDateFrom = @RateEffectiveDateFrom) And
        (@RateEffectiveDateTo Is Null Or RateEffectiveDateTo = @RateEffectiveDateTo) And
        (@RateLoadedDate Is Null Or RateLoadedDate = @RateLoadedDate) And
        (@CreatedBy Is Null Or CreatedBy like @CreatedBy+'%' ) And 
        (@CreationDate Is Null Or CreationDate = @CreationDate)

    IF ISNULL(@SortDirection,'Ascending') = 'Ascending'
        Begin
            Select
                [MarketSegmentRTMVersionId],
                [RateVersion],
                [RateEffectiveDateFrom],
                [RateEffectiveDateTo],
                [RateLoadedDate],
				[ReleaseNotes],
                [CreatedBy],
                [CreationDate],
				[Deletable]
            From
                (
                    Select
                        [MarketSegmentRTMVersionId],
                        [RateVersion],
                        [RateEffectiveDateFrom],
                        [RateEffectiveDateTo],
                        [RateLoadedDate],
						[ReleaseNotes],
                        [CreatedBy],
                        [CreationDate],
						CAST( CASE WHEN MarketSegmentRTMVersionId = @MostRecentRowId THEN 1 ELSE 0 END AS BIT) Deletable,
                        Case IsNull(@SortField,'Default') When 'Default' Then Row_Number() Over(Order by MarketSegmentRTMVersionId ASC)
                         When 'MarketSegmentRTMVersionId' Then Row_Number() Over(Order by MarketSegmentRTMVersionId ASC)
                         When 'RateVersion' Then Row_Number() Over(Order by RateVersion ASC)
                         When 'RateEffectiveDateFrom' Then Row_Number() Over(Order by RateEffectiveDateFrom ASC)
                         When 'RateEffectiveDateTo' Then Row_Number() Over(Order by RateEffectiveDateTo ASC)
                         When 'RateLoadedDate' Then Row_Number() Over(Order by RateLoadedDate ASC)
                         When 'CreatedBy' Then Row_Number() Over(Order by CreatedBy ASC)
                         When 'CreationDate' Then Row_Number() Over(Order by CreationDate ASC)
                        End as RowNum
                    From
                        Rating.[MarketSegmentRTMVersion]
                    Where
                        (@MarketSegmentRTMVersionId Is Null Or MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId) And
                        (@RateVersion Is Null Or RateVersion = @RateVersion) And
                        (@RateEffectiveDateFrom Is Null Or RateEffectiveDateFrom = @RateEffectiveDateFrom) And
                        (@RateEffectiveDateTo Is Null Or RateEffectiveDateTo = @RateEffectiveDateTo) And
                        (@RateLoadedDate Is Null Or RateLoadedDate = @RateLoadedDate) And
                        (@CreatedBy Is Null Or CreatedBy like @CreatedBy+'%' ) And 
                        (@CreationDate Is Null Or CreationDate = @CreationDate)
                ) InnerQuery
            Where
RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is Null
            Order By
                RowNum
        End
    ELSE
        Begin
            Select
                [MarketSegmentRTMVersionId],
                [RateVersion],
                [RateEffectiveDateFrom],
                [RateEffectiveDateTo],
                [RateLoadedDate],
				[ReleaseNotes],
                [CreatedBy],
                [CreationDate],
				[Deletable]
				FROM
                (
                    Select
                        [MarketSegmentRTMVersionId],
                        [RateVersion],
                        [RateEffectiveDateFrom],
                        [RateEffectiveDateTo],
                        [RateLoadedDate],
						[ReleaseNotes],
                        [CreatedBy],
                        [CreationDate],
						CAST( CASE WHEN MarketSegmentRTMVersionId = @MostRecentRowId THEN 1 ELSE 0 END AS BIT) Deletable,
                        Case IsNull(@SortField,'Default') When 'Default' Then Row_Number() Over(Order by MarketSegmentRTMVersionId DESC)
                         When 'MarketSegmentRTMVersionId' Then Row_Number() Over(Order by MarketSegmentRTMVersionId DESC)
                         When 'RateVersion' Then Row_Number() Over(Order by RateVersion DESC)
                         When 'RateEffectiveDateFrom' Then Row_Number() Over(Order by RateEffectiveDateFrom DESC)
                         When 'RateEffectiveDateTo' Then Row_Number() Over(Order by RateEffectiveDateTo DESC)
                         When 'RateLoadedDate' Then Row_Number() Over(Order by RateLoadedDate DESC)
                         When 'CreatedBy' Then Row_Number() Over(Order by CreatedBy DESC)
                         When 'CreationDate' Then Row_Number() Over(Order by CreationDate DESC)
                        End as RowNum
                    From
                        Rating.[MarketSegmentRTMVersion]
                    Where
                        (@MarketSegmentRTMVersionId Is Null Or MarketSegmentRTMVersionId = @MarketSegmentRTMVersionId) And
                        (@RateVersion Is Null Or RateVersion = @RateVersion) And
                        (@RateEffectiveDateFrom Is Null Or RateEffectiveDateFrom = @RateEffectiveDateFrom) And
                        (@RateEffectiveDateTo Is Null Or RateEffectiveDateTo = @RateEffectiveDateTo) And
                        (@RateLoadedDate Is Null Or RateLoadedDate = @RateLoadedDate) And
                        (@CreatedBy Is Null Or CreatedBy like @CreatedBy+'%' ) And 
                        (@CreationDate Is Null Or CreationDate = @CreationDate)
                ) InnerQuery
            Where
RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is Null
            Order By
                RowNum
        End
End




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Rating].[UpdateMarketSegmentRTMVersion]
    @MarketSegmentRTMVersionId int,
    --@RateVersion int,
    --@RateEffectiveDateFrom datetime,
    @RateEffectiveDateTo datetime,
    @RateLoadedDate datetime
    --,@CreatedBy varchar(20),
    --@CreationDate datetime

AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [Rating].[MarketSegmentRTMVersion]
        SET --[RateVersion] = @RateVersion,
        --    [RateEffectiveDateFrom] = @RateEffectiveDateFrom,
            [RateEffectiveDateTo] = @RateEffectiveDateTo,
            [RateLoadedDate] = @RateLoadedDate
            --,[CreatedBy] = @CreatedBy,
            --[CreationDate] = @CreationDate
        WHERE [MarketSegmentRTMVersionId] = @MarketSegmentRTMVersionId
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
CREATE PROCEDURE [Quoting].[UpdateMarketingSegment]
    @description varchar(1024) = NULL,
	@inHouseContact varchar(255),
	@isActive bit,
	@marketingSegmentId int,
	@name varchar(255),
	@quotationText varchar(1024) = NULL 
	,@CompanyName VARCHAR (255)
	,@addressLine1 VARCHAR (255)
	,@addressLine2 VARCHAR (255)
	,@zipCode VARCHAR (5)
	,@contactName VARCHAR (255)
	,@contactPhoneNumber VARCHAR (20)
	,@contactEmailAddress VARCHAR (255)
	,@sftpAddress VARCHAR (255)
	,@individualMember BIT
	,@individualMemberAgent BIT
	,@groupQuotingAndSalesAgent BIT
	,@marketSegmentCompany bit
AS
BEGIN

	--The [Quoting].[MarketingSegment] table doesn't have a timestamp column. Optimistic concurrency logic cannot be generated
	SET NOCOUNT ON

	BEGIN TRY
	UPDATE [Quoting].[MarketingSegment] 
	SET [Description] = @description, [InHouseContact] = @inHouseContact, [IsActive] = @isActive, [Name] = @name, [QuotationText] = @quotationText,
	  [CompanyName] = @companyname,  [AddressLine1] = @addressline1,  [AddressLine2] = @addressline2,    [ZIPCode] = @zipcode, 
	  [ContactName] = @contactname,  [ContactPhoneNumber] = @contactphonenumber,  [ContactEmailAddress] = @contactemailaddress,  [SFTPAddress] = @sftpaddress,  
	  [IndividualMember] = @individualmember,  [IndividualMemberAgent] = @individualmemberagent,  [GroupQuotingAndSalesAgent] = @groupquotingandsalesagent, 
	  [MarketSegmentCompany] = @marketsegmentcompany
	WHERE [MarketingSegmentId]=@marketingSegmentId

	IF @@ROWCOUNT = 0
	BEGIN
		RAISERROR('Concurrent update error. Updated aborted.', 16, 2)
	END
    END TRY

    BEGIN CATCH
		EXEC RethrowError;
	END CATCH	

	SET NOCOUNT OFF
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Quoting].[InsertMarketingSegment]
@description VARCHAR (1024)=NULL, @inHouseContact VARCHAR (255), @isActive BIT, @marketingSegmentId INT OUTPUT, @name VARCHAR (255), @quotationText VARCHAR (1024)=NULL,
@CompanyName VARCHAR (255)
,@addressLine1 VARCHAR (255)
,@addressLine2 VARCHAR (255)
,@zipCode VARCHAR (5)
,@contactName VARCHAR (255)
,@contactPhoneNumber VARCHAR (20)
,@contactEmailAddress VARCHAR (255)
,@sftpAddress VARCHAR (255)
,@individualMember BIT
,@individualMemberAgent BIT
,@groupQuotingAndSalesAgent BIT
,@marketSegmentCompany bit
AS
BEGIN
	SET NOCOUNT ON
	
	BEGIN TRY
    INSERT INTO [Quoting].[MarketingSegment] ([Description], [InHouseContact], [IsActive], [Name], [QuotationText],
	 [CompanyName], [AddressLine1], [AddressLine2], [ZIPCode], [ContactName], [ContactPhoneNumber], [ContactEmailAddress],
     [SFTPAddress], [IndividualMember], [IndividualMemberAgent], [GroupQuotingAndSalesAgent], [MarketSegmentCompany])
	VALUES (@description, @inHouseContact, @isActive, @name, @quotationText, 
	@CompanyName,@addressLine1,@addressLine2,@zipCode,@contactName,@contactPhoneNumber
     ,@contactEmailAddress,@sftpAddress,@individualMember,@individualMemberAgent,@groupQuotingAndSalesAgent,@marketSegmentCompany)
    SET @marketingSegmentId = SCOPE_IDENTITY()
    END TRY

    BEGIN CATCH
		EXEC RethrowError;
	END CATCH
    
    SET NOCOUNT OFF
END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Quoting].[GetMarketingSegments]
@MarketingSegmentId INT=Null, @MarketingSegmentName VARCHAR (255)=Null, @InHouseContact VARCHAR (255)=Null, @QuotationText VARCHAR (1024)=Null, @Description VARCHAR (1024)=Null, @IsActive BIT=Null, @PlanName VARCHAR (128)=Null, @CustomerName VARCHAR (255)=Null, @PageNumber INT=1, @PageSize INT=Null, @SortField VARCHAR (128)=Null, @SortDirection VARCHAR (20)=Null
AS
BEGIN

	Declare @LowerLimit int
	Declare @UpperLimit int

	Set @LowerLimit = (@PageNumber - 1) * @PageSize + 1
	Set @UpperLimit = @PageNumber * @PageSize

	Select
		Count(1) TotalRecords
	From		
		Quoting.MarketingSegment
	Where
		(@MarketingSegmentId Is Null Or MarketingSegmentId = @MarketingSegmentId)	And 
		(@MarketingSegmentName Is Null Or Name like @MarketingSegmentName+'%' )										And 
		(@InHouseContact Is Null Or InHouseContact like @InHouseContact+'%' )		And 
		(@QuotationText Is Null Or QuotationText like @QuotationText+'%' )			And 
		(@Description Is Null Or Description like @Description+'%' )				And 
		(@IsActive Is Null Or IsActive = @IsActive)									AND
		(@PlanName IS NULL OR (Exists(	SELECT	1	
										FROM	Quoting.MarketingSegmentPlans MP INNER JOIN 
												[Plans].[Plan]	ON MP.[PlanId] = [Plan].[PlanId]
										WHERE	[Plans].[Plan].[Name] like @PlanName+'%' 	AND
												MP.[MarketingSegmentId] = Quoting.MarketingSegment.[MarketingSegmentId])))	AND
		(@CustomerName	IS NULL OR (EXISTS (	SELECT	1
												FROM	Customers.[Customer]
												WHERE	Customers.[Customer].NAME like @CustomerName+'%'	AND
														Customers.[Customer].[MarketingSegmentId] = Quoting.MarketingSegment.[MarketingSegmentId])))	

	If IsNull(@SortDirection,'Ascending') = 'Ascending'
		Begin
			Select 
				MarketingSegmentId,
				Name,
				InHouseContact,
				QuotationText,
				Description,
				IsActive,
				Allow15thEnrollment,
				AllowInvoiceOnDemand,
				CompanyName,
				AddressLine1,
				AddressLine2,
				ZIPCode,
				ContactName,
				ContactPhoneNumber,
				ContactEmailAddress,
				SFTPAddress,
				IndividualMember,
				IndividualMemberAgent,
				GroupQuotingAndSalesAgent,
				MarketSegmentCompany
			From
				(
					Select
						MarketingSegmentId,
						Name,
						InHouseContact,
						QuotationText,
						Description,
						IsActive,
						Allow15thEnrollment,
						AllowInvoiceOnDemand,
                        CompanyName,
                        AddressLine1,
                        AddressLine2,
                        ZIPCode,
                        ContactName,
                        ContactPhoneNumber,
                        ContactEmailAddress,
                        SFTPAddress,
                        IndividualMember,
                        IndividualMemberAgent,
                        GroupQuotingAndSalesAgent,
                        MarketSegmentCompany,	
						Case IsNull(@SortField,'MarketingSegmentId')When 'MarketingSegmentId' Then Row_Number() Over(Order by MarketingSegmentId ASC)
						When 'Default' Then Row_Number() Over(Order by IsActive,Name ASC)
						When 'Name' Then Row_Number() Over(Order by Name ASC,IsActive ASC,Name ASC)
						When 'InHouseContact' Then Row_Number() Over(Order by InHouseContact ASC,IsActive ASC,Name ASC)
						When 'QuotationText' Then Row_Number() Over(Order by QuotationText ASC,IsActive ASC,Name ASC)
						When 'Description' Then Row_Number() Over(Order by Description ASC,IsActive ASC,Name ASC)
						When 'IsActive' Then Row_Number() Over(Order by IsActive ASC,IsActive ASC,Name ASC)
						 End as RowNum 
					From
						Quoting.MarketingSegment
					Where
						(@MarketingSegmentId Is Null Or MarketingSegmentId = @MarketingSegmentId) And 
						(@MarketingSegmentName Is Null Or Name like @MarketingSegmentName+'%' ) And 
						(@InHouseContact Is Null Or InHouseContact like @InHouseContact+'%' ) And 
						(@QuotationText Is Null Or QuotationText like @QuotationText+'%' ) And 
						(@Description Is Null Or Description like @Description+'%' ) And 
						(@IsActive Is Null Or IsActive = @IsActive) AND
						(@PlanName IS NULL OR (Exists(	SELECT	1	
														FROM	Quoting.MarketingSegmentPlans MP INNER JOIN 
																[Plans].[Plan]	ON MP.[PlanId] = [Plan].[PlanId]
														WHERE	[Plans].[Plan].[Name] like @PlanName+'%' 	AND
																MP.[MarketingSegmentId] = Quoting.MarketingSegment.[MarketingSegmentId])))	AND
						(@CustomerName	IS NULL OR (EXISTS (	SELECT	1
																FROM	Customers.[Customer]
																WHERE	Customers.[Customer].NAME like @CustomerName+'%'	AND
																		Customers.[Customer].[MarketingSegmentId] = Quoting.MarketingSegment.[MarketingSegmentId])))	

			) InnerQuery
			Where
				RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is Null
			Order By
				RowNum
		End
	Else
		Begin
			Select 
					MarketingSegmentId,
					Name,
					InHouseContact,
					QuotationText,
					Description,
					IsActive,
					Allow15thEnrollment,
					AllowInvoiceOnDemand,
					CompanyName,
					AddressLine1,
					AddressLine2,
					ZIPCode,
					ContactName,
					ContactPhoneNumber,
					ContactEmailAddress,
					SFTPAddress,
					IndividualMember,
					IndividualMemberAgent,
					GroupQuotingAndSalesAgent,
					MarketSegmentCompany
				From
					(
						Select
							MarketingSegmentId,
							Name,
							InHouseContact,
							QuotationText,
							Description,
							IsActive,
							Allow15thEnrollment,
							AllowInvoiceOnDemand,
							CompanyName,
							AddressLine1,
							AddressLine2,
							ZIPCode,
							ContactName,
							ContactPhoneNumber,
							ContactEmailAddress,
							SFTPAddress,
							IndividualMember,
							IndividualMemberAgent,
							GroupQuotingAndSalesAgent,
							MarketSegmentCompany,	
							Case IsNull(@SortField,'MarketingSegmentId')When 'MarketingSegmentId' Then Row_Number() Over(Order by MarketingSegmentId DESC)
							When 'Default' Then Row_Number() Over(Order by IsActive,Name ASC)
							When 'Name' Then Row_Number() Over(Order by Name DESC,IsActive ASC,Name ASC)
							When 'InHouseContact' Then Row_Number() Over(Order by InHouseContact DESC,IsActive ASC,Name ASC)
							When 'QuotationText' Then Row_Number() Over(Order by QuotationText DESC,IsActive ASC,Name ASC)
							When 'Description' Then Row_Number() Over(Order by Description DESC,IsActive ASC,Name ASC)
							When 'IsActive' Then Row_Number() Over(Order by IsActive DESC,IsActive ASC,Name ASC)
							 End as RowNum 
						From
							Quoting.MarketingSegment
						Where
							(@MarketingSegmentId Is Null Or MarketingSegmentId = @MarketingSegmentId) And 
							(@MarketingSegmentName Is Null Or Name like @MarketingSegmentName+'%' ) And 
							(@InHouseContact Is Null Or InHouseContact like @InHouseContact+'%' ) And 
							(@QuotationText Is Null Or QuotationText like @QuotationText+'%' ) And 
							(@Description Is Null Or Description like @Description+'%' ) And 
							(@IsActive Is Null Or IsActive = @IsActive) AND
							(@PlanName IS NULL OR (Exists(	SELECT	1	
															FROM	Quoting.MarketingSegmentPlans MP INNER JOIN 
																	[Plans].[Plan]	ON MP.[PlanId] = [Plan].[PlanId]
															WHERE	[Plans].[Plan].[Name] like @PlanName+'%' 	AND
																	MP.[MarketingSegmentId] = Quoting.MarketingSegment.[MarketingSegmentId])))	AND
							(@CustomerName	IS NULL OR (EXISTS (	SELECT	1
																	FROM	Customers.[Customer]
																	WHERE	Customers.[Customer].NAME like @CustomerName+'%'	AND
																			Customers.[Customer].[MarketingSegmentId] = Quoting.MarketingSegment.[MarketingSegmentId])))	

					) InnerQuery
				Where
					RowNum >= @LowerLimit and
					RowNum <= @UpperLimit or
					@PageSize Is Null	
				Order By
					RowNum
		End

END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [Policy].GetIndividualRenewalProcessingMonths 
AS
BEGIN
		DECLARE @MonthsInpastCout INT, @MonthsInpastFuture INT

		SET @MonthsInpastCout = (SELECT [Value] FROM dbo.[Configuration] WHERE Code = 'IndividualRenewalProcessingMonthsInPast') * -1
		SET @MonthsInpastFuture = (SELECT [Value] FROM dbo.[Configuration] WHERE Code = 'IndividualRenewalProcessingMonthsInFuture');
 
		WITH DateCTE AS (
			SELECT dbo.GetFirstMonthDay(DATEADD(MONTH, @MonthsInpastCout, GETDATE())) AS DateValue -- Starting date
			UNION ALL
			SELECT DATEADD(MONTH, 1, DateValue) FROM DateCTE WHERE DateValue < dbo.GetFirstMonthDay(DATEADD(MONTH, @MonthsInpastFuture, GETDATE()))
		)
		SELECT FORMAT(DateValue, 'MM/dd/yyyy') AS MonthDate FROM DateCTE
		OPTION (MAXRECURSION 0); -- Enable unlimited recursion, if needed
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Policy].[RetrieveIndividualRenewals]
    @RenewalProcessingMonth DATETIME = NULL,
    @CoverageId INT = NULL,
    @MarketSegmentId INT = NULL,
    @GroupId INT = NULL,
    @GroupNumber VARCHAR(30) = NULL,
    @PrimaryMemberNumber VARCHAR(30) = NULL,
    @PageNumber INT = 1,
    @PageSize INT = NULL,
    @SortField VARCHAR(128) = NULL,
    @SortDirection VARCHAR(20) = NULL
AS
BEGIN

 DECLARE @LowerLimit INT,
        @UpperLimit INT

    Set @LowerLimit = (@PageNumber - 1) * @PageSize + 1
    Set @UpperLimit = @PageNumber * @PageSize

    DECLARE @startDate DATETIME, @EndDate DATETIME;
    SET @EndDate = dbo.GetFirstMonthDay(DATEADD(MONTH, -10, GETDATE()));
    SET @startDate = DATEADD(MONTH, -1, @EndDate);

--========================================= #Temp Table ====================================================================================
	 SELECT um.MemberNumber PrimaryMemberNumber,
               uc.CustomerNumber GroupNumber,
               uc.Name GroupName,
               umzc.StateCode AS [State],
			   mrktsgmnt.[Name] MarketSegment,
			   vpv.CoverageName Coverage,
			   FORMAT(CAST('10/01/2023' AS DATETIME) , 'MM/dd/yyyy') RenewalProcessingMonth,
               ac.FileAssemblerSuffix AS PlanNameSuffix,
               vpv.FormNumber AS FormNumber,
			      RTMTable.RTMFactor AS RenewalRTM,
           RTMVersion.RateVersion AS RenewalRTMVersion
     INTO #TempIndividualRenewals

        FROM Customers.UwMember AS um
            JOIN Customers.MemberStatus AS ms
                ON ms.MemberStatusId = um.MemberStatusId
            JOIN dbo.ZipCode AS umzc
                ON umzc.ZipCode = um.ZipCode
            JOIN Customers.UwCustomer AS uc
                ON uc.UwCustomerId = um.UwCustomerId
            JOIN Policy.UwMemberCase AS umc
                ON umc.UwMemberId = um.UwMemberId
            JOIN Policy.UwCustomerCase AS ucc
                ON ucc.UwCustomerCaseId = umc.UwCustomerCaseId
            JOIN Underwriting.AppCase AS ac
                ON ac.AppCaseId = ucc.AppCaseId
            JOIN Policy.UwCustomerCasePlanVersion AS uccpv
                ON uccpv.UwCustomerCaseId = ucc.UwCustomerCaseId
                   AND uccpv.IsSubPlan = 0
            JOIN Plans.vPlanVersion AS vpv
                ON vpv.PlanVersionId = uccpv.PlanVersionId
            JOIN Quoting.MarketingSegment mrktsgmnt
                ON mrktsgmnt.MarketingSegmentId = uc.MarketingSegmentId
				     CROSS APPLY
        (
            SELECT TOP 1
                   umc2.UwMemberCaseId,
                   umc2.EffectiveDate
            FROM Policy.UwMemberCase AS umc2
            WHERE umc2.UwMemberId = um.UwMemberId
                  AND ISNULL(umc2.DeactivationDate, umc2.EffectiveDate) >= umc2.EffectiveDate
                  AND umc2.UwMemberCaseStatusId <> 4
            ORDER BY umc2.EffectiveDate ASC
        ) InitialCase
				 JOIN Rating.MarketSegmentRTMTable RTMTable ON  
        RTMTable.Year = DATEPART(YEAR, InitialCase.EffectiveDate)
       AND RTMTable.MarketSegmentId = mrktsgmnt.MarketingSegmentId
       AND RTMTable.FormNbr = vpv.FormNumber
       AND (RTMTable.[State] = 'DF'OR RTMTable.[State] = umzc.StateCode)
       AND (RTMTable.ZIP3 = SUBSTRING(umzc.ZipCode, 1, 3) OR RTMTable.ZIP3 IS NULL)
      JOIN Rating.MarketSegmentRTMVersion RTMVersion  
    ON RTMVersion.MarketSegmentRTMVersionId = RTMTable.MarketSegmentRTMVersionId
       
        --    OUTER APPLY
        --(
        --    SELECT MAX(ISNULL(umc2.DeactivationDate, '2099-01-01')) DeactivationDate
        --    FROM Policy.UwMemberCase AS umc2
        --    WHERE um.UwMemberId = umc2.UwMemberId
        --          AND ISNULL(umc2.DeactivationDate, umc2.EffectiveDate) >= umc2.EffectiveDate
        --          AND umc2.UwMemberCaseStatusId <> 4
        --) Latest
        WHERE  uc.MarketingSegmentId = 13 AND
              um.MemberStatusId IN ( 1, 3 )
              AND ISNULL(umc.DeactivationDate, umc.EffectiveDate) >= umc.EffectiveDate
              AND umc.UwMemberCaseStatusId <> 4
              --AND umc.UwMemberCaseId = InitialCase.UwMemberCaseId
              AND umc.EffectiveDate <= @EndDate
              AND umc.EffectiveDate > @startDate
			  AND (vpv.CoverageId = @CoverageId OR @CoverageId IS NULL)
			  AND (mrktsgmnt.MarketingSegmentId = @MarketSegmentId OR @MarketSegmentId IS NULL)
			  AND (uc.UwCustomerId = @GroupId OR @GroupId IS NULL)
			  AND (vpv.CoverageId = @CoverageId OR @CoverageId IS NULL)
			  AND (uc.CustomerNumber = @GroupNumber or @GroupNumber  IS NULL or @GroupNumber = '')
			  AND (um.MemberNumber = @PrimaryMemberNumber OR um.MembershipNumber = @PrimaryMemberNumber  or @PrimaryMemberNumber  IS NULL or @PrimaryMemberNumber = '')
			   
--========================================= Total Count ====================================================================================
	  Select
        Count(1) TotalRecords
 FROM  #TempIndividualRenewals

--========================================= Select With Order and Pagination ====================================================================================
 IF ISNULL(@SortDirection,'Ascending') = 'Ascending'
        BEGIN
SELECT DISTINCT PrimaryMemberNumber,
       GroupNumber,
       GroupName,
       [State],
       MarketSegment,
       Coverage,
       RenewalProcessingMonth,
       PlanNameSuffix,
       FormNumber,
       RenewalRTM,
       RenewalRTMVersion,
       RowNum
FROM (
    SELECT  PrimaryMemberNumber,
            GroupNumber,
            GroupName,
             [State],
            MarketSegment,
            Coverage,
            RenewalProcessingMonth,
            PlanNameSuffix,
            FormNumber,
            RenewalRTM,
            RenewalRTMVersion,
		    Case IsNull(@SortField,'Default') When 'Default' Then Row_Number() Over(Order by RenewalProcessingMonth ASC)
            When 'PrimaryMemberNumber' Then Row_Number() Over(Order by PrimaryMemberNumber ASC)
            When 'GroupNumber' Then Row_Number() Over(Order by GroupNumber ASC)
            When 'GroupName' Then Row_Number() Over(Order by GroupName ASC)
            When 'State' Then Row_Number() Over(Order by [State] ASC)
            When 'MarketSegment' Then Row_Number() Over(Order by MarketSegment ASC)
            When 'Coverage' Then Row_Number() Over(Order by Coverage ASC)
            When 'RenewalProcessingMonth' Then Row_Number() Over(Order by RenewalProcessingMonth ASC)
            When 'RenewalRTM' Then Row_Number() Over(Order by RenewalRTM ASC)
            When 'PlanNameSuffix' Then Row_Number() Over(Order by PlanNameSuffix ASC)
            When 'FormNumber' Then Row_Number() Over(Order by FormNumber ASC)
            When 'RenewalRTMVersion' Then Row_Number() Over(Order by RenewalRTMVersion ASC)
            END as RowNum
    FROM #TempIndividualRenewals
 
 )
 InnerQuery
            Where
RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is NULL  
            Order By
                RowNum
	End
--=================================================================	
	ELSE 
		BEGIN
		 SELECT DISTINCT PrimaryMemberNumber,
       GroupNumber,
       GroupName,
       [State],
       MarketSegment,
       Coverage,
       RenewalProcessingMonth,
       PlanNameSuffix,
       FormNumber,
       RenewalRTM,
       RenewalRTMVersion,
       RowNum
FROM (
    SELECT  PrimaryMemberNumber,
            GroupNumber,
            GroupName,
            [State],
            MarketSegment,
            Coverage,
            RenewalProcessingMonth,
            PlanNameSuffix,
            FormNumber,
            RenewalRTM,
            RenewalRTMVersion,
		    Case IsNull(@SortField,'Default') When 'Default' Then Row_Number() Over(Order by RenewalProcessingMonth DESC)
            When 'PrimaryMemberNumber' Then Row_Number() Over(Order by PrimaryMemberNumber DESC)
            When 'GroupNumber' Then Row_Number() Over(Order by GroupNumber DESC)
            When 'GroupName' Then Row_Number() Over(Order by GroupName DESC)
            When 'State' Then Row_Number() Over(Order by [State] DESC)
            When 'MarketSegment' Then Row_Number() Over(Order by MarketSegment DESC)
            When 'Coverage' Then Row_Number() Over(Order by Coverage DESC)
            When 'RenewalProcessingMonth' Then Row_Number() Over(Order by RenewalProcessingMonth DESC)
            When 'RenewalRTM' Then Row_Number() Over(Order by RenewalRTM DESC)
            When 'PlanNameSuffix' Then Row_Number() Over(Order by PlanNameSuffix DESC)
            When 'FormNumber' Then Row_Number() Over(Order by FormNumber DESC)
            When 'RenewalRTMVersion' Then Row_Number() Over(Order by RenewalRTMVersion DESC)
            END as RowNum
    FROM #TempIndividualRenewals
 )
 InnerQuery
            Where
RowNum >= @LowerLimit  and
				RowNum <= @UpperLimit  or
				@PageSize Is NULL  
            Order By
                RowNum
 
 		end
END;



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[RetrieveMemberMoveCurrentPlans]    
@UwMemberId INT
AS
BEGIN
 
SELECT c.[Name] Coverage,
       c.CoverageId CoverageId,
	   um.UwCustomerId CurrentUwCustomerId,
	   um.MembershipNumber ,
	   um.ZipCode UwMemberZIPCode,
       UwMemberCase.UwMemberCaseId,
       UwMemberCase.NetworkId,
       p.PlanId PlanId,
       p.[Name] PlanName,
       ac.FileAssemblerSuffix AS PlanSuffix,
	     CASE WHEN  p.InsuredTypeId = 5 or p.InsuredTypeId = 7 THEN 'Group' 
			ELSE 'Individual' END PlanInsuredType, 
	   UwMemberCase.EffectiveDate OriginalEffectiveDate,
       UwMemberCase.DeactivationDate TerminationDate,
       ISNULL(Premium.[value], 0.00 )Premium,
	   CASE WHEN c.CoverageId = 5 THEN cast (0 AS BIT) -- Life
	        When c.CoverageId = 6 THEN cast (0 AS BIT) -- Life_Sup
			When c.CoverageId = 8 THEN cast (0 AS BIT) -- STD
			ELSE cast (1 AS BIT) END EnableCaseMovement   -- Origianl Case for this coverage can be moved to the new member or not 
	   
FROM Plans.Coverage c
    OUTER APPLY
(
    SELECT TOP 1
           umc.UwCustomerCaseId,
           umc.UwMemberCaseId,
		   umc.EffectiveDate,
           umc.DeactivationDate,
		   umc.NetworkId
    FROM Policy.UwMemberCase umc
    WHERE  umc.UwMemberId = @UwMemberId AND
           CoverageId = c.CoverageId
          AND ISNULL(umc.DeactivationDate, umc.EffectiveDate) >= umc.EffectiveDate
          AND umc.UwMemberCaseStatusId <> 4
    ORDER BY UwMemberCaseId DESC
) UwMemberCase
   left  JOIN Customers.UwMember AS um
        ON um.UwMemberId = @UwMemberId
    LEFT JOIN dbo.ZipCode AS umzc
        ON umzc.ZipCode = um.ZipCode
    LEFT JOIN Customers.UwCustomer AS uc
        ON uc.UwCustomerId = um.UwCustomerId
    LEFT JOIN Policy.UwCustomerCase AS ucc
        ON ucc.UwCustomerCaseId = UwMemberCase.UwCustomerCaseId
    LEFT JOIN Underwriting.AppCase AS ac
        ON ac.AppCaseId = ucc.AppCaseId
    LEFT JOIN Policy.UwCustomerCasePlanVersion AS uccpv
        ON uccpv.UwCustomerCaseId = ucc.UwCustomerCaseId
           AND uccpv.IsSubPlan = 0
    LEFT JOIN Plans.PlanVersion AS pv
        ON pv.PlanVersionId = uccpv.PlanVersionId
    LEFT JOIN Plans.[Plan] p
        ON p.PlanId = pv.PlanId
		 OUTER APPLY
(
   SELECT TOP 1 SUM(pmp.Premium) AS [value]
           FROM Finance.PrimaryMonthlyPremium AS pmp
           WHERE pmp.UwMemberCaseId = UwMemberCase.UwMemberCaseId
                 AND pmp.IsActive = 1
           GROUP BY pmp.EffectiveDate
		   ORDER BY pmp.EffectiveDate desc
) Premium
		WHERE
		c.CoverageId not IN (1,2,7,9) --(Medical,Rx,AD&D,LTD)
		AND  um.UwMemberId = @UwMemberId
end
 

 


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[GetUwCustomerCasePlansActive]
@UwCustomerId INT, @CoverageId INT 
AS
BEGIN
	
	SELECT 
		vcch.UwCustomerCaseId,
		vcch.UwCustomerId,
		vcch.AppCaseId,
		vcch.DeactivationDate,
		vcch.DeactivatedBy,
		vcch.DeactivationReasonId,
		vcch.UndoneDate,
		vcch.UndoneBy,
		vcch.UndoneReason,
		vcch.UwCustomerCaseHistoryId,
		vcch.RenewalDate,
		vcch.OpenEnrollmentDate,
		vcch.NetworkId,
		vcch.RenewalDateChangeReasonId,
		vcch.OpenEnrollmentDateChangeReasonId,
		vcch.NetworkChangeReasonId,
		vcch.RtmEffectiveDateFrom,
		vcch.RtmEffectiveDateTo,
		vcch.CaseChangedBy,
		vcch.UwCustomerCaseRtmHistoryId,
		vcch.Rtm,
		vcch.RtmChangeReasonId,
		vcch.EffectiveDateFrom,
		vcch.EffectiveDateTo,
		vcch.RtmCreationDate,
		vcch.RtmChangedBy,
		vcch.CoverageId,
		vcch.CoverageCode,
		vcch.CoverageName,
		vcch.FileAssemblerSuffix,
		vcch.Number,
		vcch.PlanName,
		vcch.PlanNameAndFormNumber,
		vcch.CaseEffectiveDate,
		vcch.CaseStatusDescription,
		vcch.RenewalTypeId,
		ccpv.PlanVersionId
	FROM 
		[Policy].[vUwCustomerCase] vcch INNER JOIN
		Underwriting.AppCase appCase ON vcch.AppCaseId = appCase.AppCaseId INNER JOIN
		Policy.UwCustomerCasePlanVersion ccpv ON vcch.UwCustomerCaseId = ccpv.UwCustomerCaseId INNER JOIN 
		[Plans].[vPlanVersion] vpv ON ccpv.[PlanVersionId] = vpv.[PlanVersionId] 
	WHERE
		vcch.[UwCustomerId] = @UwCustomerId	AND
		ccpv.[IsSubPlan] = 0				AND
		vpv.[CoverageId] = @CoverageId		AND
		  appCase.CaseStatusId = 5 --(Active)
	ORDER BY
		vpv.[Name] + isnull(' - ' + appCase.[FileAssemblerSuffix],'') 	
		
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Policy].[GetMemberDetailsForMemberMove] @UwMemberId INT
AS
BEGIN

    DECLARE @UwCustomerId INT;
    DECLARE @Balance MONEY = 0;
    DECLARE @UwMemberPTD SMALLDATETIME = NULL;
    DECLARE @DependentNo int = 0;
    DECLARE @HasSpouce BIT = 0;
    DECLARE @IsCalCobra BIT = 0;



    SET @Balance =
    (
        SELECT Finance.CalcPayThroughBalance(a.AccountId, a.UwCustomerId, a.UwMemberId, a.PayThroughDate) AS Balance
        FROM Finance.Account AS a
        WHERE a.UwMemberId = @UwMemberId
    )

    SET @UwMemberPTD =
    (
        SELECT a.PayThroughDate
        FROM Finance.Account AS a
        WHERE UwMemberId = @UwMemberId
    )

    --IF @UwMemberPTD IS NULL
    --BEGIN

    --    SET @UwCustomerId =
    --    (
    --        SELECT um.UwCustomerId
    --        FROM Customers.UwMember AS um
    --        WHERE um.UwMemberId = @UwMemberId
    --    )

    --    SET @UwMemberPTD =
    --    (
    --        SELECT a.PayThroughDate
    --        FROM Finance.Account AS a
    --        WHERE a.UwCustomerId = @UwCustomerId
    --    )


    --END;

    SET @DependentNo =
    (
        SELECT COUNT(umd.UwMemberDependentId)
        FROM Customers.UwMemberDependent AS umd
        WHERE umd.UwMemberId = @UwMemberId
              --AND umd.DependentStatusId = 1
			  AND umd.Relation != 'Spouse'
    )


    IF EXISTS
    (
        SELECT 1
        FROM Customers.UwMemberDependent AS umd
        WHERE umd.UwMemberId = @UwMemberId
              AND umd.Relation = 'Spouse'
			    AND umd.DependentStatusId = 1
    )
    BEGIN
        SET @HasSpouce = 1;
    END
    ELSE
    BEGIN
        SET @HasSpouce = 0;
    END


    IF EXISTS
    (
        SELECT 1
        FROM Customers.UwMember AS um
        WHERE um.UwMemberId = @UwMemberId
              AND um.CobraTypeId = 3
    )
    BEGIN
        SET @IsCalCobra = 1;
    END
    ELSE
    BEGIN
        SET @IsCalCobra = 0;
    END

    SELECT (case WHEN @Balance IS NULL THEN 0 ELSE @Balance End)  AS UwMemberBalance,
           @UwMemberPTD AS UwMemberPTD,
           @DependentNo AS UwmemberDependentNo,
           @HasSpouce AS IsUwmemberHasSpouce,
           @IsCalCobra AS IsUwmemberCalCobra

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UwMemberMove_MoveMemberToNewCustomer]
    @OriginalUwMemberId INT,
    @NewUwCustomerId INT,
	@NewZipCode VARCHAR(5),
    @MovedByUserName VARCHAR(50),
    @NewUwMemberId INT OUTPUT,
    @NewUwMemberNumber VARCHAR(22) OUTPUT
AS
BEGIN

    --Member Declaration
    DECLARE @memberId INT,
            @OriginalUwCustomerId INT,
            @FirstName VARCHAR(50),
            @MiddleInitial VARCHAR(1),
            @LastName VARCHAR(50),
            @BirthDate DATETIME,
            @Gender VARCHAR(6),
            @Address1 VARCHAR(255),
            @Address2 VARCHAR(255),
            @MaritalStatusId TINYINT,
            @IsSmoker BIT,
            @SSN VARCHAR(9),
            @Phone VARCHAR(20),
            @Fax VARCHAR(20),
            @EmailAddress VARCHAR(255),
            @UwCustomerClassId INT,
            @UwCustomerDivisionId INT,
            @EmployeeTypeId TINYINT,
            @HiringDate DATETIME,
            @WeeklyHours TINYINT,
            @AnnualSalary MONEY,
            @CobraContinueCoverage BIT,
            @CobraElectionForm BIT,
            @CobraOnPriorBill BIT,
            @CobraQualifyingEventId TINYINT,
            @CobraDateOfQualifyingEvent DATETIME,
            @CobraMonthsEligible SMALLINT,
            @CobraMonthsRemaining SMALLINT,
            @IsSocialSecurityDocumentationProvided BIT,
            @CobraTypeId TINYINT,
            @CobraEffectiveFromDate DATETIME,
            @CobraEffectiveToDate DATETIME,
            @MemberStatusId TINYINT,
            @ReportingPreference VARCHAR(8),
            @IsResponsibleParty BIT,
            @CountyId INT,
            @ResponsiblePartyFirstName VARCHAR(50),
            @ResponsiblePartyMiddleInitial VARCHAR(1),
            @ResponsiblePartyLastName VARCHAR(50),
            @ResponsiblePartySSN VARCHAR(9),
            @AlternatePhone VARCHAR(10),
            @MailingAddressSameAsCoverageAddress BIT,
            @MailingAddress1 VARCHAR(255),
            @MailingAddress2 VARCHAR(255),
            @MailingZipCode VARCHAR(5),
            -- WI# 1501: Address discrepancies between HIAS and 834s | HIAS Code Change (Parameters) BEGIN
            @CoverageAddressChangedByHIAS BIT,
            @CoverageAddressLastChangeDateByHIAS DATETIME,
            @MailingAddressChangedByHIAS BIT,
            @MailingAddressLastChangeDateByHIAS DATETIME,
            -- WI# 1501: Address discrepancies between HIAS and 834s | HIAS Code Change (Parameters) END
            @MembershipNumber VARCHAR(100),
			@OriginalUwMemberNumber VARCHAR(22),
            @changeDate DATETIME,
            @uwMemberStatusHistoryId INT,
            @NewmemberStatusId INT,
            @OriginalCustomerNumber VARCHAR(255),
            @NewCustomerNumber VARCHAR(255),
            @Details VARCHAR(2048),
            @LifeCoverageInvoiceBillingCycleTypeId TINYINT,
            @PrimaryPreferenceInReceivingInvoicesTypeId TINYINT;

    --Dependent Declaration  
    DECLARE @OriginalUwMemberDependentId INT,
            @NewUwMemberDependentId INT,
            @DependentbirthDate DATETIME,
            @DependentfirstName VARCHAR(50),
            @Dependentgender VARCHAR(6),
            @DependentlastName VARCHAR(50),
            @memberDependentId INT,
            @DependentmiddleInitial VARCHAR(1),
            @Dependentrelation VARCHAR(6),
            @DependentsSN VARCHAR(9),
            @DependentisSmoker BIT,
            @DependentisEligible BIT,
            @DependenteligibilityReasonId TINYINT,
            @DependentineligibilityReasonId TINYINT,
            @DependentDependentStatusId TINYINT,
            @DependentproofDate DATETIME,
            @DependentLateEnrollmentFrom SMALLDATETIME,
            @DependentLateEnrollmentThru SMALLDATETIME,
            @uwMemberDependentStatusHistoryId INT,
            @NewDependentStatusId INT,
            @ClaimScapeID INT;


    SET @changeDate = GETDATE();
    SET @NewmemberStatusId = 1;
    SET @NewDependentStatusId = 1;
    SET @CountyId = (SELECT TOP 1 CountyId FROM dbo.County WHERE ZipCode = @NewZipCode )


    SELECT --um.UwMemberId ,
        --        eoem.ExchangeUwCustomerID ,
        @FirstName = um.FirstName,
        @MiddleInitial = um.MiddleInitial,
        @LastName = um.LastName,
        @BirthDate = um.BirthDate,
        @Gender = um.Gender,
        @Address1 = um.Address1,
        @Address2 = um.Address2,
        @MaritalStatusId = um.MaritalStatusId,
        @IsSmoker = um.IsSmoker,
        @SSN = um.SSN,
        @Phone = um.Phone,
        @Fax = um.Fax,
        @EmailAddress = um.EmailAddress,
        --um.MemberId ,
        @UwCustomerClassId
            = [Policy].[MapUwCustomerClassFromMovedMemberToNewMember](um.UwCustomerClassId, @NewUwCustomerId),
        @UwCustomerDivisionId = um.UwCustomerDivisionId,
        @EmployeeTypeId = um.EmployeeTypeId,
        @HiringDate = um.HiringDate,
        @WeeklyHours = um.WeeklyHours,
        @AnnualSalary = um.AnnualSalary,
        @CobraContinueCoverage = NULL, --um.CobraContinueCoverage,
        @CobraElectionForm = NULL, --um.CobraElectionForm,
        @CobraOnPriorBill = NULL, --um.CobraOnPriorBill,
        @CobraQualifyingEventId = NULL, --um.CobraQualifyingEventId,
        @CobraDateOfQualifyingEvent = NULL, --um.CobraDateOfQualifyingEvent,
        @CobraMonthsEligible = NULL, --um.CobraMonthsEligible,
        @CobraMonthsRemaining = NULL, -- um.CobraMonthsRemaining,
        @IsSocialSecurityDocumentationProvided = um.IsSocialSecurityDocumentationProvided,
        @CobraTypeId = NULL, --um.CobraTypeId,
        @CobraEffectiveFromDate = NULL, --um.CobraEffectiveFromDate,
        @CobraEffectiveToDate = NULL, --um.CobraEffectiveToDate,
        @MemberStatusId = MemberStatusId,
        @ReportingPreference = um.ReportingPreference,
        @IsResponsibleParty = um.IsResponsibleParty,
        @ResponsiblePartyFirstName = um.ResponsiblePartyFirstName,
        @ResponsiblePartyMiddleInitial = um.ResponsiblePartyMiddleInitial,
        @ResponsiblePartyLastName = um.ResponsiblePartyLastName,
        @ResponsiblePartySSN = um.ResponsiblePartySSN,
        @AlternatePhone = um.AlternatePhone,
        @MailingAddressSameAsCoverageAddress = um.MailingAddressSameAsCoverageAddress,
        @MailingAddress1 = um.MailingAddress1,
        @MailingAddress2 = um.MailingAddress2,
        @MailingZipCode = um.MailingZipCode,
        -- WI# 1501: Address discrepancies between HIAS and 834s | HIAS Code Change (Columns) BEGIN
        @CoverageAddressChangedByHIAS = um.CoverageAddressChangedByHIAS,
        @CoverageAddressLastChangeDateByHIAS = um.CoverageAddressLastChangeDateByHIAS,
        @MailingAddressChangedByHIAS = um.MailingAddressChangedByHIAS,
        @MailingAddressLastChangeDateByHIAS = um.MailingAddressLastChangeDateByHIAS,
        -- WI# 1501: Address discrepancies between HIAS and 834s | HIAS Code Change (Columns) END
        @MembershipNumber = um.MembershipNumber,
        @OriginalUwMemberNumber = um.MemberNumber,
        --eoem.OffExchangeUwCustomerID ,
		@OriginalUwCustomerId = uc_original.UwCustomerId,
        @OriginalCustomerNumber = uc_original.[CustomerNumber],
        @NewCustomerNumber = uc_new.[CustomerNumber],
        @LifeCoverageInvoiceBillingCycleTypeId = um.LifeCoverageInvoiceBillingCycleTypeId,
        @PrimaryPreferenceInReceivingInvoicesTypeId = um.PrimaryPreferenceInReceivingInvoicesTypeId
    FROM Customers.UwMember AS um
        JOIN Customers.UwCustomer AS uc_original
            ON um.UwCustomerId = uc_original.UwCustomerId
        JOIN Customers.UwCustomer AS uc_new
            ON uc_new.UwCustomerId = @NewUwCustomerId
    WHERE um.UwMemberId = @OriginalUwMemberId;
 
        EXEC Customers.InsertUwMember @Address1,
                                      @Address2,
                                      @BirthDate,
                                      @EmailAddress,
                                      @Fax,
                                      @FirstName,
                                      NULL,
                                      @Gender,
                                      @LastName,
                                      @MaritalStatusId,
                                      @memberId OUTPUT,
                                      @MiddleInitial,
                                      @Phone,
                                      @SSN,
                                      @NewUwCustomerId,
                                      @NewUwMemberId OUTPUT,
                                      @NewZipCode,
                                      @UwCustomerClassId,
                                      @UwCustomerDivisionId,
                                      @EmployeeTypeId,
                                      @HiringDate,
                                      @AnnualSalary,
                                      @CobraContinueCoverage,
                                      @CobraDateOfQualifyingEvent,
                                      @CobraElectionForm,
                                      @CobraMonthsEligible,
                                      @CobraMonthsRemaining,
                                      @CobraOnPriorBill,
                                      @CobraQualifyingEventId,
                                      @IsSocialSecurityDocumentationProvided,
                                      @WeeklyHours,
                                      @IsSmoker,
                                      @CobraEffectiveFromDate,
                                      @CobraEffectiveToDate,
                                      @CobraTypeId,
                                      @NewmemberStatusId,
                                      @ReportingPreference,
                                      @MembershipNumber,
                                      @CountyId,
                                      @IsResponsibleParty,
                                      @ResponsiblePartyFirstName,
                                      @ResponsiblePartyMiddleInitial,
                                      @ResponsiblePartyLastName,
                                      @ResponsiblePartySSN,
                                      @AlternatePhone,
                                      @MailingAddressSameAsCoverageAddress,
                                      @MailingAddress1,
                                      @MailingAddress2,
                                      @MailingZipCode, /*WI# 1501 - BEGIN*/
                                      @CoverageAddressChangedByHIAS,
                                      @CoverageAddressLastChangeDateByHIAS,
                                      @MailingAddressChangedByHIAS,
                                      @MailingAddressLastChangeDateByHIAS, /*WI# 1501 - END*/
                                      @LifeCoverageInvoiceBillingCycleTypeId = @LifeCoverageInvoiceBillingCycleTypeId,
                                      @PrimaryPreferenceInReceivingInvoicesTypeId = @PrimaryPreferenceInReceivingInvoicesTypeId;

									  set @NewUwMemberNumber = (SELECT MemberNumber FROM Customers.UwMember WHERE UwMemberId = @NewUwMemberId)

       IF(@UwCustomerClassId IS NOT null)
	   BEGIN
        DECLARE @EmployeeClassificationHistoryId INT;
        EXEC Policy.InsertEmployeeClassificationHistory @EmployeeClassificationHistoryId = @EmployeeClassificationHistoryId OUTPUT, -- int
                                                        @UnderwritingMemberId = @NewUwMemberId,                                     -- int
                                                        @UnderwritingCustomerClassId = @UwCustomerClassId,                          -- int
                                                        @DateTo = NULL,                                                             -- datetime
                                                        @DateFrom = @changeDate,                                                    -- datetime
                                                        @CreatedBy = @MovedByUserName,                                              -- varchar(50)
                                                        @IsDeleted = 0;
		END

		IF(@AnnualSalary IS NOT null)
	   BEGIN
       DECLARE @EmployeeAnnualSalaryHistoryId INT;
       EXEC Policy.InsertEmployeeAnnualSalaryHistory @EmployeeAnnualSalaryHistoryId = @EmployeeAnnualSalaryHistoryId OUTPUT, -- int
                                              @UnderwritingMemberId = @NewUwMemberId,                                              -- int
                                              @AnnualSalary = @AnnualSalary,                                                   -- decimal(18, 0)
                                              @DateTo = NULL,                                        -- datetime
                                              @DateFrom = @changeDate,                                      -- datetime
                                              @CreationDate = @changeDate,                                  -- datetime
                                              @CreatedBy = @MovedByUserName,                                                        -- varchar(50)
                                              @IsDeleted = 0  
		END
														 
 
        EXEC Customers.InsertUwMemberStatusHistory @changeDate = @changeDate,
                                                   @changedBy = @MovedByUserName,
                                                   @memberStatusId = @NewmemberStatusId,
                                                   @uwMemberId = @NewUwMemberId,
                                                   @uwMemberStatusHistoryId = @uwMemberStatusHistoryId;


        DECLARE depcur CURSOR FAST_FORWARD READ_ONLY FOR
        SELECT UwMemberDependentId,
               FirstName,
               LastName,
               BirthDate,
               Gender,
               Relation,
               MiddleInitial,
               SSN,
               IsSmoker,
               IsEligible,
               IneligibilityReasonId,
               DependentStatusId,
               ProofDate,
               EligibilityReasonId,
               LateEnrollmentFrom,
               LateEnrollmentThru,
               ClaimScapeID
        FROM Customers.UwMemberDependent AS umd
        WHERE UwMemberId = @OriginalUwMemberId
        ORDER BY EligibilitySequenceNumber;

        OPEN depcur;

        FETCH NEXT FROM depcur
        INTO @OriginalUwMemberDependentId,
             @DependentfirstName,
             @DependentlastName,
             @DependentbirthDate,
             @Dependentgender,
             @Dependentrelation,
             @DependentmiddleInitial,
             @DependentsSN,
             @DependentisSmoker,
             @DependentisEligible,
             @DependentineligibilityReasonId,
             @DependentDependentStatusId,
             @DependentproofDate,
             @DependenteligibilityReasonId,
             @DependentLateEnrollmentFrom,
             @DependentLateEnrollmentThru,
             @ClaimScapeID;

        WHILE @@FETCH_STATUS = 0
        BEGIN


            EXEC Customers.InsertUwMemberDependent @DependentbirthDate,
                                                   @DependentfirstName,
                                                   NULL,
                                                   @Dependentgender,
                                                   @DependentlastName,
                                                   @memberDependentId OUTPUT,
                                                   @DependentmiddleInitial,
                                                   @Dependentrelation,
                                                   @DependentsSN,
                                                   @NewUwMemberDependentId OUTPUT,
                                                   @NewUwMemberId,
                                                   @DependentisSmoker,
                                                   @DependentisEligible,
                                                   @DependenteligibilityReasonId,
                                                   @DependentineligibilityReasonId,
                                                   @NewDependentStatusId,
                                                   @DependentproofDate,
                                                   @ClaimScapeID;

            EXEC Customers.InsertUwMemberDependentStatusHistory @changeDate = @changeDate,                                             -- datetime
                                                                @changedBy = @MovedByUserName,                                         -- varchar(20)
                                                                @dependentStatusId = @NewDependentStatusId,                            -- tinyint
                                                                @uwMemberDependentId = @NewUwMemberDependentId,                        -- int
                                                                @uwMemberDependentStatusHistoryId = @uwMemberDependentStatusHistoryId; -- int


            UPDATE Customers.UwMemberDependent
            SET LateEnrollmentFrom = @DependentLateEnrollmentFrom,
                LateEnrollmentThru = @DependentLateEnrollmentThru
            WHERE UwMemberDependentId = @NewUwMemberDependentId;

            --INSERT  INTO dbo.ExchangeOffExchangeDependentMapping
            --        ( ExchangeUwMemberDependentID ,
            --          OffExchangeUwmemberDependentID
            --        )
            --VALUES  ( @OriginalUwMemberDependentId , -- ExchangeUwMemberDependentID - int
            --          @NewUwMemberDependentId  -- OffExchangeUwmemberDependentID - int
            --        )


            FETCH NEXT FROM depcur
            INTO @OriginalUwMemberDependentId,
                 @DependentfirstName,
                 @DependentlastName,
                 @DependentbirthDate,
                 @Dependentgender,
                 @Dependentrelation,
                 @DependentmiddleInitial,
                 @DependentsSN,
                 @DependentisSmoker,
                 @DependentisEligible,
                 @DependentineligibilityReasonId,
                 @DependentDependentStatusId,
                 @DependentproofDate,
                 @DependenteligibilityReasonId,
                 @DependentLateEnrollmentFrom,
                 @DependentLateEnrollmentThru,
                 @ClaimScapeID;

        END

        CLOSE depcur
        DEALLOCATE depcur


        SET @Details = 'Primary Member number:'+ @OriginalUwMemberNumber +' has been moved from Customer Number "' + @OriginalCustomerNumber + '" to Customer Number "' + @NewCustomerNumber + '" with new member number :' + @NewUwMemberNumber;
        -- Original UwCustomer Comment
        EXEC Underwriting.InsertAppComment @AppCommentId = 0,                 -- int
                                           @AppId = NULL,                     -- int
                                           @UwMemberId = @OriginalUwMemberId, -- int
                                           @UwMemberDependentId = NULL,       -- int
                                           @UnderwritingGroupId = NULL,       -- tinyint
                                           @Summary = 'Member Move',          -- varchar(1024)
                                           @Details = @Details,               -- varchar(2048)
                                           @IsCriticalComment = 0,            -- bit
                                           @CreationDate = @changeDate,       -- datetime
                                           @LastUpdateDate = NULL,            -- datetime
                                           @CreatedBy = @MovedByUserName,     -- varchar(20)
                                           @UwCustomerId = @OriginalUwCustomerId;


        -- New UwCustomer Comment
        EXEC Underwriting.InsertAppComment @AppCommentId = 0,             -- int
                                           @AppId = NULL,                 -- int
                                           @UwMemberId = @NewUwMemberId,  -- int
                                           @UwMemberDependentId = NULL,   -- int
                                           @UnderwritingGroupId = NULL,   -- tinyint
                                           @Summary = 'Member Move',      -- varchar(1024)
                                           @Details = @Details,           -- varchar(2048)
                                           @IsCriticalComment = 0,        -- bit
                                           @CreationDate = @changeDate,   -- datetime
                                           @LastUpdateDate = NULL,        -- datetime
                                           @CreatedBy = @MovedByUserName, -- varchar(20)
                                           @UwCustomerId = @NewUwCustomerId;



    
END;
 


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UWMemberMove_DeactivateMovedMemberCase]
@OriginalUwMemberId INT,
@OriginalUwMemberCaseID INT,
@DeactivationDate DATETIME,
@DeactivationReasonId TINYINT,
@MovedByUserName  VARCHAR(50)
AS
BEGIN
 
DECLARE @UwCustomerId INT =
        (
            SELECT um.UwCustomerId
            FROM Customers.UwMember AS um
            WHERE um.UwMemberId = @OriginalUwMemberId
        )

DECLARE  @AccountID INT =
        (
            SELECT a.AccountId
            FROM Finance.Account AS a
            WHERE a.UwMemberId = @OriginalUwMemberId
        ),
        @CurrentDate DATETIME = GETDATE(),
        @ChangeEffectiveDate DATETIME,
        @Source VARCHAR(100) = 'Manual Member Move Enrollment', 
        @ChangeTypeId INT,
		@EffectiveDate DATETIME,
		@CommentSummary VARCHAR(100) = 'Primary Case Deactivated', 
		@Details VARCHAR(2048),
		@number INT,
		@Plan VARCHAR(150)

		SELECT  @number = Number,
		        @EffectiveDate = umc.EffectiveDate
                    FROM    Policy.UwMemberCase AS umc
                    WHERE   UwMemberCaseId = @OriginalUwMemberCaseID

        SELECT  @Plan = p.Name + ' - ' + ISNULL(ac.FileAssemblerSuffix, '')  FROM Policy.UwMemberCase AS umc JOIN Policy.UwCustomerCase AS ucc		ON ucc.UwCustomerCaseId = umc.UwCustomerCaseId JOIN Underwriting.AppCase AS ac		ON ac.AppCaseId = ucc.AppCaseId JOIN Quoting.Quote AS q ON q.QuoteId = ac.QuoteId 		JOIN Quoting.QuotePlanVersion AS qpv ON qpv.QuoteId = q.QuoteId JOIN Plans.PlanVersion AS pv ON pv.PlanVersionId = qpv.PlanVersionId		JOIN Plans.[Plan] AS p ON p.PlanId = pv.PlanId WHERE umc.UwMemberCaseId=@OriginalUwMemberCaseID


		SET @Details = 'Primary Case ' + CAST(@number AS VARCHAR) + ' ' + @Plan + ' has been deactivated on ' + CONVERT(VARCHAR, @DeactivationDate, 101)

		 
 

/*If member has no account (Case if billed by customer), use customer account*/
IF @AccountID IS NULL
BEGIN
    SET @AccountID =
    (
        SELECT a.AccountId
        FROM Finance.Account AS a
        WHERE a.UwCustomerId = @UwCustomerId
    )
END

--BEGIN TRANSACTION
--BEGIN TRY

	/*Queue for PTD adjustment*/
    INSERT INTO Finance.AccountsQualifiedForPTDAdjustment
    (
        AccountId,
        CreationDate,
        ProcessDate,
        IsProcessed,
        Createdby
    )
    SELECT @AccountID,
           GETDATE(),
           NULL,
           0,
           @MovedByUserName
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM Finance.AccountsQualifiedForPTDAdjustment AS aqfpa
        WHERE AccountId = @AccountID
              AND IsProcessed = 0
    )

	/*Deactivate member case*/
    UPDATE Policy.UwMemberCase
    SET DeactivatedBy = @MovedByUserName,
        DeactivationDate = @DeactivationDate,
        DeactivationReasonId = @DeactivationReasonId,
        IsDeactivatedByCustomerCase = 0,
        OriginalDeactivationDate = null,
        OriginalDeactivatedBy = null
    WHERE UwMemberCaseId = @OriginalUwMemberCaseID


	/*insert an app comment*/
                    EXEC Underwriting.InsertAppComment @AppCommentId = 0, -- int
                        @AppId = NULL, -- int
                        @UwMemberId = @OriginalUwMemberId, -- int
                        @UwMemberDependentId = NULL, -- int
                        @UnderwritingGroupId = NULL, -- tinyint
                        @Summary = @CommentSummary, -- varchar(1024)
                        @Details = @Details, -- varchar(2048)
                        @IsCriticalComment = 0, -- bit
                        @CreationDate = @CurrentDate, -- datetime
                        @LastUpdateDate = NULL, -- datetime
                        @CreatedBy = @MovedByUserName, -- varchar(20)
                        @UwCustomerID = @UwCustomerID


	/*????????????????????*/
    INSERT INTO Reporting.CareMarkMemberHistory
    (
        UwMemberCaseId,
        CreationDate,
        ProcessDate,
        IsProcessed
    )
    SELECT @OriginalUwMemberCaseID,
           GETDATE(),
           NULL,
           0
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM Reporting.CareMarkMemberHistory AS cmmh
        WHERE UwMemberCaseId = @OriginalUwMemberCaseID
              AND IsProcessed = 0
    )

	 DECLARE @IsCbiDeactivation BIT = 0 
	IF(@DeactivationDate > @EffectiveDate) --Termination
	    BEGIN
	      SET @ChangeTypeId = 7
		  SET @IsCbiDeactivation = 0
        END
	 ELSE
	  BEGIN
	    SET @ChangeTypeId = 31
		SET @IsCbiDeactivation = 1
	  END
       

	/*Queue for rate engine*/
    SET @ChangeEffectiveDate = DATEADD(DAY, 1, @DeactivationDate)
    EXEC Finance.RE_SendRateEngineTask @UwCustomerId = NULL,                        -- int
                                       @UwMemberCaseId = @OriginalUwMemberCaseID,           -- int
                                       @UwCustomerCaseId = NULL,                    -- int
                                       @UwMemberId = NULL,                          -- int
                                       @ChangeTypeId = @ChangeTypeId,               -- int
                                       @ChangeEffectiveDate = @ChangeEffectiveDate, -- datetime
                                       @CreatedBy = @MovedByUserName,                        -- varchar(20)
                                       @CreationDate = @CurrentDate,                -- datetime
                                       @Source = @Source,                           -- varchar(100)
                                       @UwMemberDependentId = NULL,                 -- int
                                       @UwMemberDependentCaseId = NULL,             -- int
                                       @NewValue = @DeactivationDate,       -- varchar(100)
                                       @OldValue = NULL                             -- varchar(100)

	/* Terminate dependents */
    EXEC Policy.DeactivatePrimaryDependents @UwMemberCaseId = @OriginalUwMemberCaseID, -- int
                                            @IsCbiDeactivation = @IsCbiDeactivation            -- bit

	/*Send notification to claim scape*/
    INSERT INTO Reporting.ClaimScapeMemberHistory
    (
        MembershipNumber,
        CreationDate,
        IsProcessed
    )
    SELECT MembershipNumber,
           GETDATE(),
           0
    FROM Customers.UwMember AS um
    WHERE UwMemberId = @OriginalUwMemberId
          AND NOT EXISTS
    (
        SELECT 1
        FROM Reporting.ClaimScapeMemberHistory AS csmh
        WHERE csmh.MembershipNumber = um.MembershipNumber
              AND csmh.IsProcessed = 0
    )

--END TRY
--BEGIN CATCH
--    PRINT 'error in  ' + CAST(@OriginalUwMemberCaseID AS VARCHAR(50))
--    IF @@TRANCOUNT > 0
--        ROLLBACK TRANSACTION

--    SELECT ERROR_NUMBER() AS ErrorNumber,
--           ERROR_STATE() AS ErrorState,
--           ERROR_SEVERITY() AS ErrorSeverity,
--           ERROR_PROCEDURE() AS ErrorProcedure,
--           ERROR_LINE() AS ErrorLine,
--           ERROR_MESSAGE() AS ErrorMessage;

--END CATCH

 
--COMMIT TRANSACTION;


End


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Policy].[UwMemberMove_MoveMovedMemberCase]
    @OriginalUwMemberId INT,
    @OriginalUwMemberCaseID INT,
    @NewUwMemberID INT,
	@CoverageID INT,
    @NewUwCustomerCaseID INT,
    @NewEffectiveDate DATETIME,
    @OriginalnetworkId INT,
    @NewZipCode VARCHAR(5),
    @MovedByUserName VARCHAR(50),
    @NewUwMemberCaseID INT OUTPUT
AS
BEGIN

    DECLARE --@UwMemberId INT ,
        @NewUwCustomerID INT,
        @NewNetworkID INT,
        @number INT,
        @EnrollReasonID INT,
        @OtherReason VARCHAR(50),
        @CardPrintingRequestId INT,
        @CurrentDate DATETIME,
        @uwMemberCaseStatusHistoryId INT,
        @CertificatePrintCommandId INT,
        @Details VARCHAR(2048),
        @DetailsDepenedentCase VARCHAR(2048),
        @Plan VARCHAR(150),
        @UwMemberCaseStatusId INT,
        @ChangeTypeId INT,
        @TaskSource VARCHAR(100),
        @CommentSummary VARCHAR(100),
        @CommentSummaryDepenedentCase VARCHAR(100),
        @UndoneWaiveReason VARCHAR(1024),
        @uwMemberDependentCaseId INT,
        @UwMemberDependentCaseStatusId INT,
        @ChangeTypeIdforDepenedentCase INT,
        @UwMemberDependentId INT,
        @uwMemberDependentCaseStatusHistoryId INT,
        @DeactivationDate DATETIME,
        @DeactivatedBy VARCHAR(50),
        @DeactivationReasonId TINYINT,
        @IsDeactivatedByCustomerCase BIT,
        @MemberStatusId INT,
        @DependentStatusId INT,
        @OriginalDeactivationDate DATETIME,
        @OriginalDeactivationReasonId TINYINT,
        @PriorCoverageInsuranceCarrierName VARCHAR(50),
        @OtherCoverageInsuranceCarrierName VARCHAR(50),
		@IsFromHIAS bit,		@ExchangeAssignedPolicyNumber VARCHAR(100),		@ExchangeCaseNumber VARCHAR(100),		@DeactivationExchangeCaseNumber VARCHAR(100);


    DECLARE @MajorDentalEffectiveDate DATETIME,
            @MajorDentalPriorDuration SMALLINT,
            @MajorDentalWaitingPeriodMonths SMALLINT,
            @BasicDentalEffectiveDate DATETIME,
            @BasicDentalPriorDuration SMALLINT,
            @BasicDentalWaitingPeriodMonths SMALLINT,
            @OrthoEffectiveDate DATETIME,
            @OrthoPriorDuration SMALLINT,
            @OrthoWaitingPeriodMonths SMALLINT,
            @DepMajorDentalEffectiveDate DATETIME,
            @DepMajorDentalPriorDuration SMALLINT,
            @DepMajorDentalWaitingPeriodMonths SMALLINT,
            @DepBasicDentalEffectiveDate DATETIME,
            @DepBasicDentalPriorDuration SMALLINT,
            @DepBasicDentalWaitingPeriodMonths SMALLINT,
            @DepOrthoEffectiveDate DATETIME,
            @DepOrthoPriorDuration SMALLINT,
            @DepOrthoWaitingPeriodMonths SMALLINT,
            @DepPriorCoverageInsuranceCarrierName VARCHAR(50),
            @DepOtherCoverageInsuranceCarrierName VARCHAR(50),
			@DepUwCustomerCaseId INT;

    /*constants not in the cursor*/
    SET @CurrentDate = GETDATE();
    SET @EnrollReasonID = 6; -- (EnrollReason > OTHER)
    SET @OtherReason = 'Manual Member Move Enrollment'; --'Auto Member Move Enrollment'
    SET @UwMemberCaseStatusId = 2; --(UwMemberCaseStatus > Active)
    SET @UwMemberDependentCaseStatusId = 1; --(UwMemberDependentCaseStatus > Active)
    SET @ChangeTypeId = 11; --(ChangeType > PrimaryCaseAdded)
    SET @ChangeTypeIdforDepenedentCase = 2; --(ChangeType > DependentCaseAdded)
    SET @TaskSource = 'Manual Member Move Enrollment'; --'Auto Member Move Enrollment'
    SET @CommentSummary = 'Primary Case Added';
    SET @CommentSummaryDepenedentCase = 'Dependent Case Added';
    SET @UndoneWaiveReason = 'undone the waive in order to add the 2016 case';
    SET @MemberStatusId = 1; --(MemberStatus > Active)
    SET @DependentStatusId = 1; --(DependentStatus > Active)


    EXEC [Policy].GetAppropriateNetworkFromMovedMemberCaseToNewMemberCase @OriginalnetworkId = @OriginalnetworkId,      -- int
                                                                          @UwCustomerCaseId = @NewUwCustomerCaseID,     -- int
                                                                          @Effectivedate = @NewEffectiveDate,           -- datetime
                                                                          @ZipCode = @NewZipCode,                       -- varchar(5)
                                                                          @AppropriateNetworkId = @NewNetworkID OUTPUT; -- int


    SELECT @NewUwCustomerID = NewMember.UwCustomerId,
           @Plan = vp.Name + ' - ' + ISNULL(ac.FileAssemblerSuffix, ''),
           @MajorDentalEffectiveDate = umc.MajorDentalEffectiveDate,
           @MajorDentalPriorDuration = umc.MajorDentalPriorDuration,
           @MajorDentalWaitingPeriodMonths = umc.MajorDentalWaitingPeriodMonths,
           @OriginalUwMemberId = OldMember.UwMemberId,
           @OrthoEffectiveDate = umc.OrthoEffectiveDate,
           @OrthoPriorDuration = umc.OrthoPriorDuration,
           @OrthoWaitingPeriodMonths = umc.OrthoWaitingPeriodMonths,
           @BasicDentalEffectiveDate = umc.BasicDentalEffectiveDate,
           @BasicDentalPriorDuration = umc.BasicDentalPriorDuration,
           @BasicDentalWaitingPeriodMonths = umc.BasicDentalWaitingPeriodMonths,
           @DeactivationDate = NewCustCase.DeactivationDate,
           @DeactivatedBy = NewCustCase.DeactivatedBy,
           @DeactivationReasonId = NewCustCase.DeactivationReasonId,
           @PriorCoverageInsuranceCarrierName = umc.PriorCoverageInsuranceCarrierName,
           @OtherCoverageInsuranceCarrierName = umc.OtherCoverageInsuranceCarrierName,
		   @IsFromHIAS = umc.IsFromHIAS,		   @ExchangeAssignedPolicyNumber = umc.ExchangeAssignedPolicyNumber,		   @ExchangeCaseNumber = umc.ExchangeCaseNumber,		   @DeactivationExchangeCaseNumber = umc.DeactivationExchangeCaseNumber
    FROM Customers.UwMember AS OldMember
        LEFT JOIN Policy.UwMemberCase AS umc
            ON OldMember.UwMemberId = umc.UwMemberId
        JOIN Policy.UwCustomerCase AS NewCustCase
            ON NewCustCase.UwCustomerCaseId = @NewUwCustomerCaseID
        JOIN Policy.UwCustomerCasePlanVersion AS uccpv
            ON NewCustCase.UwCustomerCaseId = uccpv.UwCustomerCaseId
               AND IsSubPlan = 0
        JOIN Plans.vPlanVersion AS vp
            ON uccpv.PlanVersionId = vp.PlanVersionId
        JOIN Underwriting.AppCase AS ac
            ON ac.AppCaseId = NewCustCase.AppCaseId
        JOIN Quoting.Quote AS q
            ON ac.QuoteId = q.QuoteId
        JOIN Customers.UwMember AS NewMember
            ON NewMember.UwMemberId = @NewUwMemberID
    WHERE OldMember.UwMemberId = @OriginalUwMemberId
          AND (umc.UwMemberCaseId = @OriginalUwMemberCaseID OR @OriginalUwMemberCaseID = 0);


    --BEGIN TRANSACTION;
    --BEGIN TRY

        SET @number = NULL;
        SET @Details = NULL;

        SELECT @number = 1;

        SET @Details
            = 'Primary Case ' + CAST(@number AS VARCHAR) + ' ' + @Plan + ' has been added effective from '
              + CONVERT(VARCHAR, @NewEffectiveDate, 101);

                                   /*REVIEW: did you review with Abdallah ?*/
                                   /*undo the previos waive*/ --Abdallah
        UPDATE Policy.UwMemberWaive
        SET IsUndone = 1,
            UndoneBy = @MovedByUserName,
            UndoneDate = @CurrentDate,
            UndoneReason = @UndoneWaiveReason
        WHERE UwMemberId = @NewUwMemberID
              AND CoverageId = @CoverageID
              AND WaiveFromDate = '2016-01-01';


        IF @DeactivationDate IS NOT NULL
        BEGIN
            SET @IsDeactivatedByCustomerCase = 1;
        END;

        /*create the member case with active status*/
        EXEC Policy.InsertUwMemberCase @UwMemberCaseId = @NewUwMemberCaseID OUT,                                -- int
                                       @UwMemberId = @NewUwMemberID,                                            -- int
                                       @UwCustomerCaseId = @NewUwCustomerCaseID,                                -- int
                                       @Number = @number,                                                       -- tinyint
                                       @NetworkId = @NewNetworkID,                                              -- int
                                       @IsMedicallyUnderwritten = NULL,                                         -- bit
                                       @IsRenewalReviewRequired = NULL,                                         -- bit
                                       @OtherCoverageInsuranceCarrierName = @OtherCoverageInsuranceCarrierName, -- varchar(50)
                                       @OtherCoverageAddress1 = NULL,                                           -- varchar(255)
                                       @OtherCoverageAddress2 = NULL,                                           -- varchar(255)
                                       @OtherCoverageZipCode = NULL,                                            -- varchar(5)
                                       @IsPriorCoverageExist = NULL,                                            -- bit
                                       @PriorCoverageInsuranceCarrierName = @PriorCoverageInsuranceCarrierName, -- varchar(50)
                                       @PriorCoverageAddress1 = NULL,                                           -- varchar(255)
                                       @PriorCoverageAddress2 = NULL,                                           -- varchar(255)
                                       @PriorCoveragePolicyNumber = NULL,                                       -- varchar(50)
                                       @PriorCoverageEffectiveDate = NULL,                                      -- datetime
                                       @PriorCoverageTerminationDate = NULL,                                    -- datetime
                                       @IsPreExistingConditionLimitingCoverage = NULL,                          -- bit
                                       @PriorCoverageDuration = NULL,                                           -- smallint
                                       @EffectiveDate = @NewEffectiveDate,                                      -- datetime
                                       @FullCoverageEffectiveDate = NULL,                                       -- datetime
                                       @IsInReinsurancePool = NULL,                                             -- bit
                                       @ReinsurancePoolStartDate = NULL,                                        -- datetime
                                       @ReinsurancePoolEndDate = NULL,                                          -- datetime
                                       @EnrollmentReasonId = @EnrollReasonID,                                   -- tinyint
                                       @DeactivationDate = @DeactivationDate,                                   -- datetime
                                       @DeactivatedBy = @DeactivatedBy,                                         -- varchar(20)
                                       @DeactivationReasonId = @DeactivationReasonId,                           -- tinyint
                                       @IsDeactivatedByCustomerCase = @IsDeactivatedByCustomerCase,             -- bit
                                       @UndoneDate = NULL,                                                      -- datetime
                                       @UndoneBy = NULL,                                                        -- varchar(20)
                                       @UndoneReason = NULL,                                                    -- varchar(1024)
                                       @MajorDentalPriorDuration = @MajorDentalPriorDuration,                   -- smallint
                                       @MajorDentalEffectiveDate = @MajorDentalEffectiveDate,                   -- datetime
                                       @OrthoPriorDuration = @OrthoPriorDuration,                               -- smallint
                                       @OrthoEffectiveDate = @OrthoEffectiveDate,                               -- datetime
                                       @EnrollmentQualifyingEventId = NULL,                                     -- tinyint
                                       @PriorCoverageZipCode = NULL,                                            -- varchar(5)
                                       @CoverageId = @CoverageID,                                               -- int
                                       @UwMemberCaseStatusId = @UwMemberCaseStatusId,                           -- int
                                       @InsuredInitialEffectiveDate = NULL,                                     -- datetime
                                       @MajorDentalWaitingPeriodMonths = @MajorDentalWaitingPeriodMonths,       -- smallint
                                       @OrthoWaitingPeriodMonths = @OrthoWaitingPeriodMonths,                   -- smallint
                                       @OtherReason = @OtherReason,
                                       @BasicDentalEffectiveDate = @BasicDentalEffectiveDate,
                                       @BasicDentalPriorDuration = @BasicDentalPriorDuration,
                                       @BasicDentalWaitingPeriodMonths = @BasicDentalWaitingPeriodMonths,      -- nvarchar(255)
									   @IsFromHIAS = @IsFromHIAS,									   @ExchangeAssignedPolicyNumber = @ExchangeAssignedPolicyNumber,									   @ExchangeCaseNumber = @ExchangeCaseNumber,									   @DeactivationExchangeCaseNumber = @DeactivationExchangeCaseNumber;



        EXEC Policy.UWMemberMove_CopyMovedMemberAccount @NewUwMemberId = @NewUwMemberID,             -- int
                                                        @NewUwCustomerCaseID = @NewUwCustomerCaseID, -- int
                                                        @MovedByUserName = @MovedByUserName;         -- varchar(50)

        EXEC [Policy].[UwMemberMove_MoveMemberCaseAgencyHistory] @OriginalUwMemberCaseID = @OriginalUwMemberCaseID, -- int
                                                                 @NewUwMemberCaseID = @NewUwMemberCaseID;           -- int




        /*update the member waive records*/
        UPDATE Policy.[UwMemberWaive]
        SET WaiveToDate = DATEADD(DAY, -1, @NewEffectiveDate)
        WHERE UwMemberId = @NewUwMemberID
              AND CoverageId = @CoverageID
              AND IsUndone = 0
              AND WaiveToDate IS NULL
              AND WaiveFromDate < @NewEffectiveDate;

        /*insert an app comment*/
        EXEC Underwriting.InsertAppComment @AppCommentId = 0,                -- int
                                           @AppId = NULL,                    -- int
                                           @UwMemberId = @NewUwMemberID,     -- int
                                           @UwMemberDependentId = NULL,      -- int
                                           @UnderwritingGroupId = NULL,      -- tinyint
                                           @Summary = @CommentSummary,       -- varchar(1024)
                                           @Details = @Details,              -- varchar(2048)
                                           @IsCriticalComment = 0,           -- bit
                                           @CreationDate = @CurrentDate,     -- datetime
                                           @LastUpdateDate = NULL,           -- datetime
                                           @CreatedBy = @MovedByUserName,    -- varchar(20)
                                           @UwCustomerId = @NewUwCustomerID; -- int

        EXEC [Finance].[UpdateInsuredInitialEffectiveDate] @UwMemberId = @NewUwMemberID,
                                                           @UwCustomerId = NULL,
                                                           @CoverageId = @CoverageID;

        /*set member case status history*/
        EXEC Policy.InsertUwMemberCaseStatusHistory @changeDate = @CurrentDate,                                      -- datetime
                                                    @changedBy = @MovedByUserName,                                   -- varchar(20)
                                                    @uwMemberCaseId = @NewUwMemberCaseID,                            -- int
                                                    @uwMemberCaseStatusHistoryId = @uwMemberCaseStatusHistoryId OUT, -- int
                                                    @uwMemberCaseStatusId = @UwMemberCaseStatusId;                   -- tinyint

        /*add a rate engine task*/
        EXEC Finance.RE_SendRateEngineTask @UwCustomerId = NULL,                     -- int
                                           @UwMemberCaseId = @NewUwMemberCaseID,     -- int
                                           @UwCustomerCaseId = NULL,                 -- int
                                           @UwMemberId = NULL,                       -- int
                                           @ChangeTypeId = @ChangeTypeId,            -- int
                                           @ChangeEffectiveDate = @NewEffectiveDate, -- datetime
                                           @CreatedBy = @MovedByUserName,            -- varchar(20)
                                           @CreationDate = @CurrentDate,             -- datetime
                                           @Source = @TaskSource,                    -- varchar(100)
                                           @UwMemberDependentId = NULL,              -- int
                                           @UwMemberDependentCaseId = NULL,          -- int
                                           @NewValue = @NewUwMemberCaseID,           -- varchar(100)
                                           @OldValue = NULL;                         -- varchar(100)

        /*create the member app record*/
        EXEC Policy.CreateMemberAndDependentsApp @UwCustomerId = @NewUwCustomerID, -- int
                                                 @IncludeMembers = 0,              -- bit
                                                 @IncludeDependents = 0,           -- bit
                                                 @UwMemberId = @NewUwMemberID,     -- int
                                                 @UwMemberDependentId = NULL;      -- int

        /*creat the depenedent cases*/
        DECLARE depcurr CURSOR FAST_FORWARD READ_ONLY FOR
        SELECT Newdep.UwMemberDependentId,
               MajorDentalEffectiveDate,
               MajorDentalPriorDuration,
               MajorDentalWaitingPeriodMonths,
               OrthoEffectiveDate,
               OrthoPriorDuration,
               OrthoWaitingPeriodMonths,
               BasicDentalEffectiveDate,
               BasicDentalPriorDuration,
               BasicDentalWaitingPeriodMonths, --,
               PriorCoverageInsuranceCarrierName,
               OtherCoverageInsuranceCarrierName,
			   NewCustCase.UwCustomerCaseId
        --Newdep.DependentStatusId
        FROM Customers.UwMemberDependent AS Newdep
            JOIN Customers.UwMemberDependent AS OrgDep
                ON Newdep.FirstName = OrgDep.FirstName
                   AND Newdep.BirthDate = OrgDep.BirthDate
				    JOIN Policy.UwCustomerCase AS NewCustCase
            ON NewCustCase.UwCustomerCaseId = @NewUwCustomerCaseID
             LEFT JOIN Policy.UwMemberDependentCase AS Orgumdc
                ON OrgDep.UwMemberDependentId = Orgumdc.UwMemberDependentId
			
        WHERE Newdep.UwMemberId = @NewUwMemberID
              AND OrgDep.UwMemberId = @OriginalUwMemberId
			  AND Newdep.DependentStatusId = 1 --aactive
              AND (UwMemberDependentCaseId =
              (
                  SELECT TOP 1
                         innerumdc.UwMemberDependentCaseId
                  FROM Policy.UwMemberDependentCase innerumdc
                  WHERE innerumdc.UwMemberDependentId = OrgDep.UwMemberDependentId
                        AND UwMemberCaseId = @OriginalUwMemberCaseID
                  ORDER BY innerumdc.EffectiveDate DESC
              ) OR UwMemberDependentCaseId IS NULL OR @OriginalUwMemberCaseID = 0);
			 --  (@OriginalUwMemberCaseID = 0) New customer has this coverage, but the Original customer does not
			 --  (UwMemberDependentCaseId IS NULL) The new customer and the Original customer have this coverage, but it's not added to the Original dependent

        OPEN depcurr;

        FETCH NEXT FROM depcurr
        INTO @UwMemberDependentId,
             @DepMajorDentalEffectiveDate,
             @DepMajorDentalPriorDuration,
             @DepMajorDentalWaitingPeriodMonths,
             @DepOrthoEffectiveDate,
             @DepOrthoPriorDuration,
             @DepOrthoWaitingPeriodMonths,
             @DepBasicDentalEffectiveDate,
             @DepBasicDentalPriorDuration,
             @DepBasicDentalWaitingPeriodMonths,
             @PriorCoverageInsuranceCarrierName,
             @OtherCoverageInsuranceCarrierName,
             @DepUwCustomerCaseId;

        WHILE @@FETCH_STATUS = 0
        BEGIN

            SET @number = NULL;
            SET @DetailsDepenedentCase = NULL;

            SELECT @number = 1;


            SET @DetailsDepenedentCase
                = 'Dependent Case ' + CAST(@number AS VARCHAR) + ' ' + @Plan + ' has been added effective from '
                  + CONVERT(VARCHAR, @NewEffectiveDate, 101);

            UPDATE Policy.UwMemberDependentWaive
            SET IsUndone = 1,
                UndoneBy = @MovedByUserName,
                UndoneDate = @CurrentDate,
                UndoneReason = @UndoneWaiveReason
            WHERE UwMemberDependentId = @UwMemberDependentId
                  AND CoverageId = @CoverageID
                  AND WaiveFromDate = '2016-01-01';

            EXEC Policy.InsertUwMemberDependentCase @deactivatedBy = @DeactivatedBy,                                         -- varchar(20)
                                                    @deactivationDate = @DeactivationDate,                                   -- datetime
                                                    @deactivationReasonId = @DeactivationReasonId,                           -- tinyint
                                                    @effectiveDate = @NewEffectiveDate,                                      -- datetime
                                                    @enrollmentQualifyingEventId = NULL,                                     -- tinyint
                                                    @enrollmentReasonId = @EnrollReasonID,                                   -- tinyint
                                                    @fullCoverageEffectiveDate = NULL,                                       -- datetime
                                                    @isDeactivatedByCustomerCase = @IsDeactivatedByCustomerCase,             -- bit
                                                    @isInReinsurancePool = NULL,                                             -- bit
                                                    @isMedicallyUnderwritten = NULL,                                         -- bit
                                                    @IsPreExistingConditionLimitingCoverage = NULL,                          -- bit
                                                    @isPriorCoverageExist = NULL,                                            -- bit
                                                    @isRenewalReviewRequired = NULL,                                         -- bit
                                                    @IsCoveredSomeWhereElse = NULL,                                          -- bit
                                                    @majorDentalEffectiveDate = @DepMajorDentalEffectiveDate,                -- datetime
                                                    @majorDentalPriorDuration = @DepMajorDentalPriorDuration,                -- smallint
                                                    @number = @number,                                                       -- tinyint
                                                    @orthoEffectiveDate = @DepOrthoEffectiveDate,                            -- datetime
                                                    @orthoPriorDuration = @DepOrthoPriorDuration,                            -- smallint
                                                    @otherCoverageAddress1 = NULL,                                           -- varchar(255)
                                                    @otherCoverageAddress2 = NULL,                                           -- varchar(255)
                                                    @otherCoverageInsuranceCarrierName = @OtherCoverageInsuranceCarrierName, -- varchar(50)
                                                    @otherCoverageZipCode = NULL,                                            -- varchar(5)
                                                    @priorCoverageAddress1 = NULL,                                           -- varchar(255)
                                                    @priorCoverageAddress2 = NULL,                                           -- varchar(255)
                                                    @priorCoverageDuration = NULL,                                           -- smallint
                                                    @priorCoverageEffectiveDate = NULL,                                      -- datetime
                                                    @priorCoverageInsuranceCarrierName = @PriorCoverageInsuranceCarrierName, -- varchar(50)
                                                    @priorCoveragePolicyNumber = NULL,                                       -- varchar(50)
                                                    @priorCoverageTerminationDate = NULL,                                    -- datetime
                                                    @priorCoverageZipCode = NULL,                                            -- varchar(5)
                                                    @reinsurancePoolEndDate = NULL,                                          -- datetime
                                                    @reinsurancePoolStartDate = NULL,                                        -- datetime
                                                    @undoneBy = NULL,                                                        -- varchar(20)
                                                    @undoneDate = NULL,                                                      -- datetime
                                                    @undoneReason = NULL,                                                    -- varchar(1024)
                                                    @uwMemberCaseId = @NewUwMemberCaseID,                                    -- int
                                                    @uwMemberDependentId = @UwMemberDependentId,                             -- int
                                                    @UwMemberDependentCaseStatusId = @UwMemberDependentCaseStatusId,         -- tinyint
                                                    @IsDeactivatedByPrimaryCase = NULL,                                      -- bit
                                                    @IsCoveredForPediatricDentalOnlyNoAdultCoverage = 0,                     -- bit
                                                    @MajorDentalWaitingPeriodMonths = @DepMajorDentalWaitingPeriodMonths,    -- smallint
                                                    @OrthoWaitingPeriodMonths = @DepOrthoWaitingPeriodMonths,                -- smallint,
                                                    @BasicDentalEffectiveDate = @DepBasicDentalEffectiveDate,
                                                    @BasicDentalPriorDuration = @DepBasicDentalPriorDuration,
                                                    @BasicDentalWaitingPeriodMonths = @DepBasicDentalWaitingPeriodMonths,
                                                    @OtherReason = @OtherReason,
                                                    @uwMemberDependentCaseId = @uwMemberDependentCaseId OUT;                 -- int

            --the change type for dependent case add need to be changed to partial
            IF DAY(@NewEffectiveDate) <> 1
            BEGIN
                SET @ChangeTypeIdforDepenedentCase = 44; --DependentCaseAddedPartial
            END;

            EXEC Finance.RE_SendRateEngineTask @UwCustomerId = NULL,                                -- int
                                               @UwMemberCaseId = NULL,                              -- int
                                               @UwCustomerCaseId = NULL,                            -- int
                                               @UwMemberId = NULL,                                  -- int
                                               @ChangeTypeId = @ChangeTypeIdforDepenedentCase,      -- int
                                               @ChangeEffectiveDate = @NewEffectiveDate,            -- datetime
                                               @CreatedBy = @MovedByUserName,                       -- varchar(20)
                                               @CreationDate = @CurrentDate,                        -- datetime
                                               @Source = @TaskSource,                               -- varchar(100)
                                               @UwMemberDependentId = NULL,                         -- int
                                               @UwMemberDependentCaseId = @uwMemberDependentCaseId, -- int
                                               @NewValue = @uwMemberDependentCaseId,                -- varchar(100)
                                               @OldValue = NULL;


            EXEC Reporting.InsertBenesysMemberHistory @UwCustomerCaseId = NULL,                            -- int
                                                      @UwMemberCaseId = NULL,                              -- int
                                                      @UwMemberDependentCaseId = @uwMemberDependentCaseId; -- int


            UPDATE Policy.UwMemberDependentWaive
            SET WaiveToDate = DATEADD(DAY, -1, @NewEffectiveDate)
            WHERE UwMemberDependentId = @UwMemberDependentId
                  AND CoverageId = @CoverageID
                  AND IsUndone = 0
                  AND WaiveToDate IS NULL
                  AND WaiveFromDate < @NewEffectiveDate;


            EXEC Underwriting.InsertAppComment @AppCommentId = 0,                           -- int
                                               @AppId = NULL,                               -- int
                                               @UwMemberId = @NewUwMemberID,                -- int
                                               @UwMemberDependentId = @UwMemberDependentId, -- int
                                               @UnderwritingGroupId = NULL,                 -- tinyint
                                               @Summary = @CommentSummaryDepenedentCase,    -- varchar(1024)
                                               @Details = @DetailsDepenedentCase,           -- varchar(2048)
                                               @IsCriticalComment = 0,                      -- bit
                                               @CreationDate = @CurrentDate,                -- datetime
                                               @LastUpdateDate = NULL,                      -- datetime
                                               @CreatedBy = @MovedByUserName,               -- varchar(20)
                                               @UwCustomerId = @NewUwCustomerID;

            EXEC Policy.InsertUwMemberDependentCaseStatusHistory @changeDate = @CurrentDate,                                                        -- datetime
                                                                 @changedBy = @MovedByUserName,                                                     -- varchar(20)
                                                                 @uwMemberDependentCaseId = @uwMemberDependentCaseId,                               -- int
                                                                 @uwMemberDependentCaseStatusHistoryId = @uwMemberDependentCaseStatusHistoryId OUT, -- int
                                                                 @uwMemberDependentCaseStatusId = 1;                                                -- tinyint

            EXEC Policy.CreateMemberAndDependentsApp @UwCustomerId = @NewUwCustomerID, -- int
                                                     @IncludeMembers = 0,              -- bit
                                                     @IncludeDependents = 0,           -- bit
                                                     @UwMemberId = NULL,               -- int
                                                     @UwMemberDependentId = @UwMemberDependentId;

            FETCH NEXT FROM depcurr
            INTO @UwMemberDependentId,
                 @DepMajorDentalEffectiveDate,
                 @DepMajorDentalPriorDuration,
                 @DepMajorDentalWaitingPeriodMonths,
                 @DepOrthoEffectiveDate,
                 @DepOrthoPriorDuration,
                 @DepOrthoWaitingPeriodMonths,
                 @DepBasicDentalEffectiveDate,
                 @DepBasicDentalPriorDuration,
                 @DepBasicDentalWaitingPeriodMonths,
                 @PriorCoverageInsuranceCarrierName,
                 @OtherCoverageInsuranceCarrierName,
				 @DepUwCustomerCaseId;
        END;

        CLOSE depcurr;
        DEALLOCATE depcurr;

		 --IF @@TRANCOUNT > 0
   -- BEGIN
   --     COMMIT TRANSACTION;
   -- --INSERT  INTO temp2016casestatus
   -- --        ( UwMemberID, UwMemberCaseID )
   -- --VALUES  ( @UwMemberId, @uwMemberCaseId )
   -- END;


   -- END TRY
   -- BEGIN CATCH
   --     SELECT ERROR_MESSAGE();
   --     IF CURSOR_STATUS('global', 'depcur') >= -1
   --     BEGIN
   --         CLOSE depcur;
   --         DEALLOCATE depcur;
   --     END;

   --     IF @@TRANCOUNT > 0
   --         ROLLBACK TRANSACTION;
   -- --INSERT  INTO temp2016casestatus
   -- --        ( UwMemberID, UwMemberCaseID )
   -- --VALUES  ( @UwMemberId, NULL )
   -- END CATCH;

   

END;



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UWMemberMove_CopyMovedMemberACHAccount]
    @OriginalUwMemberId INT,
    @NewUwMemberID INT
AS
BEGIN
    DECLARE @OriginalACHAccountId INT = NULL,
            @NewACHAccountId INT,
            @NewAccountId INT,
            @AccountTypeId INT,
            @AbaNumber VARCHAR(9),
            @AccountNumber VARCHAR(17),
            @BankAccountTypeId INT,
            @ACHStatusId INT,
            @IsSigned BIT,
            @SignDate DATETIME,
            @ProcessingDay INT,
            @NextProcessingDate DATETIME,
            @RecurringAmount MONEY;

    SELECT @OriginalACHAccountId = ACHAccountId
    FROM Finance.ACHAccount
    WHERE AccountId =
    (
        SELECT AccountId
        FROM Finance.Account OrigAcc
        WHERE OrigAcc.UwMemberId = @OriginalUwMemberId
    );

    -- Get the new Account Id and type to be used in creating a new ACHAccount
    SELECT @NewAccountId = NewAcc.AccountId,
           @AccountTypeId = NewAcc.AccountTypeId
    FROM Finance.Account AS NewAcc
    WHERE NewAcc.UwMemberId = @NewUwMemberID;

    IF (@OriginalACHAccountId IS NOT NULL)
    BEGIN

        IF (@NewAccountId IS NOT NULL)
        BEGIN
            -- Getting The Original ACHAccount Data
            SELECT @AbaNumber = OriginalACHAcc.AbaNumber,
                   @AccountNumber = OriginalACHAcc.AccountNumber,
                   @BankAccountTypeId = OriginalACHAcc.BankAccountTypeId,
                   @ACHStatusId = OriginalACHAcc.ACHStatusId,
                   @IsSigned = OriginalACHAcc.IsSigned,
                   @SignDate = OriginalACHAcc.SignDate,
                   @ProcessingDay = OriginalACHAcc.ProcessingDay,
                   @NextProcessingDate = OriginalACHAcc.NextProcessingDate,
                   @OriginalACHAccountId = OriginalACHAcc.ACHAccountId,
                   @RecurringAmount = OriginalACHAcc.RecurringAmount
            FROM Finance.ACHAccount AS OriginalACHAcc
            WHERE OriginalACHAcc.AccountId =
            (
                SELECT AccountId
                FROM Finance.Account OriginalAcc
                WHERE OriginalAcc.UwMemberId = @OriginalUwMemberId
            );

            -- Creating a new ACHAccount
            EXEC Finance.InsertACHAccount @abaNumber = @AbaNumber,                   -- varchar(9)
                                          @accountId = @NewAccountId,                -- int
                                          @accountNumber = @AccountNumber,           -- varchar(17)
                                          @accountTypeId = @AccountTypeId,           -- tinyint
                                          @achAccountId = @NewACHAccountId OUT,      -- int
                                          @achStatusId = @ACHStatusId,               -- tinyint
                                          @bankAccountTypeId = @BankAccountTypeId,   -- tinyint
                                          @isSigned = @IsSigned,                     -- bit
                                          @processingDay = @ProcessingDay,           -- tinyint
                                          @signDate = @SignDate,                     -- smalldatetime
                                          @NextProcessingDate = @NextProcessingDate, -- smalldatetime
                                          @RecurringAmount = @RecurringAmount;

        END;

        DECLARE @ACHStatus VARCHAR(15),
                @InactiveStatus INT;

        SELECT @ACHStatus = Code
        FROM Finance.ACHStatus AS [as]
        WHERE ACHStatusId = @ACHStatusId;

        -- If Original ACHAccount is active then it will be deactivated
        IF @ACHStatus = 'Active'
        BEGIN

            SELECT @InactiveStatus = ACHStatusId
            FROM Finance.ACHStatus AS [as]
            WHERE Code = 'Inactive';

            UPDATE Finance.ACHAccount
            SET ACHStatusId = @InactiveStatus
            WHERE ACHAccountId = @OriginalACHAccountId;
        END;
    END;

END;





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [Policy].GetAppropriateNetworkFromMovedMemberCaseToNewMemberCase
    @OriginalnetworkId INT,
    @UwCustomerCaseId INT,
    @Effectivedate DATETIME,
    @ZipCode VARCHAR(5) = NULL,
    @AppropriateNetworkId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UwMemberId INT,
	        @returnedNetworks INT ,
            @IncludeNullZipCodeFragment BIT = 1;

    DECLARE @NetworksTable TABLE
    (
        NetworkId INT,
        Code VARCHAR(2),
        [NAME] VARCHAR(255)
    );

    INSERT INTO @NetworksTable
    (
        NetworkId,
        Code,
        [NAME]
    )
    EXEC [Policy].[GetAvailableUwMemberNetworks] @UwCustomerCaseId = @UwCustomerCaseId, -- int
                                                 @MemberEffectivedate = @Effectivedate, -- datetime
                                                 @UwMemberId = NULL,                    -- int
                                                 @IncludeNullZipCodeFragment = 1,       -- bit
                                                 @ZipCode = @ZipCode;                   -- varchar(5)

    SELECT @returnedNetworks = COUNT(NetworkId)
    FROM @NetworksTable
    WHERE NetworkId = @OriginalnetworkId;



    IF (@returnedNetworks >0)
	BEGIN
	 SET @AppropriateNetworkId= @OriginalnetworkId
	
    END
	ELSE 
    BEGIN
        SELECT TOP 1
               @AppropriateNetworkId = NetworkId
        FROM @NetworksTable;
	
    END;
END;


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UwMemberMove_MoveMemberCaseAgencyHistory]
    @OriginalUwMemberCaseID INT,
    @NewUwMemberCaseID INT
AS
BEGIN

    DECLARE @OriginalCaseMarketSegmentID AS INT,
            @NewCaseMarketSegmentID AS INT,
			@OriginalUwCustomerID AS INT,
			@NewUwCustomerID AS INT

    SET @OriginalCaseMarketSegmentID =
    (
        SELECT ISNULL( uc.MarketingSegmentId , 0) -- 0 instead of null marketSegment
        FROM Policy.UwMemberCase AS umc
            JOIN Customers.UwMember AS um
                ON um.UwMemberId = umc.UwMemberId
            JOIN Customers.UwCustomer AS uc
                ON uc.UwCustomerId = um.UwCustomerId
        WHERE umc.UwMemberCaseId = @OriginalUwMemberCaseID
    )

    SET @NewCaseMarketSegmentID =
    (
        SELECT  ISNULL( uc.MarketingSegmentId , 0) -- 0 instead of null marketSegment
        FROM Policy.UwMemberCase AS umc
            JOIN Customers.UwMember AS um
                ON um.UwMemberId = umc.UwMemberId
            JOIN Customers.UwCustomer AS uc
                ON uc.UwCustomerId = um.UwCustomerId
        WHERE umc.UwMemberCaseId = @NewUwMemberCaseID
    )

    SET @OriginalUwCustomerID =
    (
        SELECT uc.UwCustomerId
        FROM Policy.UwMemberCase AS umc
            JOIN Customers.UwMember AS um
                ON um.UwMemberId = umc.UwMemberId
            JOIN Customers.UwCustomer AS uc
                ON uc.UwCustomerId = um.UwCustomerId
        WHERE umc.UwMemberCaseId = @OriginalUwMemberCaseID
    )

    SET @NewUwCustomerID =
    (
        SELECT uc.UwCustomerId
        FROM Policy.UwMemberCase AS umc
            JOIN Customers.UwMember AS um
                ON um.UwMemberId = umc.UwMemberId
            JOIN Customers.UwCustomer AS uc
                ON uc.UwCustomerId = um.UwCustomerId
        WHERE umc.UwMemberCaseId = @NewUwMemberCaseID
    )

	-- GET AGENCY INFO OF ORIGINAL "MEMBER CASE"
    SELECT umcah.UwMemberCaseAgencyHistoryId
    INTO #uwMemberCaseAgencyHistoryIds
    FROM Finance.UwMemberCaseAgencyHistory AS umcah
    WHERE umcah.UwMemberCaseId = @OriginalUwMemberCaseID
          AND ISNULL(umcah.EffectiveDateTo, umcah.EffectiveDateFrom) >= umcah.EffectiveDateFrom

	-- GET AGENCY INFO OF ORIGINAL MEMBER'S "CUSTOMER" 
	SELECT * INTO #UwCustomerAgencyHistory FROM Finance.UwCustomerAgencyHistory AS ucah
	JOIN Quoting.Agency AS a ON a.AgencyId = ucah.SalesAgentId 
	WHERE ucah.UwCustomerId = @OriginalUwCustomerID
	AND ISNULL(ucah.EffectiveDateTo, ucah.EffectiveDateFrom) >= ucah.EffectiveDateFrom
    
	PRINT @OriginalCaseMarketSegmentID
	PRINT @NewCaseMarketSegmentID
	-- GET THE CONFIGURATION, SHOULD WE MOVE AGENT INFO ?
    SELECT *
    INTO #MoveMemberCaseAgencyHistoryConfiguration
    FROM [Policy].[MoveMemberCaseAgencyHistoryConfiguration] AS mmcahc
    WHERE mmcahc.[OriginalMarketingSegmentID] = @OriginalCaseMarketSegmentID
          AND mmcahc.[NewMarketingSegmentID] = @NewCaseMarketSegmentID
          AND mmcahc.[MoveAgencyHistory] = 1

	-- IF A CONFIG EXISTS FOR MOVING AGENT INFO AS PER SOURCE AND NEW MARKET SEGMENTS
    IF EXISTS (SELECT 1  FROM #MoveMemberCaseAgencyHistoryConfiguration)
     
    BEGIN

		-- IF SOURCE AGENT INFO IS MEMBER CASE AGENCY HISTORY 
        IF (0 = 
           (
               SELECT TOP 1
                      mmcahc.[UseCustomerAgencyHistory]
               FROM #MoveMemberCaseAgencyHistoryConfiguration AS mmcahc
           )
           )
            INSERT INTO Finance.UwMemberCaseAgencyHistory
            (
                UwMemberCaseId,
                NationalAgentId,
                Name,
                AgencyId,
                EffectiveDateFrom,
                EffectiveDateTo,
                IsEffectiveDateRolledForward,
                MappedBy,
                CreationDate,
                UpdateDate
            )
            SELECT @NewUwMemberCaseID,
                   umcah.NationalAgentId,
                   umcah.Name,
                   umcah.AgencyId,
                   umcah.EffectiveDateFrom,
                   umcah.EffectiveDateTo,
                   0,
                   umcah.MappedBy,
                   GETDATE(),
                   NULL
            FROM Finance.UwMemberCaseAgencyHistory AS umcah
                JOIN #uwMemberCaseAgencyHistoryIds AS umcahi
                    ON umcahi.UwMemberCaseAgencyHistoryId = umcah.UwMemberCaseAgencyHistoryId

        -- IF SOURCE AGENT INFO IS CUSTOMER AGENCY HISTORY 
		ELSE
        BEGIN
            INSERT INTO Finance.UwMemberCaseAgencyHistory
            (
                UwMemberCaseId,
                NationalAgentId,
                Name,
                AgencyId,
                EffectiveDateFrom,
                EffectiveDateTo,
                IsEffectiveDateRolledForward,
                MappedBy,
                CreationDate,
                UpdateDate
            )
            SELECT @NewUwMemberCaseID,
                   ucah.NationalAgentID,
                   ucah.Name,
                   ucah.SalesAgentId,
                   ucah.EffectiveDateFrom,
                   ucah.EffectiveDateTo,
                   0,
                   '', --Username
                   GETDATE(),
                   NULL
            FROM #UwCustomerAgencyHistory AS ucah
        END
    END


END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UWMemberMove_CopyMovedMemberAccount]
    @NewUwMemberId INT,
    @NewUwCustomerCaseID INT,
	@MovedByUserName VARCHAR(50)
AS
BEGIN

        DECLARE @InsuredTypeId INT 
        SELECT  @InsuredTypeId = InsuredTypeId
        FROM    Plans.InsuredType
        WHERE   Name = 'Group-Individual' 
      
        
        DECLARE @AccountTypeId INT 
        SELECT  @AccountTypeId = AccountTypeId
        FROM    Finance.AccountType
        WHERE   Code = 'Primary' 
    
		IF EXISTS ( SELECT  1
        FROM    Policy.UwCustomerCase cc
                INNER JOIN Underwriting.AppCase appc ON cc.AppCaseId = appc.AppCaseId
                INNER JOIN Policy.UwCustomerCasePlanVersion ccpv ON cc.UwCustomerCaseId = ccpv.UwCustomerCaseId
                INNER JOIN Plans.vPlanVersion vpv ON ccpv.PlanVersionId = vpv.PlanVersionId
        WHERE   cc.UwCustomerCaseId = @NewUwCustomerCaseID
        AND		InsuredTypeId  =@InsuredTypeId
        AND		IsBillDirect = 1
        )
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM Finance.Account WHERE UwMemberId = @NewUwMemberId)
				INSERT INTO Finance.Account
				        ( UwCustomerId ,
				          UwMemberId ,
				          AccountTypeId ,
				          PayThroughDate ,
				          BillThroughDate ,
				          AgencyId ,
				          VendorId,
				          ActualPayThroughDate
				        )
				VALUES  ( NULL , -- UwCustomerId - int
				          @NewUwMemberId , -- UwMemberId - int
				          @AccountTypeId , -- AccountTypeId - tinyint
				          NULL , -- PayThroughDate - smalldatetime
				          NULL , -- BillThroughDate - smalldatetime
				          NULL , -- AgencyId - int
				          NULL,  -- VendorId - int
				          NULL
				        )
		
		END

			INSERT INTO Finance.AccountsQualifiedForPTDAdjustment
				( AccountId ,
				    CreationDate ,
				    ProcessDate ,
				    IsProcessed,
					Createdby
				)
				
		SELECT	AccountId,
				GETDATE(),
				NULL,
				0,
				@MovedByUserName
		FROM    Customers.UwMember INNER JOIN 
				Finance.Account ON Customers.UwMember.UwMemberId = Finance.Account.UwMemberId
        WHERE	Finance.Account.UwMemberId = @NewUwMemberId
		AND NOT EXISTS (SELECT 1 FROM Finance.AccountsQualifiedForPTDAdjustment orig WHERE orig.AccountId = Account.AccountId AND IsProcessed = 0)
END;



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Policy].[RetrieveUwCustomerSummaries]
    @UwCustomerId INT ,
    @CustomerNumber VARCHAR(8) ,
    @NameOrDoingBusinessAs VARCHAR(255) ,
    @ZipCode VARCHAR(5) ,
    @StateCode VARCHAR(2) ,
    @MedicallyUnderwrittenType TINYINT ,
    @MemberNumber VARCHAR(22) = NULL ,
    @MemberFirstName VARCHAR(50) = NULL ,
    @MemberLastName VARCHAR(50) = NULL ,
    @DependentFirstName VARCHAR(50) = NULL ,
    @DependentLastName VARCHAR(50) = NULL ,
    @ExchangeAlternateId VARCHAR(50) = NULL,
    @SSN VARCHAR(9) = NULL,
	@MarketingSegmentId INT = NULL,
	@ExcludeExchange BIT = NULL,
    @PageNumber INT = 1 ,
    @PageSize INT = NULL ,
    @SortField VARCHAR(128) = NULL ,
    @SortDirection VARCHAR(20) = NULL

    WITH RECOMPILE
AS 
    BEGIN
/*
	@MedicallyUnderwrittenType
	0 nothing
	1 primaries
	2 dependents
*/
        DECLARE @LowerLimit INT ,
            @UpperLimit INT ,
            @MemberFirstNameSearch VARCHAR(100) ,
            @MemberLastNameSearch VARCHAR(100) ,
            @DependentFirstNameSearch VARCHAR(100) ,
            @DependentLastNameSearch VARCHAR(100)

        SET @MemberFirstNameSearch = '"' + ISNULL(@MemberFirstName, '') + '*"'	
        SET @MemberLastNameSearch = '"' + ISNULL(@MemberLastName, '') + '*"'	
        SET @DependentFirstNameSearch = '"' + ISNULL(@DependentFirstName, '')
            + '*"'	
        SET @DependentLastNameSearch = '"' + ISNULL(@DependentLastName, '')
            + '*"'	

        SET @LowerLimit = ( @PageNumber - 1 ) * @PageSize + 1
        SET @UpperLimit = @PageNumber * @PageSize

        SELECT  COUNT(1) TotalRecords
        FROM    Policy.[vUwCustomerSummary]
        WHERE   ( @UwCustomerId IS NULL
                  OR UwCustomerId = @UwCustomerId
                )
                AND ( @CustomerNumber IS NULL
                      OR CustomerNumber = @CustomerNumber
                    )
                AND ( @NameOrDoingBusinessAs IS NULL
                      OR Name LIKE @NameOrDoingBusinessAs + '%'
                      OR DoingBusinessAs LIKE @NameOrDoingBusinessAs + '%'
                    )
                AND ( @ZipCode IS NULL
                      OR ZipCode = @ZipCode
                    )
                AND ( @StateCode IS NULL
                      OR StateCode LIKE @StateCode + '%'
                    )
				AND (@MarketingSegmentId IS NULL OR MarketingSegmentId=@MarketingSegmentId)
				AND (@ExcludeExchange IS NULL OR (MarketingSegmentId NOT IN (6) OR MarketingSegmentId IS null))
                AND ( CustomerStatusCode = 'Customer_Inforce'
                      OR CustomerStatusCode = 'Customer_Terminated'
                      OR CustomerStatusCode = 'Customer_Delinquent'
                      OR ( ( CustomerStatusCode = 'Customer_Prospect'
                             OR CustomerStatusCode = 'Customer_Applicant'
                           )
                           AND EXISTS ( SELECT TOP 1
                                                1
                                        FROM    Policy.UwCustomerCase
                                        WHERE   UwCustomerId = vUwCustomerSummary.UwCustomerId )
                         )
                    )
                AND ( ( @MemberNumber IS NULL
                        AND @MemberFirstName IS NULL
                        AND @MemberLastName IS NULL
                      )
                      OR EXISTS ( SELECT TOP 1
                                            1
                                  FROM      Customers.UwMember mem
                                  WHERE     mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                            AND ( @MemberNumber IS NULL
                                                  OR mem.MemberNumber = @MemberNumber
                                                  OR mem.MembershipNumber = @MemberNumber
                                                )
                                            AND ( @MemberFirstName IS NULL
                                                  OR CONTAINS ( mem.FirstName, @MemberFirstNameSearch )
                                                )
                                            AND ( @MemberLastName IS NULL
                                                  OR CONTAINS ( mem.LastName, @MemberLastNameSearch )
                                                )  )
                    )
                AND( @SSN IS NULL
					OR EXISTS(	SELECT TOP 1 1 
								FROM Customers.UwMember mem
								WHERE  mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
								AND mem.SSN = @SSN
					
							)
					)
                
                AND ( ( @DependentFirstName IS NULL
                        AND @DependentLastName IS NULL
                      )
                      OR EXISTS ( SELECT    1
                                  FROM      Customers.UwMemberDependent dep
                                            INNER JOIN Customers.UwMember mem ON dep.UwMemberId = mem.UwMemberId
                                  WHERE     mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                            AND ( @DependentFirstName IS NULL
												  --OR dep.FirstName LIKE @DependentFirstName + '%'
                                                  OR CONTAINS ( dep.FirstName, @DependentFirstNameSearch )
                                                )
                                            AND ( @DependentLastName IS NULL
                                                  --OR dep.lastname like @DependentLastName +'%'
                                                  OR CONTAINS ( dep.LastName, @DependentLastNameSearch )
                                                ) )
                    )
                AND ( @MedicallyUnderwrittenType = 0
                      OR ( @MedicallyUnderwrittenType = 1
                           AND EXISTS ( SELECT  1
                                        FROM    Customers.UwMember mem
                                                INNER JOIN Customers.MemberStatus memStatus ON mem.MemberStatusId = memStatus.MemberStatusId
                                                INNER JOIN Policy.UwMemberCase memCase ON mem.UwMemberId = memCase.UwMemberId
                                                INNER JOIN Policy.UwMemberCaseStatus mcStatus ON memCase.UwMemberCaseStatusId = mcStatus.UwMemberCaseStatusId
                                        WHERE   mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                AND mcStatus.Code NOT IN (
                                                'Undone' )
                                                AND EffectiveDate <= ISNULL(DeactivationDate,
                                                              EffectiveDate)
                                                --AND memStatus.Code <> 'Inactive'
                                                AND memCase.IsMedicallyUnderwritten = 0 )
                         )
                      OR ( @MedicallyUnderwrittenType = 2
                           AND EXISTS ( SELECT  1
                                        FROM    Customers.UwMember mem
                                                INNER JOIN Customers.UwMemberDependent dep ON mem.UwMemberId = dep.UwMemberId
                                                INNER JOIN Customers.DependentStatus depStatus ON dep.DependentStatusId = depStatus.DependentStatusId
                                                INNER JOIN Policy.UwMemberDependentCase depCase ON dep.UwMemberDependentId = depCase.UwMemberDependentId
                                                INNER JOIN Policy.UwMemberDependentCaseStatus DcStatus ON depCase.UwMemberDependentCaseStatusId = DcStatus.UwMemberDependentCaseStatusId
                                        WHERE   mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                AND DcStatus.Code NOT IN (
                                                'Undone' )
                                                AND EffectiveDate <= ISNULL(DeactivationDate,
                                                              EffectiveDate)
                                                --AND depStatus.Code <> 'Inactive'
                                                AND depCase.IsMedicallyUnderwritten = 0 )
                         )
                    )
                AND (@ExchangeAlternateId IS NULL
					 OR EXISTS ( SELECT  1 FROM Customers.UwMemberExchangeIdentifier exch
                                 INNER JOIN Customers.UwMember mem ON exch.UwMemberId = mem.UwMemberId
                                 WHERE mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId 
                                 AND exch.ExchangeAlternateId = @ExchangeAlternateId
                               )
                
					)
                

        IF ISNULL(@SortDirection, 'Ascending') = 'Ascending' 
            BEGIN
                SELECT  UwCustomerId ,
                        CustomerNumber ,
                        Name ,
                        DoingBusinessAs ,
                        ZipCode ,
                        StateCode ,
                        CustomerStatusId ,
                        CustomerStatusName ,
                        CityName,
						MarketingSegmentName
                FROM    ( SELECT    UwCustomerId ,
                                    CustomerNumber ,
                                    Name ,
                                    DoingBusinessAs ,
                                    ZipCode ,
                                    StateCode ,
                                    CustomerStatusId ,
                                    CustomerStatusName ,
                                    CityName ,
									MarketingSegmentName,
                                    CASE ISNULL(@SortField, 'Default')
                                      WHEN 'Default'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Name ASC )
                                      WHEN 'CustomerNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CustomerNumber ASC, Name ASC )
                                      WHEN 'Name'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Name ASC, Name ASC )
                                      WHEN 'DoingBusinessAs'
                                      THEN ROW_NUMBER() OVER ( ORDER BY DoingBusinessAs ASC, Name ASC )
                                      WHEN 'ZipCode'
                                      THEN ROW_NUMBER() OVER ( ORDER BY ZipCode ASC, Name ASC )
                                      WHEN 'StateCode'
                                      THEN ROW_NUMBER() OVER ( ORDER BY StateCode ASC, Name ASC )
                                      WHEN 'CustomerStatusId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CustomerStatusId ASC, Name ASC )
                                      WHEN 'CustomerStatusName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CustomerStatusName ASC, Name ASC )
                                      WHEN 'CityName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CityName ASC, Name ASC )
									    WHEN 'MarketingSegmentName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MarketingSegmentName ASC, Name ASC )
                                    END AS RowNum
                          FROM      Policy.[vUwCustomerSummary]
                          WHERE     ( @UwCustomerId IS NULL
                                      OR UwCustomerId = @UwCustomerId
                                    )
                                    AND ( @CustomerNumber IS NULL
                                          OR CustomerNumber = @CustomerNumber
                                        )
                                    AND ( @NameOrDoingBusinessAs IS NULL
                                          OR Name LIKE @NameOrDoingBusinessAs
                                          + '%'
                                          OR DoingBusinessAs LIKE @NameOrDoingBusinessAs
                                          + '%'
                                        )
                                    AND ( @ZipCode IS NULL
                                          OR ZipCode = @ZipCode
                                        )
                                    AND ( @StateCode IS NULL
                                          OR StateCode LIKE @StateCode + '%'
                                        )
									AND (@MarketingSegmentId IS NULL OR MarketingSegmentId=@MarketingSegmentId)
										AND  (@ExcludeExchange IS NULL OR (MarketingSegmentId NOT IN (6) OR MarketingSegmentId IS null))
                                    AND ( CustomerStatusCode = 'Customer_Inforce'
                                          OR CustomerStatusCode = 'Customer_Terminated'
                                          OR CustomerStatusCode = 'Customer_Delinquent'
                                          OR ( ( CustomerStatusCode = 'Customer_Prospect'
                                                 OR CustomerStatusCode = 'Customer_Applicant'
                                               )
                                               AND EXISTS ( SELECT TOP 1
                                                              1
                                                            FROM
                                                              Policy.UwCustomerCase
                                                            WHERE
                                                              UwCustomerId = vUwCustomerSummary.UwCustomerId )
                                             )
                                        )
                                    AND ( ( @MemberNumber IS NULL
                                            AND @MemberFirstName IS NULL
                                            AND @MemberLastName IS NULL                                            
                                          )
                                          OR EXISTS ( SELECT TOP 1
                                                              1
                                                      FROM    Customers.UwMember mem
                                                      WHERE   mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND ( @MemberNumber IS NULL
                                                              OR mem.MemberNumber = @MemberNumber
                                                              OR mem.MembershipNumber = @MemberNumber
                                                              )
                                                              AND ( @MemberFirstName IS NULL
                                                              OR CONTAINS ( mem.FirstName, @MemberFirstNameSearch )
                                                              )
                                                              AND ( @MemberLastName IS NULL
                                                              OR CONTAINS ( mem.LastName, @MemberLastNameSearch )
                                                              )  
												    )
                                        )
                                    AND( @SSN IS NULL
											OR EXISTS(	SELECT TOP 1 1 
											FROM Customers.UwMember mem
											WHERE  mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
											AND mem.SSN = @SSN )
										)
                                    AND ( ( @DependentFirstName IS NULL
                                            AND @DependentLastName IS NULL
                                          )
                                          OR EXISTS ( SELECT  1
                                                      FROM    Customers.UwMemberDependent dep
                                                              INNER JOIN Customers.UwMember mem ON dep.UwMemberId = mem.UwMemberId
                                                      WHERE   mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND ( @DependentFirstName IS NULL
                                                              OR CONTAINS ( dep.FirstName, @DependentFirstNameSearch )
                                                              --OR dep.FirstName LIKE @DependentFirstName + '%'
                                                              )
                                                              AND ( @DependentLastName IS NULL
                                                              --OR dep.lastname like @DependentLastName +'%'
                                                              OR CONTAINS ( dep.LastName, @DependentLastNameSearch )
                                                              ) )
                                        )
                                    AND ( @MedicallyUnderwrittenType = 0
                                          OR ( @MedicallyUnderwrittenType = 1
                                               AND EXISTS ( SELECT
                                                              1
                                                            FROM
                                                              Customers.UwMember mem
                                                              INNER JOIN Customers.MemberStatus memStatus ON mem.MemberStatusId = memStatus.MemberStatusId
                                                              INNER JOIN Policy.UwMemberCase memCase ON mem.UwMemberId = memCase.UwMemberId
                                                              INNER JOIN Policy.UwMemberCaseStatus mcStatus ON memCase.UwMemberCaseStatusId = mcStatus.UwMemberCaseStatusId
                                                            WHERE
                                                              mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND mcStatus.Code NOT IN (
                                                              'Undone' )
                                                              --AND memStatus.Code <> 'Inactive'
                                                              AND EffectiveDate <= ISNULL(DeactivationDate,
                                                              EffectiveDate)
                                                              AND memCase.IsMedicallyUnderwritten = 0 )
                                             )
                                          OR ( @MedicallyUnderwrittenType = 2
                                               AND EXISTS ( SELECT
                                                              1
                                                            FROM
                                                              Customers.UwMember mem
                                                              INNER JOIN Customers.UwMemberDependent dep ON mem.UwMemberId = dep.UwMemberId
                                                              INNER JOIN Customers.DependentStatus depStatus ON dep.DependentStatusId = depStatus.DependentStatusId
                                                              INNER JOIN Policy.UwMemberDependentCase depCase ON dep.UwMemberDependentId = depCase.UwMemberDependentId
                                                              INNER JOIN Policy.UwMemberDependentCaseStatus DcStatus ON depCase.UwMemberDependentCaseStatusId = DcStatus.UwMemberDependentCaseStatusId
                                                            WHERE
                                                              mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND DcStatus.Code NOT IN (
                                                              'Undone' )
                                                              AND EffectiveDate <= ISNULL(DeactivationDate,
                                                              EffectiveDate)
                                                              --AND depStatus.Code <> 'Inactive'
                                                              AND depCase.IsMedicallyUnderwritten = 0 )
                                             )
                                        )
                                    AND ( @ExchangeAlternateId IS NULL
										  OR EXISTS ( SELECT  1 FROM Customers.UwMemberExchangeIdentifier exch
														INNER JOIN Customers.UwMember mem ON exch.UwMemberId = mem.UwMemberId
														WHERE mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId 
														AND exch.ExchangeAlternateId = @ExchangeAlternateId
													)
                
										)
                        ) InnerQuery
                WHERE   RowNum >= @LowerLimit
                        AND RowNum <= @UpperLimit
                        OR @PageSize IS NULL
                ORDER BY RowNum
            END
        ELSE 
            BEGIN
                SELECT  UwCustomerId ,
                        CustomerNumber ,
                        Name ,
                        DoingBusinessAs ,
                        ZipCode ,
                        StateCode ,
                        CustomerStatusId ,
                        CustomerStatusName ,
                        CityName,
						MarketingSegmentName
                FROM    ( SELECT    UwCustomerId ,
                                    CustomerNumber ,
                                    Name ,
                                    DoingBusinessAs ,
                                    ZipCode ,
                                    StateCode ,
                                    CustomerStatusId ,
                                    CustomerStatusName ,
                                    CityName ,
									MarketingSegmentName,
                                    CASE ISNULL(@SortField, 'Default')
                                      WHEN 'Default'
                                      THEN ROW_NUMBER() OVER ( ORDER BY UwCustomerId DESC, Name ASC )
                                      WHEN 'CustomerNumber'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CustomerNumber DESC, Name ASC )
                                      WHEN 'Name'
                                      THEN ROW_NUMBER() OVER ( ORDER BY Name DESC, Name ASC )
                                      WHEN 'DoingBusinessAs'
                                      THEN ROW_NUMBER() OVER ( ORDER BY DoingBusinessAs DESC, Name ASC )
                                      WHEN 'ZipCode'
                                      THEN ROW_NUMBER() OVER ( ORDER BY ZipCode DESC, Name ASC )
                                      WHEN 'StateCode'
                                      THEN ROW_NUMBER() OVER ( ORDER BY StateCode DESC, Name ASC )
                                      WHEN 'CustomerStatusId'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CustomerStatusId DESC, Name ASC )
                                      WHEN 'CustomerStatusName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CustomerStatusName DESC, Name ASC )
                                      WHEN 'CityName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY CityName DESC, Name ASC )
									   WHEN 'MarketingSegmentName'
                                      THEN ROW_NUMBER() OVER ( ORDER BY MarketingSegmentName Desc, Name ASC )
                                    END AS RowNum
                          FROM      Policy.[vUwCustomerSummary]
                          WHERE     ( @UwCustomerId IS NULL
                                      OR UwCustomerId = @UwCustomerId
                                    )
                                    AND ( @CustomerNumber IS NULL
                                          OR CustomerNumber = @CustomerNumber
                                        )
                                    AND ( @NameOrDoingBusinessAs IS NULL
                                          OR Name LIKE @NameOrDoingBusinessAs
                                          + '%'
                                          OR DoingBusinessAs LIKE @NameOrDoingBusinessAs
                                          + '%'
                                        )
                                    AND ( @ZipCode IS NULL
                                          OR ZipCode = @ZipCode
                                        )
                                    AND ( @StateCode IS NULL
                                          OR StateCode LIKE @StateCode + '%'
                                        )
									AND (@MarketingSegmentId IS NULL OR MarketingSegmentId=@MarketingSegmentId)
										AND (@ExcludeExchange IS NULL OR (MarketingSegmentId NOT IN (6) OR MarketingSegmentId IS null))
                                    AND ( CustomerStatusCode = 'Customer_Inforce'
                                          OR CustomerStatusCode = 'Customer_Terminated'
                                          OR CustomerStatusCode = 'Customer_Delinquent'
                                          OR ( ( CustomerStatusCode = 'Customer_Prospect'
                                                 OR CustomerStatusCode = 'Customer_Applicant'
                                               )
                                               AND EXISTS ( SELECT TOP 1
                                                              1
                                                            FROM
                                                              Policy.UwCustomerCase
                                                            WHERE
                                                              UwCustomerId = vUwCustomerSummary.UwCustomerId )
                                             )
                                        )
                                    AND ( ( @MemberNumber IS NULL
                                            AND @MemberFirstName IS NULL
                                            AND @MemberLastName IS NULL
                                          )
                                          OR EXISTS ( SELECT TOP 1
                                                              1
                                                      FROM    Customers.UwMember mem
                                                      WHERE   mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND ( @MemberNumber IS NULL
                                                              OR mem.MemberNumber = @MemberNumber
                                                              OR mem.MembershipNumber = @MemberNumber
                                                              )
                                                              AND ( @MemberFirstName IS NULL
                                                              OR CONTAINS ( mem.FirstName, @MemberFirstNameSearch )
                                                              )
                                                              AND ( @MemberLastName IS NULL
                                                              OR CONTAINS ( mem.LastName, @MemberLastNameSearch )
                                                              )
                                                    )
                                        )
                                    AND( @SSN IS NULL
											OR EXISTS(	SELECT TOP 1 1 
											FROM Customers.UwMember mem
											WHERE  mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
											AND mem.SSN = @SSN )
										)
											
                                    AND ( ( @DependentFirstName IS NULL
                                            AND @DependentLastName IS NULL
                                          )
                                          OR EXISTS ( SELECT  1
                                                      FROM    Customers.UwMemberDependent dep
                                                              INNER JOIN Customers.UwMember mem ON dep.UwMemberId = mem.UwMemberId
                                                      WHERE   mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND ( @DependentFirstName IS NULL
                                                              --OR dep.FirstName LIKE @DependentFirstName + '%'
                                                              OR CONTAINS ( dep.FirstName, @DependentFirstNameSearch )
                                                              )
                                                              AND ( @DependentLastName IS NULL
                                                              --OR dep.lastname like @DependentLastName +'%'
                                                              OR CONTAINS ( dep.LastName, @DependentLastNameSearch )
                                                              ) )
                                        )
                                    AND ( @MedicallyUnderwrittenType = 0
                                          OR ( @MedicallyUnderwrittenType = 1
                                               AND EXISTS ( SELECT
                                                              1
                                                            FROM
                                                              Customers.UwMember mem
                                                              INNER JOIN Customers.MemberStatus memStatus ON mem.MemberStatusId = memStatus.MemberStatusId
                                                              INNER JOIN Policy.UwMemberCase memCase ON mem.UwMemberId = memCase.UwMemberId
                                                              INNER JOIN Policy.UwMemberCaseStatus mcStatus ON memCase.UwMemberCaseStatusId = mcStatus.UwMemberCaseStatusId
                                                            WHERE
                                                              mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND mcStatus.Code NOT IN (
                                                              'Undone' )
                                                              --AND memStatus.Code <> 'Inactive'
                                                              AND EffectiveDate <= ISNULL(DeactivationDate,
                                                              EffectiveDate)
                                                              AND memCase.IsMedicallyUnderwritten = 0 )
                                             )
                                          OR ( @MedicallyUnderwrittenType = 2
                                               AND EXISTS ( SELECT
                                                              1
                                                            FROM
                                                              Customers.UwMember mem
                                                              INNER JOIN Customers.UwMemberDependent dep ON mem.UwMemberId = dep.UwMemberId
                                                              INNER JOIN Customers.DependentStatus depStatus ON dep.DependentStatusId = depStatus.DependentStatusId
                                                              INNER JOIN Policy.UwMemberDependentCase depCase ON dep.UwMemberDependentId = depCase.UwMemberDependentId
                                                              INNER JOIN Policy.UwMemberDependentCaseStatus DcStatus ON depCase.UwMemberDependentCaseStatusId = DcStatus.UwMemberDependentCaseStatusId
                                                            WHERE
                                                              mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId
                                                              AND DcStatus.Code NOT IN (
                                                              'Undone' )
                                                              AND EffectiveDate <= ISNULL(DeactivationDate,
                                                              EffectiveDate)
                                                              --AND depStatus.Code <> 'Inactive'
                                                              AND depCase.IsMedicallyUnderwritten = 0 )
                                             )
                                        )
                                    AND ( @ExchangeAlternateId IS NULL
										  OR EXISTS ( SELECT  1 FROM Customers.UwMemberExchangeIdentifier exch
														INNER JOIN Customers.UwMember mem ON exch.UwMemberId = mem.UwMemberId
														WHERE mem.UwCustomerId = Policy.[vUwCustomerSummary].UwCustomerId 
														AND exch.ExchangeAlternateId = @ExchangeAlternateId
													)
                
										)
                        ) InnerQuery
                WHERE   RowNum >= @LowerLimit
                        AND RowNum <= @UpperLimit
                        OR @PageSize IS NULL
                ORDER BY RowNum
            END

    END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UwMemberMove_MoveMemberBalance]
    @OriginalUwMemberId INT,
    @NewUwMemberID INT,
    @MovedByUserName VARCHAR(50)
AS
BEGIN
    DECLARE @CreditBatchID INT,
            @DebitBatchID INT,
            @BatchStatusId TINYINT,
            @OriginalAccountID INT,
            @NewAccountID INT,
            @Balance MONEY,
            @CurrentPTD DATETIME,
            @BillingPeriod DATETIME,
            @XPercent INT,
            @YPercent INT,
            @ChangeDate DATETIME,
            @OriginalUwCustomerId INT,
            @NewUwCustomerId INT,
            @BatchCreated BIT;

    SET @BatchCreated = 0;

    SELECT @BatchStatusId = BatchStatusId
    FROM Finance.BatchStatus
    WHERE Code = 'WIP';

    SET @BillingPeriod = dbo.GetFirstMonthDay2(DATEADD(MONTH, 1, GETDATE()));
    SET @XPercent = 10;
    SET @YPercent = 5;
    SET @ChangeDate = GETDATE();

	DECLARE @DebitAccountID INT
	DECLARE @CreditAccountID INT


 
    --BEGIN TRANSACTION;
    --BEGIN TRY

        DECLARE @count INT;
        SET @count = 1;

        SELECT @OriginalAccountID = OriginalMemAccount.AccountId,
               @NewAccountID = NewMemAccount.AccountId,
               @CurrentPTD = (
            SELECT dbo.GetLastMonthDate(PayThroughDate)
            FROM Finance.GetAdjustedPayThroughDateAccordingToCoverageMonths(
                                                                               OriginalMemAccount.AccountId,
                                                                               @BillingPeriod,
                                                                               @XPercent,
                                                                               @YPercent,
                                                                               NULL
                                                                           )
                             ),
              
               @OriginalUwCustomerId = OldCust.UwCustomerId,
               @NewUwCustomerId = NewCust.UwCustomerId
        FROM Customers.UwMember AS OriginalMem
            JOIN Finance.Account AS OriginalMemAccount
                ON OriginalMemAccount.UwMemberId = OriginalMem.UwMemberId
            JOIN Customers.UwCustomer AS OldCust
                ON OriginalMem.UwCustomerId = OldCust.UwCustomerId
            JOIN Customers.UwMember AS NewMem
                ON NewMem.UwMemberId = @NewUwMemberID
			JOIN Finance.Account AS NewMemAccount
                ON NewMemAccount.UwMemberId = NewMem.UwMemberID
            JOIN Customers.UwCustomer AS NewCust
                ON NewMem.UwCustomerId = NewCust.UwCustomerId
				WHERE OriginalMem.UwMemberId = @OriginalUwMemberId

IF(@OriginalAccountID IS NOT NULL AND @NewAccountID IS NOT NULL)
BEGIN
        SET @Balance = 0;
        SET @Balance = ISNULL(Finance.CalcPayThroughBalance(@OriginalAccountID, NULL, @OriginalUwmemberID, @CurrentPTD), 0);

		IF(@Balance < 0)
		  BEGIN
		     set @DebitAccountID = @OriginalAccountID
			 set @CreditAccountID = @NewAccountID
		  END
		 ELSE IF(@Balance > 0)
		  BEGIN
		     set @DebitAccountID = @NewAccountID
			 set @CreditAccountID = @OriginalAccountID
		  END

        IF @Balance <> 0
        BEGIN

            IF @BatchCreated = 0
            BEGIN
                INSERT INTO Finance.Batch
                (
                    BatchTypeId,
                    BatchStatusId,
                    TapeTotal,
                    BatchCloseDate,
                    EnteredBy,
                    IsTapeTotalModified
                )
                SELECT
                    (
                        SELECT BatchTypeId FROM Finance.BatchType WHERE Code = 'PrimaryAdjCredit'
                    ) BatchTypeId,
                    @BatchStatusId BatchStatusId,
                    NULL TapeTotal,
                    NULL BatchCloseDate,
                    @MovedByUserName EnteredBy,
                    0 IsTapeTotalModified;

                SET @CreditBatchID = SCOPE_IDENTITY();

                INSERT INTO Finance.BatchStatusHistory
                (
                    BatchId,
                    BatchStatusId,
                    StatusChangeDate,
                    ChangedBy
                )
                VALUES
                (@CreditBatchID, @BatchStatusId, @ChangeDate, @MovedByUserName);

                INSERT INTO Finance.Batch
                (
                    BatchTypeId,
                    BatchStatusId,
                    TapeTotal,
                    BatchCloseDate,
                    EnteredBy,
                    IsTapeTotalModified
                )
                SELECT
                    (
                        SELECT BatchTypeId FROM Finance.BatchType WHERE Code = 'PrimaryAdjDebit'
                    ) BatchTypeId,
                    @BatchStatusId BatchStatusId,
                    NULL TapeTotal,
                    NULL BatchCloseDate,
                    @MovedByUserName EnteredBy,
                    0 IsTapeTotalModified;

                SET @DebitBatchID = SCOPE_IDENTITY();

                INSERT INTO Finance.BatchStatusHistory
                (
                    BatchId,
                    BatchStatusId,
                    StatusChangeDate,
                    ChangedBy
                )
                VALUES
                (@DebitBatchID, @BatchStatusId, @ChangeDate, @MovedByUserName);

                SET @BatchCreated = 1;
            END;


            INSERT INTO Finance.BatchItem
            (
                BatchId,
                ItemNumber,
                PaymentNumber,
                Amount,
                AccountId,
                Comment
            )
            VALUES
            (   @DebitBatchID,               -- BatchId - int
                @count,                      -- ItemNumber - smallint
                NULL,                        -- PaymentNumber - varchar(15)
                ABS(@Balance),               -- Amount - money
                @DebitAccountID,          -- AccountId - int
                'Move balance to new member' -- Comment - varchar(8000)
                );

            INSERT INTO Finance.BatchItem
            (
                BatchId,
                ItemNumber,
                PaymentNumber,
                Amount,
                AccountId,
                Comment
            )
            VALUES
            (   @CreditBatchID,              -- BatchId - int
                @count,                      -- ItemNumber - smallint
                NULL,                        -- PaymentNumber - varchar(15)
                ABS(@Balance),               -- Amount - money
                @CreditAccountID,               -- AccountId - int
                'Move balance to new member' -- Comment - varchar(8000)
                );

         

            EXEC Underwriting.InsertAppComment @AppCommentId = 0,                                  -- int
                                               @AppId = NULL,                                      -- int
                                               @UwMemberId = @OriginalUwmemberID,                          -- int
                                               @UwMemberDependentId = NULL,                        -- int
                                               @UnderwritingGroupId = NULL,                        -- tinyint
                                               @Summary = 'balance moved to linked member', -- varchar(1024)
                                               @Details = '',                                      -- varchar(2048)
                                               @IsCriticalComment = 0,                             -- bit
                                               @CreationDate = @ChangeDate,                        -- datetime
                                               @LastUpdateDate = NULL,                             -- datetime
                                               @CreatedBy = @MovedByUserName,                      -- varchar(20)
                                               @UwCustomerId = @OriginalUwCustomerId;



            EXEC Underwriting.InsertAppComment @AppCommentId = 0,                                    -- int
                                               @AppId = NULL,                                        -- int
                                               @UwMemberId = @NewUwMemberID,                         -- int
                                               @UwMemberDependentId = NULL,                          -- int
                                               @UnderwritingGroupId = NULL,                          -- tinyint
                                               @Summary = 'balance moved to linked member', -- varchar(1024)
                                               @Details = '',                                        -- varchar(2048)
                                               @IsCriticalComment = 0,                               -- bit
                                               @CreationDate = @ChangeDate,                          -- datetime
                                               @LastUpdateDate = NULL,                               -- datetime
                                               @CreatedBy = @MovedByUserName,                        -- varchar(20)
                                               @UwCustomerId = @NewUwCustomerId;
        END;
END
    --    IF @@TRANCOUNT > 0
    --    BEGIN
    --        COMMIT TRANSACTION;
    --    END;

    --END TRY
    --BEGIN CATCH
    --    IF @@TRANCOUNT > 0
    --        ROLLBACK TRANSACTION;

    --END CATCH;

END;
 
 


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Policy].[UwMemberMove_UpdateUwMemberDemographicData]
  @uwMemberId INT,
  @firstName VARCHAR(50) = NULL,
  @lastName VARCHAR(50) = NULL ,
  @middleInitial VARCHAR(1) = NULL ,
  @SSN VARCHAR(9) = NULL ,
  @phone VARCHAR(20) = NULL ,
  @AlternatePhone VARCHAR(20) = NULL,
  @emailAddress VARCHAR(255) = NULL ,
  @birthDate DATETIME ,
  @address1 VARCHAR(255) = NULL ,
  @address2 VARCHAR(255) = NULL ,
  @zipCode VARCHAR(5) ,  
  @MailingAddress1 VARCHAR(255) = NULL,
  @MailingAddress2 VARCHAR(255) = NULL,  
  @MailingZipCode VARCHAR(5)= NULL,
  @CountyId INT = NULL
 
AS 
    BEGIN

       DECLARE @memberStatusId Int
       SET @memberStatusId = 1;  -- Active
	    
        UPDATE  [Customers].[UwMember]
        SET     [MemberStatusId] = @memberStatusId,
		        [FirstName] = @firstName,
                [LastName] = @lastName,
                [MiddleInitial] = @middleInitial,
                [SSN] = @SSN,
                [Phone] = @phone,
                [AlternatePhone] = @AlternatePhone,
                [EmailAddress] = @emailAddress,
                [BirthDate] = @birthDate,
                [Address1] = @address1,
                [Address2] = @address2,
                [ZipCode] = @zipCode,
                [MailingAddress1] = @MailingAddress1,
                [MailingAddress2] = @MailingAddress2,
                [MailingZipCode] = @MailingZipCode,
                [CountyId] = @CountyId
        WHERE   [UwMemberId] = @uwMemberId

 
       
		
        --UPDATE  [Customers].[Member]
        --SET     [FirstName] = dbo.Get_First_Letter_Upper(@firstName,' ,-_.#1234567890') ,
        --        [LastName] = dbo.Get_First_Letter_Upper(@lastName,' ,-_.#1234567890') ,
        --        [BirthDate] = @birthDate ,
        --        [Gender] = @gender ,
        --        [IncludeSpouse] = @IcludeSpouse ,
        --        [NumberOfChildren] = @NoOfChildren
        --WHERE   [MemberId] = @memberId

    END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UwMemberMove_MoveMemberBack]
    @SourceUwMemberId INT,
    @DestinationUwCustomerId INT,
    @DestinationUwMemberId INT,
	@DestinationZipCode VARCHAR(5),
    @MovedByUserName VARCHAR(50)
AS
BEGIN

    --Member Declaration
    DECLARE @memberStatusId INT,
            @firstName VARCHAR(50) = NULL,
            @middleInitial VARCHAR(1) = NULL,
            @lastName VARCHAR(50) = NULL,
            @SSN VARCHAR(9) = NULL,
            @phone VARCHAR(20) = NULL,
            @AlternatePhone VARCHAR(20) = NULL,
            @emailAddress VARCHAR(255) = NULL,
            @birthDate DATETIME,
            @address1 VARCHAR(255) = NULL,
            @address2 VARCHAR(255) = NULL,
            @MailingAddress1 VARCHAR(255) = NULL,
            @MailingAddress2 VARCHAR(255) = NULL,
            @MailingZipCode VARCHAR(5) = NULL,
            @CountyId INT = NULL,

		    @changeDate DATETIME,
			@DestinationMemberStatusId INT,
			@Details VARCHAR(2048),

			@SourceUwMemberNumber VARCHAR(22),
            @SourceCustomerNumber VARCHAR(255),
			@SourceUwCustomerId INT,
			@DestinationUwMemberNumber  VARCHAR(22),
            @DestinationCustomerNumber VARCHAR(255)



    SET @changeDate = GETDATE();
    SET @DestinationMemberStatusId = 1;
    SET @SourceUwMemberNumber = (SELECT  MemberNumber FROM Customers.UwMember WHERE UwMemberId = @SourceUwMemberId)
    SET @SourceCustomerNumber = (SELECT CustomerNumber FROM Customers.UwCustomer WHERE UwCustomerId = (SELECT UwCustomerId FROM Customers.UwMember WHERE UwMemberId = @SourceUwMemberId)) 
	SET @SourceUwCustomerId =  (SELECT UwCustomerId FROM Customers.UwMember WHERE UwMemberId = @SourceUwMemberId)
	set @DestinationUwMemberNumber = (SELECT MemberNumber FROM Customers.UwMember WHERE UwMemberId = @DestinationUwMemberId)
    SET @DestinationCustomerNumber = (SELECT CustomerNumber FROM Customers.UwCustomer WHERE UwCustomerId = @DestinationUwCustomerId) 
	SET @CountyId = (SELECT TOP 1 CountyId FROM dbo.County WHERE ZipCode = @DestinationZipCode )

    SELECT @firstName = um.FirstName,
           @middleInitial = um.MiddleInitial,
           @lastName = um.LastName,
           @SSN = um.SSN,
           @phone = um.Phone,
           @AlternatePhone = um.AlternatePhone,
           @emailAddress = um.EmailAddress,
           @birthDate = um.BirthDate,
           @address1 = um.Address1,
           @address2 = um.Address2,
           @MailingAddress1 = um.MailingAddress1,
           @MailingAddress2 = um.MailingAddress2,
           @MailingZipCode = um.MailingZipCode,
           @memberStatusId = um.MemberStatusId
    FROM Customers.UwMember AS um
    WHERE um.UwMemberId = @SourceUwMemberId;

    BEGIN TRANSACTION;
    BEGIN TRY
        EXEC [Policy].[UwMemberMove_UpdateUwMemberDemographicData] @uwMemberId = @DestinationUwMemberId,           -- int
                                                                   @firstName = @firstName,             -- varchar(50)
                                                                   @lastName = @lastName,               -- varchar(50)
                                                                   @middleInitial = @middleInitial,     -- varchar(1)
                                                                   @SSN = @SSN,                         -- varchar(9)
                                                                   @phone = @phone,                     -- varchar(20)
                                                                   @AlternatePhone = @AlternatePhone,   -- varchar(20)
                                                                   @emailAddress = @emailAddress,       -- varchar(255)
                                                                   @birthDate = @birthDate,             -- datetime
                                                                   @address1 = @address1,               -- varchar(255)
                                                                   @address2 = @address2,               -- varchar(255)
                                                                   @zipCode = @DestinationZipCode,                 -- varchar(5)
                                                                   @MailingAddress1 = @MailingAddress1, -- varchar(255)
                                                                   @MailingAddress2 = @MailingAddress2, -- varchar(255)
                                                                   @MailingZipCode = @MailingZipCode,   -- varchar(5)
                                                                   @CountyId = @CountyId;               -- int


        IF (@memberStatusId <> @DestinationMemberStatusId)
        BEGIN
            DECLARE @uwMemberStatusHistoryId INT;
            EXEC Customers.InsertUwMemberStatusHistory @changeDate = @changeDate,
                                                       @changedBy = @MovedByUserName,
                                                       @memberStatusId = @DestinationMemberStatusId,
                                                       @uwMemberId = @DestinationUwMemberId,
                                                       @uwMemberStatusHistoryId = @uwMemberStatusHistoryId OUTPUT;
        END;




        SET @Details
            = 'Primary Member number:' + @SourceUwMemberNumber + ' has been moved back from Customer Number "'
              + @SourceCustomerNumber + '" to Customer Number "' + @DestinationCustomerNumber + '" to member number :'
              + @DestinationUwMemberNumber;
        -- Source UwCustomer Comment
        EXEC Underwriting.InsertAppComment @AppCommentId = 0,                 -- int
                                           @AppId = NULL,                     -- int
                                           @UwMemberId = @SourceUwMemberId, -- int
                                           @UwMemberDependentId = NULL,       -- int
                                           @UnderwritingGroupId = NULL,       -- tinyint
                                           @Summary = 'Member Move',          -- varchar(1024)
                                           @Details = @Details,               -- varchar(2048)
                                           @IsCriticalComment = 0,            -- bit
                                           @CreationDate = @changeDate,       -- datetime
                                           @LastUpdateDate = NULL,            -- datetime
                                           @CreatedBy = @MovedByUserName,     -- varchar(20)
                                           @UwCustomerId = @SourceUwCustomerId;


        -- Destination UwCustomer Comment
        EXEC Underwriting.InsertAppComment @AppCommentId = 0,             -- int
                                           @AppId = NULL,                 -- int
                                           @UwMemberId = @DestinationUwMemberId,  -- int
                                           @UwMemberDependentId = NULL,   -- int
                                           @UnderwritingGroupId = NULL,   -- tinyint
                                           @Summary = 'Member Move',      -- varchar(1024)
                                           @Details = @Details,           -- varchar(2048)
                                           @IsCriticalComment = 0,        -- bit
                                           @CreationDate = @changeDate,   -- datetime
                                           @LastUpdateDate = NULL,        -- datetime
                                           @CreatedBy = @MovedByUserName, -- varchar(20)
                                           @UwCustomerId = @DestinationUwCustomerId;



        IF @@TRANCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;

        END;

    END TRY
    BEGIN CATCH
        PRINT 'error in  ' + CAST(@SourceUwMemberId AS VARCHAR(50));
        SELECT ERROR_MESSAGE();
        IF CURSOR_STATUS('global', 'depcur') >= -1
        BEGIN
            CLOSE depcur;
            DEALLOCATE depcur;
        END;
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

    END CATCH;

END;


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UwMemberMove_MoveMember]
    @OriginalUwMemberId INT,
    @NewUwCustomerId INT,
	@NewZipCode VARCHAR(5),
	@MembershipNumber VARCHAR(22),
    @MovedByUserName VARCHAR(50),
    @NewUwMemberId INT OUTPUT,
    @NewUwMemberNumber VARCHAR(22) OUTPUT
AS
BEGIN

    SELECT @NewUwMemberId = UwMemberId,
           @NewUwMemberNumber = MemberNumber
    FROM Customers.UwMember
    WHERE UwCustomerId = @NewUwCustomerId
          AND MembershipNumber = @MembershipNumber;

    IF (@NewUwMemberId IS NULL)
    BEGIN

        EXEC [Policy].[UwMemberMove_MoveMemberToNewCustomer] @OriginalUwMemberId = @OriginalUwMemberId,      -- int
                                                             @NewUwCustomerId = @NewUwCustomerId, 
															 @NewZipCode = @NewZipCode, 
                                                             @MovedByUserName = @MovedByUserName,            -- varchar(50)
                                                             @NewUwMemberId = @NewUwMemberId OUTPUT,         -- int
                                                             @NewUwMemberNumber = @NewUwMemberNumber OUTPUT; -- varchar(22)

    END;

    ELSE
    BEGIN
        EXEC [Policy].[UwMemberMove_MoveMemberBack] @SourceUwMemberId = @OriginalUwMemberId,        -- int
                                                    @DestinationUwCustomerId = @NewUwCustomerId, -- int
                                                    @DestinationUwMemberId = @NewUwMemberId,   -- int
													@DestinationZipCode = @NewZipCode,
                                                    @MovedByUserName = @MovedByUserName         -- varchar(50)
        
    END;

END;

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Policy].[UwMemberMove_InsertUwMemberMoveHistory]
@OriginalUwMemberId INT, 
@NewUwCustomerId INT, 
@MembershipNumber VARCHAR(22),
@NewZipCode VARCHAR(5),
@NewUwCustomerCaseIDs VARCHAR(150),
@NewUwMemberId INT, 
@NewUwMemberNumber VARCHAR(22),
@Status BIT,
@CreatedBy VARCHAR(20),
@CreationDate DATETIME,
@UwMemberMoveHistoryId INT OUT 
AS
BEGIN

	INSERT INTO [Policy].[UwMemberMoveHistory]
           ([OriginalUwMemberId]
           ,[NewUwCustomerId]
           ,[MembershipNumber]
           ,[NewZipCode]
           ,[NewUwCustomerCaseIDs]
           ,[NewUwMemberId]
           ,[NewUwMemberNumber]
           ,[Status]
           ,[CreatedBy]
           ,[CreationDate])
     VALUES
           (@OriginalUwMemberId,
		    @NewUwCustomerId, 
			@MembershipNumber,
			@NewZipCode,
			@NewUwCustomerCaseIDs,
            @NewUwMemberId,
            @NewUwMemberNumber,
			@Status,
			@CreatedBy,
			@CreationDate
			)

			SET @UwMemberMoveHistoryId = SCOPE_IDENTITY()
END


 


GO
