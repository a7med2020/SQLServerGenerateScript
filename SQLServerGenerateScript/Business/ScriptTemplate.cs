using SQLServerGenerateScript.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace SQLServerGenerateScript.Business
{
    public class ScriptTemplate
    {
        public static string GetDropIfExist(string scriptName, string schema, ScriptTypeEnum scriptType)
        {
            return $@"
    IF OBJECT_ID('[{schema}].[{scriptName}]', '{GetScriptTypeAcronym(scriptType)}') IS NOT NULL
    DROP {GetScriptSQLName(scriptType)} [{schema}].[{scriptName}]
                   ";
        }

        static string GetScriptTypeAcronym(ScriptTypeEnum scriptType)
        {
            switch (scriptType)
            {
                case ScriptTypeEnum.StoredProcedure:
                    return "P";
                case ScriptTypeEnum.UserDefinedFunction:
                    return "FN";
                default:
                    return "";

            }
        }

        static string GetScriptSQLName(ScriptTypeEnum scriptType)
        {
            switch (scriptType)
            {
                case ScriptTypeEnum.StoredProcedure:
                    return "PROCEDURE";
                case ScriptTypeEnum.UserDefinedFunction:
                    return "FUNCTION";
                default:
                    return "";

            }
        }


    }
}
